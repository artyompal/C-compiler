
#include "common.h"
#include "hash_table.h"
#include "x86_bincode.h"
#include "x86_optimizer.h"
#include "x86_opt_data_flow.h"
#include "x86_regalloc.h"


//
// ��� ����������.
// ����������� ����� � ������, ���������� � ������ ������� ��������� �86, � ������-���������.
static hash_id _variables_table[X86_TYPES_COUNT];

typedef struct variable_decl {
    x86_address         var_addr;
    int                 var_reg;
    x86_operand_type    var_type;
    BOOL                var_is_creating;
} variable;


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
// �������� ����������� ������� � ������.
static BOOL _cache_every_variable(function_desc *function, x86_operand_type type)
{
    x86_instruction *insn, *next;
    BOOL changed = FALSE;
    variable *var;

    for (insn = function->func_binary_code; insn; insn = next) {
        next = insn->in_next;

        // ����������� ������ ������� � ������ ����� ����������, ���� �����������.
        if (x86_equal_types(insn->in_op1.op_type, type) && OP_IS_ADDRESS(insn->in_op1) && insn->in_op1.data.address.base == ~x86reg_ebp) {
            var = hash_find(_variables_table[type], &insn->in_op1.data.address);

            if (!var && IS_DEFINING_INSN(insn->in_code, type)) {
                var = allocator_alloc(allocator_per_function_pool, sizeof(variable));
                memcpy(&var->var_addr, &insn->in_op1.data.address, sizeof(x86_address));

                var->var_type           = insn->in_op1.op_type;
                var->var_is_creating    = TRUE;

                bincode_create_operand_and_alloc_pseudoreg_in_function(function, &insn->in_op1, var->var_type);
                var->var_reg = insn->in_op1.data.reg;

                //printf("inserted op1 reg=%d address=[reg%d+reg%d%+d]\n", var->var_reg, var->var_addr.base, var->var_addr.index, var->var_addr.offset);

                hash_insert(_variables_table[type], var);
                changed = TRUE;
                continue;
            }

            if (var && var->var_is_creating) {
                //printf("replaced op1 reg=%d address=[reg%d+reg%d%+d]\n", var->var_reg, var->var_addr.base, var->var_addr.index, var->var_addr.offset);

                bincode_create_operand_from_pseudoreg(&insn->in_op1, insn->in_op1.op_type, var->var_reg);
                changed = TRUE;
                continue;
            }
        }

        // ����������� ������ �������.
        if (x86_equal_types(insn->in_op2.op_type, type) && OP_IS_ADDRESS(insn->in_op2) && insn->in_op2.data.address.base == ~x86reg_ebp) {
            var = hash_find(_variables_table[type], &insn->in_op2.data.address);

            if (!var && insn->in_code != x86insn_lea && insn->in_op2.data.address.offset > 0) {
                var = allocator_alloc(allocator_per_function_pool, sizeof(variable));
                memcpy(&var->var_addr, &insn->in_op2.data.address, sizeof(x86_address));

                var->var_type           = insn->in_op2.op_type;
                var->var_is_creating    = TRUE;

                if (insn->in_op2.data.address.offset > 0) {
                    bincode_insert_instruction(function, function->func_binary_code->in_next,
                        ENCODE_MOV(var->var_type), &insn->in_op2, &insn->in_op2);
                }

                bincode_create_operand_and_alloc_pseudoreg_in_function(function, &insn->in_op2, var->var_type);

                if (insn->in_op2.data.address.offset > 0) {
                    function->func_binary_code->in_next->in_op1 = insn->in_op2;
                }

                var->var_reg = insn->in_op2.data.reg;

                //printf("inserted op2 reg=%d address=[reg%d+reg%d%+d]\n", var->var_reg, var->var_addr.base, var->var_addr.index, var->var_addr.offset);

                hash_insert(_variables_table[type], var);
                changed = TRUE;
                continue;
            }

            if (var && var->var_is_creating && insn->in_code != x86insn_lea && (!OP_IS_THIS_PSEUDO_REG(insn->in_op1, type, var->var_reg)
                || !IS_MOV_INSN(insn->in_code))) {
                    //printf("replaced op2 reg=%d address=[reg%d+reg%d%+d]\n", var->var_reg, var->var_addr.base, var->var_addr.index, var->var_addr.offset);

                    bincode_create_operand_from_pseudoreg(&insn->in_op2, var->var_type, var->var_reg);
                    changed = TRUE;
                    continue;
                }
        }
    }

    return changed;
}

static void _reset_creating_flag(function_desc *function, x86_operand_type type)
{
    int var_count   = hash_get_count(_variables_table[type]);
    void **var_ptr  = hash_get_items(_variables_table[type]);
    variable *var;
    int i;

    for (i = 0; i < var_count; i++) {
        var = var_ptr[i];

        if (var) {
            var->var_is_creating = FALSE;
        }
    }
}

