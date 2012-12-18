
#include "common.h"
#include "hash_table.h"
#include "x86_bincode.h"
#include "x86_optimizer.h"
#include "x86_opt_data_flow.h"
#include "x86_regalloc.h"


//
// Хеш переменных.
// Ассоциирует адрес в памяти, выраженный в рамках режимов адресации х86, с псевдо-регистром.
static hash_id _variables_table[X86_TYPES_COUNT];

typedef struct variable_decl {
    x86_address         var_addr;
    int                 var_reg;
} variable;


static unsigned int _address_hash(x86_address *addr)
{
    unsigned res = addr->base ^ addr->index ^ addr->offset;

    if (addr->index != 0) {
        res ^= addr->scale;
    }

    return res;
}

static int _address_compare(x86_address *key1, x86_address *key2)
{
    return (key1->base == key2->base && key1->index == key2->index && key1->offset == key2->offset
        && (key1->index == 0 || key1->scale == key2->scale));
}


//
// Алгоритм кеширования адресов в памяти.
static void _cache_every_variable(function_desc *function, x86_operand_type type)
{
    x86_instruction *insn, *next;
    variable *var;

    for (insn = function->func_binary_code; insn; insn = next) {
        next = insn->in_next;

        // Анализируем первый операнд и создаём новую переменную, если потребуется.
        if (x86_equal_types(insn->in_op1.op_type, type) && OP_IS_ADDRESS(insn->in_op1) && insn->in_op1.data.address.base == ~x86reg_ebp) {
            var = hash_find(_variables_table[type], &insn->in_op1.data.address);

            if (!var && IS_DEFINING_INSN(insn->in_code, type)) {
                var = allocator_alloc(allocator_per_function_pool, sizeof(variable));
                memcpy(&var->var_addr, &insn->in_op1.data.address, sizeof(x86_address));

                bincode_create_operand_and_alloc_pseudoreg_in_function(function, &insn->in_op1, insn->in_op1.op_type);
                var->var_reg    = insn->in_op1.data.reg;

                //if (strstr(function->func_sym->sym_name, "clip"))
                //    printf("inserted op1 reg=%d address=[reg%d+reg%d%+d]\n", var->var_reg, var->var_addr.base,
                //        var->var_addr.index, var->var_addr.offset);

                hash_insert(_variables_table[type], var);
                continue;
            }

            if (var) {
                //if (strstr(function->func_sym->sym_name, "clip"))
                //    printf("replaced op1 reg=%d address=[reg%d+reg%d%+d]\n", var->var_reg, var->var_addr.base,
                //        var->var_addr.index, var->var_addr.offset);

                bincode_create_operand_from_pseudoreg(&insn->in_op1, insn->in_op1.op_type, var->var_reg);
                continue;
            }
        }

        // Анализируем второй операнд.
        if (x86_equal_types(insn->in_op2.op_type, type) && OP_IS_ADDRESS(insn->in_op2) && insn->in_op2.data.address.base == ~x86reg_ebp) {
            var = hash_find(_variables_table[type], &insn->in_op2.data.address);

            if (!var && insn->in_code != x86insn_lea) {
                var = allocator_alloc(allocator_per_function_pool, sizeof(variable));
                memcpy(&var->var_addr, &insn->in_op2.data.address, sizeof(x86_address));

                if (insn->in_op2.data.address.offset > 0) {
                    bincode_insert_instruction(function, function->func_binary_code->in_next,
                        ENCODE_MOV(insn->in_op2.op_type), &insn->in_op2, &insn->in_op2);
                }

                bincode_create_operand_and_alloc_pseudoreg_in_function(function, &insn->in_op2, insn->in_op2.op_type);

                function->func_binary_code->in_next->in_op1 = insn->in_op2;
                var->var_reg = insn->in_op2.data.reg;

                //if (strstr(function->func_sym->sym_name, "clip"))
                //    printf("inserted op2 reg=%d address=[reg%d+reg%d%+d]\n", var->var_reg, var->var_addr.base,
                //        var->var_addr.index, var->var_addr.offset);

                hash_insert(_variables_table[type], var);
                continue;
            }

            if (var && insn->in_code != x86insn_lea) {
                //if (strstr(function->func_sym->sym_name, "clip"))
                //    printf("replaced op2 reg=%d address=[reg%d+reg%d%+d]\n", var->var_reg, var->var_addr.base,
                //        var->var_addr.index, var->var_addr.offset);

                bincode_create_operand_from_pseudoreg(&insn->in_op2, insn->in_op2.op_type, var->var_reg);
                continue;
            }
        }
    }
}

static void _caching_pass(function_desc *function, x86_operand_type type)
{
    //function->func_start_of_regvars[type] = function->func_pseudoregs_count[type];

    _cache_every_variable(function, type);
}


//
// Внешние интерфейсы модуля кеширования.
void x86_caching_init()
{
    _variables_table[x86op_dword] = hash_init((hash_function) _address_hash, (hash_equal_function) _address_compare);
    _variables_table[x86op_float] = hash_init((hash_function) _address_hash, (hash_equal_function) _address_compare);
}

void x86_caching_pass(function_desc *function)
{
    hash_clear(_variables_table[x86op_dword]);
    hash_clear(_variables_table[x86op_float]);

    _caching_pass(function, x86op_dword);
    _caching_pass(function, x86op_float);
}

void x86_caching_setup_reg_info(function_desc *function, x86_pseudoreg_info *pseudoregs_map, x86_operand_type type)
{
    int var_count, i, reg;
    variable **var_ptr;

    var_ptr     = (variable **) hash_get_items(_variables_table[type]);
    var_count   = hash_get_count(_variables_table[type]);

    for (i = 0; i < var_count; i++) {
        if (var_ptr[i] && var_ptr[i]->var_addr.base == ~x86reg_ebp) {
            reg = var_ptr[i]->var_reg;
            ASSERT(reg < function->func_pseudoregs_count[type]);

            pseudoregs_map[reg].reg_stack_location = var_ptr[i]->var_addr.offset;
        }
    }
}

