
#include "common.h"
#include "hash_table.h"
#include "x86_bincode.h"
#include "x86_optimizer.h"
#include "x86_opt_data_flow.h"


//
// Хеш переменных.
// Ассоциирует адрес в памяти, выраженный в рамках режимов адресации х86, с псевдо-регистром.
static hash_id _variables_table;

typedef struct variable_decl {
    x86_address     var_addr;
    int             var_reg;
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
            var = hash_find(_variables_table, &insn->in_op1.data.address);

            if (!var && IS_DEFINING_INSN(insn->in_code, type)) {
                var = allocator_alloc(allocator_per_function_pool, sizeof(variable));
                memcpy(&var->var_addr, &insn->in_op1.data.address, sizeof(x86_address));

                bincode_create_operand_and_alloc_pseudoreg_in_function(function, &insn->in_op1, insn->in_op1.op_type);
                var->var_reg = insn->in_op1.data.reg;

                //if (strstr(function->func_sym->sym_name, "clip"))
                //    printf("inserted op1 reg=%d address=[reg%d+reg%d%+d]\n", var->var_reg, var->var_addr.base,
                //        var->var_addr.index, var->var_addr.offset);

                hash_insert(_variables_table, var);
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
            var = hash_find(_variables_table, &insn->in_op2.data.address);

            if (!var && insn->in_code != x86insn_lea) {
                var = allocator_alloc(allocator_per_function_pool, sizeof(variable));
                memcpy(&var->var_addr, &insn->in_op2.data.address, sizeof(x86_address));

                bincode_insert_instruction(function, function->func_binary_code->in_next,
                    ENCODE_MOV(insn->in_op2.op_type), &insn->in_op2, &insn->in_op2);
                bincode_create_operand_and_alloc_pseudoreg_in_function(function,
                    &function->func_binary_code->in_next->in_op1, insn->in_op2.op_type);
                bincode_create_operand_from_pseudoreg(&insn->in_op2, insn->in_op2.op_type,
                    function->func_binary_code->in_next->in_op1.data.reg);

                var->var_reg = function->func_binary_code->in_next->in_op1.data.reg;

                //if (strstr(function->func_sym->sym_name, "clip"))
                //    printf("inserted op2 reg=%d address=[reg%d+reg%d%+d]\n", var->var_reg, var->var_addr.base,
                //        var->var_addr.index, var->var_addr.offset);

                hash_insert(_variables_table, var);
                continue;
            }

            if (var && insn->in_code != x86insn_lea) {
                //if (strstr(function->func_sym->sym_name, "clip"))
                //    printf("replaced op2 reg=%d address=[reg%d+reg%d%+d]\n", var->var_reg, var->var_addr.base,
                //        var->var_addr.index, var->var_addr.offset);

                bincode_create_operand_from_pseudoreg(&insn->in_op2, type, var->var_reg);
                continue;
            }
        }
    }
}

static void _caching_pass(function_desc *function, x86_operand_type type)
{
    //function->func_start_of_regvars[type] = function->func_pseudoregs_count[type];

    _cache_every_variable(function, type);
    x86_dataflow_init_alive_reg_tables(function, type);
}


//
// Внешние интерфейсы модуля кеширования.
void x86_caching_init()
{
    _variables_table = hash_init((hash_function) _address_hash, (hash_equal_function) _address_compare);
}

void x86_caching_pass(function_desc *function)
{
    hash_clear(_variables_table);

    _caching_pass(function, x86op_dword);
    _caching_pass(function, x86op_float);
}

