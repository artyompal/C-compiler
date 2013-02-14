
#include "common.h"
#include "hash_table.h"
#include "x86_bincode.h"
#include "x86_optimizer.h"
#include "x86_opt_data_flow.h"
#include "x86_regalloc.h"


//
// Хеш переменных.
// Ассоциирует адрес в памяти, выраженный в рамках режимов адресации х86, с псевдо-регистром.
// FIXME: нельзя ассоциировать адреса с переменными!!! один регистр может содержать в себе разные указатели.
static hash_id _variables_table[X86_TYPES_COUNT];


static unsigned int _address_hash(x86_address *addr)
{
    unsigned res = addr->base ^ addr->index ^ addr->offset;

    if (addr->index != NO_REG) {
        res ^= addr->scale;
    }

    return res;
}

static BOOL _address_compare(x86_address *key1, x86_address *key2)
{
    return (key1->base == key2->base && key1->index == key2->index && key1->offset == key2->offset
        && (key1->index == NO_REG || key1->scale == key2->scale));
}

//
// Создаёт закешированную переменную и, возможно, вставляет в начало функции код загрузки её в регистр.
static void _create_variable(function_desc *function, x86_operand_type type, x86_instruction *insn, x86_operand *op)
{
    x86_variable *var;

    var = allocator_alloc(allocator_per_function_pool, sizeof(x86_variable));

    var->var_addr           = op->data.address;
    var->var_type           = op->op_type;
    var->var_is_creating    = TRUE;

    if (op->data.address.offset > 0) {
        bincode_insert_instruction(function, function->func_binary_code->in_next, ENCODE_MOV(var->var_type), op, op);
    }

    bincode_create_operand_and_alloc_pseudoreg_in_function(function, op, var->var_type);
    var->var_reg = op->data.reg;

    if (op->data.address.offset > 0) {
        function->func_binary_code->in_next->in_op1 = *op;
    }

    hash_insert(_variables_table[type], var);
}

//
// Заменяет все переменные в памяти данного типа на регистры.
static BOOL _cache_every_variable(function_desc *function, x86_operand_type type)
{
    x86_instruction *insn, *next;
    BOOL changed = FALSE;
    x86_variable *var;

    for (insn = function->func_binary_code; insn; insn = next) {
        next = insn->in_next;

        // Анализируем первый операнд и создаём новую переменную, если потребуется.
        if (x86_equal_types(insn->in_op1.op_type, type) && OP_IS_ADDRESS(insn->in_op1) && insn->in_op1.data.address.base == ~x86reg_ebp) {
            var = hash_find(_variables_table[type], &insn->in_op1.data.address);

            if (!var && insn->in_code != x86insn_movq) {
                _create_variable(function, type, insn, &insn->in_op1);
                //printf("inserted op1 reg=%d address=[reg%d+reg%d%+d]\n", var->var_reg, var->var_addr.base, var->var_addr.index, var->var_addr.offset);

                changed = TRUE;
                continue;
            }

            if (var && var->var_is_creating) {
                bincode_create_operand_from_pseudoreg(&insn->in_op1, insn->in_op1.op_type, var->var_reg);
                //printf("replaced op1 reg=%d address=[reg%d+reg%d%+d]\n", var->var_reg, var->var_addr.base, var->var_addr.index, var->var_addr.offset);

                changed = TRUE;
                continue;
            }
        }

        // Анализируем второй операнд.
        if (x86_equal_types(insn->in_op2.op_type, type) && OP_IS_ADDRESS(insn->in_op2) && insn->in_op2.data.address.base == ~x86reg_ebp) {
            var = hash_find(_variables_table[type], &insn->in_op2.data.address);

            if (!var && insn->in_code != x86insn_lea && insn->in_code != x86insn_movq) {
                _create_variable(function, type, insn, &insn->in_op2);
                //printf("inserted op2 reg=%d address=[reg%d+reg%d%+d]\n", var->var_reg, var->var_addr.base, var->var_addr.index, var->var_addr.offset);

                changed = TRUE;
                continue;
            }

            if (var && var->var_is_creating && insn->in_code != x86insn_lea) {
                //printf("replaced op2 reg=%d address=[reg%d+reg%d%+d]\n", var->var_reg, var->var_addr.base, var->var_addr.index, var->var_addr.offset);

                bincode_create_operand_from_pseudoreg(&insn->in_op2, var->var_type, var->var_reg);
                changed = TRUE;
                continue;
            }
        }
    }

    return changed;
}