static void _flush_variable(function_desc *function, x86_operand_type type, x86_instruction *insn, variable *var)
{
    x86_operand reg, addr;

    addr.op_loc         = x86loc_address;
    addr.op_type        = var->var_type;
    addr.data.address   = var->var_addr;

    bincode_create_operand_from_pseudoreg(&reg, var->var_type, var->var_reg);
    bincode_insert_instruction(function, insn, ENCODE_MOV(var->var_type), &addr, &reg);
}

static BOOL _is_dirty_variable(function_desc *function, x86_operand_type type, x86_instruction *pos, int reg)
{
    x86_instruction **def = alloca(function->func_insn_count * sizeof(void*));
    int count;

    x86_dataflow_find_all_definitions(reg, pos, type, def, &count, function->func_insn_count);
    return (count != 0);
}

static BOOL _flush_all_contained_variables(function_desc *function, x86_operand_type type, x86_instruction *insn,
                                           symbol *sym, int reg)
{
    int var_count   = hash_get_count(_variables_table[type]);
    void **var_ptr  = hash_get_items(_variables_table[type]);
    BOOL changed = FALSE;
    variable *var;
    int offset;
    int i;

    for (i = 0; i < var_count; i++) {
        var = var_ptr[i];

        if (var) {
            if (var->var_addr.base != ~x86reg_ebp && var->var_addr.index != ~x86reg_ebp
                || var->var_reg == reg || !var->var_is_creating || !_is_dirty_variable(function, type, insn, var->var_reg)) {
                    continue;
                }

            offset = var->var_addr.offset;

            if (offset >= sym->sym_offset && offset < sym->sym_offset + type_calculate_sizeof(sym->sym_type)) {
                _flush_variable(function, type, insn, var);
                changed = TRUE;
            }
        }
    }

    return changed;
}

static BOOL _process_aliasing_variables(function_desc *function, x86_operand_type type, x86_instruction *insn,
                                        x86_address *addr, int reg)
{
    BOOL changed = FALSE;
    parameter *p;
    symbol *sym;
    int offset;

    if (addr->base != ~x86reg_ebp && addr->index != ~x86reg_ebp) {
        return FALSE;
    }

    offset = addr->offset;

    for (sym = function->func_locals.list_first; sym; sym = sym->sym_next) {
        if (offset >= sym->sym_offset && offset < sym->sym_offset + type_calculate_sizeof(sym->sym_type)) {
            changed |= _flush_all_contained_variables(function, type, insn, sym, reg);
        }
    }

    for (p = function->func_params->param_first; p; p = p->param_next) {
        sym = p->param_sym;

        if (offset >= sym->sym_offset && offset < sym->sym_offset + type_calculate_sizeof(sym->sym_type)) {
            changed |= _flush_all_contained_variables(function, type, insn, sym, reg);
        }
    }

    return changed;
}

static BOOL _reload_when_necessary(function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    BOOL changed = FALSE;

    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        if (OP_IS_ADDRESS(insn->in_op1)) {
            changed |= _process_aliasing_variables(function, type, insn, &insn->in_op1.data.address,
                (OP_IS_PSEUDO_REG(insn->in_op2, type) ? insn->in_op2.data.reg : NO_REG));
        } else if (OP_IS_ADDRESS(insn->in_op2)) {
            changed |= _process_aliasing_variables(function, type, insn, &insn->in_op2.data.address,
                (OP_IS_PSEUDO_REG(insn->in_op1, type) ? insn->in_op1.data.reg : NO_REG));
        }
    }

    return changed;
}

static BOOL _caching_pass(function_desc *function, x86_operand_type type)
{
    BOOL changed = FALSE;

    changed |= _cache_every_variable(function, type);

    x86_dataflow_init_use_def_tables(function, type);
    changed |= _reload_when_necessary(function, type);

    _reset_creating_flag(function, type);
    // TODO: ���� �� ������ �������� ��� ����� �����, ��� ��� �� �� ��������� �������������� �������������.

    return changed;
}


//
// ������� ���������� ������ �����������.
void x86_caching_init()
{
    _variables_table[x86op_dword] = hash_init((hash_function) _address_hash, (hash_equal_function) _address_compare);
    _variables_table[x86op_float] = hash_init((hash_function) _address_hash, (hash_equal_function) _address_compare);
}

void x86_caching_reset()
{
    hash_clear(_variables_table[x86op_dword]);
    hash_clear(_variables_table[x86op_float]);
}

BOOL x86_caching_pass(function_desc *function)
{
    BOOL changed = FALSE;

    changed |= _caching_pass(function, x86op_dword);
    changed |= _caching_pass(function, x86op_float);

    return changed;
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

