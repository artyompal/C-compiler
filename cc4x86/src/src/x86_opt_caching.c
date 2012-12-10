
#include "common.h"
#include "hash_table.h"
#include "x86_bincode.h"
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
static void _build_addresses_table(function_desc *function, x86_operand_type type)
{
    x86_instruction *insn, *next;
    variable *var;

    for (insn = function->func_binary_code; insn; insn = next) {
        next = insn->in_next;

        // Анализируем первый операнд и создаём новую переменную, если потребуется.
        if (x86_equal_types(insn->in_op1.op_type, type) && OP_IS_ADDRESS(insn->in_op1)) {
            var = hash_find(_variables_table, &insn->in_op1.data.address);

            if (!var && IS_DEFINING_INSN(insn->in_code, type) && OP_IS_PSEUDO_REG(insn->in_op2, type)) {
                var = allocator_alloc(allocator_per_function_pool, sizeof(variable));
                memcpy(&var->var_addr, &insn->in_op1.data.address, sizeof(x86_address));

                bincode_create_operand_and_alloc_pseudoreg_in_function(function, &insn->in_op1, type);
                var->var_reg = insn->in_op1.data.reg;

                //if (strstr(function->func_sym->sym_name, "clip"))
                //    printf("inserted reg=%d address=[reg%d+reg%d%+d]\n", var->var_reg, var->var_addr.base,
                //        insn->in_op1.data.address.index, insn->in_op1.data.address.offset);

                hash_insert(_variables_table, var);
                continue;
            }

            if (var) {
                bincode_create_operand_from_pseudoreg(&insn->in_op1, type, var->var_reg);
                continue;
            }
        }

        // Анализируем второй операнд и заменяем адрес на регистр, если он найден.
        if (x86_equal_types(insn->in_op2.op_type, type) && OP_IS_ADDRESS(insn->in_op2)) {
            var = hash_find(_variables_table, &insn->in_op2.data.address);

            if (var) {
                //if (strstr(function->func_sym->sym_name, "clip"))
                //    printf("replaced reg=%d address=[reg%d+reg%d%+d]\n", var->var_reg,
                //        insn->in_op2.data.address.base,
                //        insn->in_op2.data.address.index,
                //        insn->in_op2.data.address.offset);

                bincode_create_operand_from_pseudoreg(&insn->in_op2, type, var->var_reg);
                continue;
            }
        }
    }
}

static void _cache_every_address(function_desc *function, x86_operand_type type)
{
    _build_addresses_table(function, type);
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

    _cache_every_address(function, x86op_dword);
    _cache_every_address(function, x86op_float);
}