//
// Проверяет, была ли переменная модифицирована.
// Возвращает TRUE, если есть доступные определения.
static BOOL _is_dirty_variable(function_desc *function, x86_operand_type type, x86_instruction *pos, int reg)
{
    x86_instruction **def = alloca(function->func_insn_count * sizeof(void*));
    int count;

    x86_dataflow_find_all_definitions(reg, pos, type, def, &count, function->func_insn_count);
    return (count != 0);
}

//
// Флашит одну переменную.
static BOOL _flush_variable(function_desc *function, x86_operand_type type, x86_instruction *insn, x86_variable *var, int reg)
{
    x86_operand regop, addr;

    if (!var->var_is_creating || !_is_dirty_variable(function, type, insn, var->var_reg) || var->var_reg == reg) {
        return FALSE;
    }

    addr.op_loc         = x86loc_address;
    addr.op_type        = var->var_type;
    addr.data.address   = var->var_addr;

    bincode_create_operand_from_pseudoreg(&regop, var->var_type, var->var_reg);
    bincode_insert_instruction(function, insn, ENCODE_MOV(var->var_type), &addr, &regop);
    return TRUE;
}

//
// Находит все переменные, пересекающиеся в памяти с данной.
static void _find_all_aliased_variables(function_desc *function, x86_operand_type type, x86_address *addr,
    symbol *sym, x86_variable **var_arr, int *var_count, int var_max_count)
{
    int var_table_count     = hash_get_count(_variables_table[type]);
    void **var_table_ptr    = hash_get_items(_variables_table[type]);
    x86_variable *var;
    int offset;
    int i;

    *var_count = 0;

    for (i = 0; i < var_table_count; i++) {
        var = var_table_ptr[i];

        if (var) {
            if (var->var_addr.base != ~x86reg_ebp && var->var_addr.index != ~x86reg_ebp) {
                continue;
            }

            offset = var->var_addr.offset;

            if (offset >= sym->sym_offset && offset < sym->sym_offset + type_calculate_sizeof(sym->sym_type)) {
                var_arr[(*var_count)++] = var;
                ASSERT(*var_count < var_max_count);
            }
        }
    }
}

//
// Находит все переменные, пересекающиеся с заданным адресом.
int x86_caching_find_aliasing_variables(function_desc *function, x86_operand_type type, x86_address *addr,
    x86_variable **var_arr, int var_max_count)
{
    int offset, count, var_count = 0;
    parameter *p;
    symbol *sym;

    if (addr->base != ~x86reg_ebp && addr->index != ~x86reg_ebp) {
        return 0;
    }

    offset = addr->offset;

    for (sym = function->func_locals.list_first; sym; sym = sym->sym_next) {
        if (offset >= sym->sym_offset && offset < sym->sym_offset + type_calculate_sizeof(sym->sym_type)) {
            _find_all_aliased_variables(function, type, addr, sym, var_arr, &count, var_max_count - var_count);
            var_count += count;
        }
    }

    for (p = function->func_params->param_first; p; p = p->param_next) {
        sym = p->param_sym;

        if (offset >= sym->sym_offset && offset < sym->sym_offset + type_calculate_sizeof(sym->sym_type)) {
            _find_all_aliased_variables(function, type, addr, sym, var_arr, &count, var_max_count - var_count);
            var_count += count;
        }
    }

    return var_count;
}

//
// Находит и флашит все закешированные переменные, накладывающиеся на данный адрес.
static BOOL _flush_aliasing_variables(function_desc *function, x86_operand_type type, x86_instruction *insn,
    x86_address *addr, int reg)
{
    x86_variable **var_arr = alloca(sizeof(void*) * function->func_insn_count);
    BOOL changed = FALSE;
    int i, var_count;

    var_count = x86_caching_find_aliasing_variables(function, type, addr, var_arr, function->func_insn_count);

    for (i = 0; i < var_count; i++) {
        changed |= _flush_variable(function, type, insn, var_arr[i], reg);
    }

    return changed;
}

//
// Для каждого адреса, находит все закешированные переменные, конфликтующие с ним.
static BOOL _flush_when_necessary(function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    BOOL changed = FALSE;

    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        if (OP_IS_ADDRESS(insn->in_op1)) {
            changed |= _flush_aliasing_variables(function, type, insn, &insn->in_op1.data.address,
                (OP_IS_PSEUDO_REG(insn->in_op2, type) ? insn->in_op2.data.reg : NO_REG));
        } else if (OP_IS_ADDRESS(insn->in_op2)) {
            changed |= _flush_aliasing_variables(function, type, insn, &insn->in_op2.data.address,
                (OP_IS_PSEUDO_REG(insn->in_op1, type) ? insn->in_op1.data.reg : NO_REG));
        }
    }

    return changed;
}

//
// Сбрасывает флаг var_is_creating во всех переменных. Переменные, созданные на этом проходе,
// будут игнорироваться при следующих проходах кеширования.
static void _reset_creating_flag(function_desc *function, x86_operand_type type)
{
    int var_count   = hash_get_count(_variables_table[type]);
    void **var_ptr  = hash_get_items(_variables_table[type]);
    x86_variable *var;
    int i;

    for (i = 0; i < var_count; i++) {
        var = var_ptr[i];

        if (var) {
            var->var_is_creating = FALSE;
        }
    }
}

//
// Один проход кеширования: пытается закешировать все переменные данного типа.
// Здесь должны добавляться все необходимые загрузки/сохранения, такие, чтобы код оставался корректен.
static BOOL _caching_pass(function_desc *function, x86_operand_type type)
{
    BOOL changed = FALSE;

    changed |= _cache_every_variable(function, type);

    x86_dataflow_init_use_def_tables(function, type);
    changed |= _flush_when_necessary(function, type);

    // TODO: было бы хорошо обойтись без флага var_is_creating, так как он не позволяет оптимизировать многопроходно.
    _reset_creating_flag(function, type);

    // TODO: Если внести все кейсы алайсинга как неоднозначные определения в ои-цепочки,
    // то перегружать переменные надо тогда и только тогда, когда в ои-цепочке присутствует
    // хоть одно неоднозначное определение.

    return changed;
}


//
// Внешние интерфейсы модуля кеширования.
void x86_caching_init()
{
    _variables_table[x86op_dword] = hash_init((hash_function) _address_hash, (hash_equal_function) _address_compare);
    _variables_table[x86op_float] = hash_init((hash_function) _address_hash, (hash_equal_function) _address_compare);
}

//
// Очищает структуры модуля кеширования. Должно вызываться один раз на функцию, перед началом оптимизаций.
void x86_caching_reset()
{
    hash_clear(_variables_table[x86op_dword]);
    hash_clear(_variables_table[x86op_float]);
}

//
// Выполняет один проход оптимизации кеширования переменных для всех поддерживаемых типов переменных.
BOOL x86_caching_pass(function_desc *function)
{
    BOOL changed = FALSE;

    changed |= _caching_pass(function, x86op_dword);
    changed |= _caching_pass(function, x86op_float);

    return changed;
}

//
// Копирует информацию об адресах переменных в структуры аллокатора регистров.
void x86_caching_setup_reg_info(function_desc *function, x86_pseudoreg_info *pseudoregs_map, x86_operand_type type)
{
    int var_count, i, reg;
    x86_variable **var_ptr;

    var_ptr     = (x86_variable **) hash_get_items(_variables_table[type]);
    var_count   = hash_get_count(_variables_table[type]);

    for (i = 0; i < var_count; i++) {
        if (var_ptr[i] && var_ptr[i]->var_addr.base == ~x86reg_ebp) {
            reg = var_ptr[i]->var_reg;
            ASSERT(reg < function->func_pseudoregs_count[type]);

            pseudoregs_map[reg].reg_stack_location = var_ptr[i]->var_addr.offset;
        }
    }
}

