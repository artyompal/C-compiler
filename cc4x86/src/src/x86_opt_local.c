
#include "common.h"
#include "x86_bincode.h"
#include "x86_optimizer.h"
#include "x86_regalloc.h"
#include "x86_opt_data_flow.h"


#define ADDRESS_IS_BASE(OP)                 ((OP).data.address.base > 0 && (OP).data.address.index == 0 \
                                                && (OP).data.address.offset == 0)
#define ADDRESS_IS_UNSCALED_INDEX(OP)       ((OP).data.address.base == 0 && (OP).data.address.index > 0 \
                                                && (OP).data.address.offset == 0  && (OP).data.address.scale == 1)
#define ADDRESS_IS_BASE_OFS(OP)             ((OP).data.address.base > 0 && (OP).data.address.index == 0)
#define ADDRESS_IS_UNSCALED_INDEX_OFS(OP)   ((OP).data.address.base == 0 && (OP).data.address.index > 0 \
                                                && (OP).data.address.scale == 1)

static x86_instruction  **_usage_arr;
static int              _usage_count;
static int              _usage_max_count;


//
//
// Вспомогательные функции для проверки и оптимизации кода в специальных случаях.
//
//

//
// Заменяет регистр смещением символа. Используется для устранения LEA.
static BOOL _replace_register_with_symbol_offset(x86_instruction *insn, int reg, symbol *sym)
{
    if (bincode_operand_contains_register(&insn->in_op1, x86op_dword, reg)) {
        if (insn->in_op1.op_loc == x86loc_address && ADDRESS_IS_BASE_OFS(insn->in_op1)) {
            insn->in_op1.op_loc             = x86loc_symbol;
            insn->in_op1.data.sym.name      = sym;
            insn->in_op1.data.sym.offset    = insn->in_op1.data.address.offset;
        } else {
            return FALSE;
        }
    }

    if (bincode_operand_contains_register(&insn->in_op2, x86op_dword, reg)) {
        if (insn->in_op2.op_loc == x86loc_address && ADDRESS_IS_BASE_OFS(insn->in_op2)) {
            insn->in_op2.op_loc             = x86loc_symbol;
            insn->in_op2.data.sym.name      = sym;
            insn->in_op2.data.sym.offset    = insn->in_op2.data.address.offset;
        } else if (insn->in_op2.op_loc == x86loc_register) {
            insn->in_op2.op_loc             = x86loc_symbol_offset;
            insn->in_op2.data.sym.name      = sym;
            insn->in_op2.data.sym.offset    = 0;
        } else {
            return FALSE;
        }
    }

    return TRUE;
}

//
// Заменяет регистр другим регистром. Используется для устранения лишних копирований регистров.
static void _replace_register_in_instruction(x86_instruction *insn, int reg, int reg2)
{
    int *regs[MAX_REGISTERS_PER_INSN];
    int regs_cnt, i;

    bincode_extract_pseudoregs_from_insn(insn, x86op_dword, regs, &regs_cnt);

    for (i = 0; i < regs_cnt; i++) {
        if (*regs[i] == reg) {
            *regs[i] = reg2;
        }
    }
}

//
// Проверяет, что регистр используется только в текущем блоке и только в константных контекстах.
// Берёт информацию из глобальных переменных _usage_arr, _usage_count.
static BOOL _check_locality_and_constantness(x86_instruction *insn, int reg)
{
    x86_operand_type type = x86op_dword;
    int i;

    // проверяем, что регистр используется только в read-only контекстах
    for (i = 0; i < _usage_count; i++) {
        if (_usage_arr[i]->in_block != insn->in_block || bincode_is_pseudoreg_modified_by_insn(_usage_arr[i], type, reg)) {
            return FALSE;
        }
    }

    return TRUE;
}

//
// Заменяет все использования регистра на смещение символа, и если это всегда удаётся, удаляем инструкцию LEA.
static void _try_optimize_lea_reg_symbol(function_desc *function, x86_instruction *lea)
{
    x86_operand_type type = x86op_dword;
    int reg, i;

    reg = lea->in_op1.data.reg;
    x86_dataflow_find_all_usages_of_definition(reg, lea, type, _usage_arr, &_usage_count, _usage_max_count);

    if (!_check_locality_and_constantness(lea, reg)) {
        return;
    }

    for (i = 0; i < _usage_count; i++) {
        if (!_replace_register_with_symbol_offset(_usage_arr[i], reg, lea->in_op2.data.sym.name)) {
            return;
        }
    }

    x86_dataflow_erase_instruction(function, lea);
}

//
// Пробует убрать инструкцию LEA.
static void _try_optimize_lea_reg_address(function_desc *function, x86_instruction *lea)
{
    x86_instruction *block_end, *usage;
    x86_operand_type type = x86op_dword;
    int reg, reg2, usages_handled;

    reg = lea->in_op1.data.reg;
    x86_dataflow_find_all_usages_of_definition(reg, lea, type, _usage_arr, &_usage_count, _usage_max_count);

    if (!_check_locality_and_constantness(lea, reg)) {
        return;
    }

    block_end = lea->in_block->block_last_insn->in_next;

    // Если инструкция - тривиальный LEA вроде LEA EAX,[EDX] или LEA EAX,[EDX*1], то просто устраняем её.
    if (ADDRESS_IS_BASE(lea->in_op2) || ADDRESS_IS_UNSCALED_INDEX(lea->in_op2)) {
        reg2 = (ADDRESS_IS_BASE(lea->in_op2) ? lea->in_op2.data.address.base : lea->in_op2.data.address.index);

        for (usage = lea->in_next, usages_handled = 0; usages_handled < _usage_count; usage = usage->in_next) {
            ASSERT(usage != block_end);

            if (bincode_is_pseudoreg_modified_by_insn(usage, type, reg2)) {
                return;
            }

            if (aux_binary_search((int*)_usage_arr, _usage_count, (int)usage) >= 0) {
                usages_handled++;
                _replace_register_in_instruction(usage, reg, reg2);
            }
        }

        x86_dataflow_erase_instruction(function, lea);
    }
}

//
// Ищет определение данного регистра в пределах текущего блока.
static x86_instruction *_find_local_definition(function_desc *function, x86_instruction *insn, int reg)
{
    for (insn = insn->in_prev; insn && insn != insn->in_block->block_leader->in_prev; insn = insn->in_prev) {
        if (bincode_is_pseudoreg_modified_by_insn(insn, x86op_dword, reg)) {
            return insn;
        }
    }

    return NULL;
}

//
// Проверяет факт того, что значение больше не будет кем-то использоваться.
static BOOL _is_unused_anymore(function_desc *function, x86_instruction *insn, int reg)
{
    x86_dataflow_set_current_insn(function, x86op_dword, insn);
    return !x86_dataflow_is_pseudoreg_alive_after(reg);
}

//
// Пытается объединить поместить арифметическую операцию в адрес.
static BOOL _can_combine_address_and_insn(int reg, x86_operand *addr, x86_instruction *insn)
{
    if (insn->in_code == x86insn_int_add && OP_IS_THIS_PSEUDO_REG(insn->in_op1, x86op_dword, reg) && OP_IS_CONSTANT(insn->in_op2)) {
        addr->data.address.offset       += insn->in_op2.data.int_val;
        return TRUE;
    } else if (insn->in_code == x86insn_int_mov && OP_IS_CONSTANT(insn->in_op2)
        && addr->data.address.base > 0 && OP_IS_THIS_PSEUDO_REG(insn->in_op1, x86op_dword, addr->data.address.base)) {
            addr->data.address.base     = 0;
            addr->data.address.offset   += insn->in_op2.data.int_val;
            return TRUE;
    } else if (insn->in_code == x86insn_int_mov && OP_IS_CONSTANT(insn->in_op2)
        && addr->data.address.index > 0 && addr->data.address.scale == 1 && OP_IS_THIS_PSEUDO_REG(insn->in_op1, x86op_dword, addr->data.address.index)) {
            addr->data.address.index    = 0;
            addr->data.address.offset   += insn->in_op2.data.int_val;
            return TRUE;
    } else if (insn->in_code == x86insn_int_add && OP_IS_THIS_PSEUDO_REG(insn->in_op1, x86op_dword, reg)
        && OP_IS_PSEUDO_REG(insn->in_op2, x86op_dword) && (ADDRESS_IS_BASE_OFS(*addr) || ADDRESS_IS_UNSCALED_INDEX_OFS(*addr))) {
            addr->data.address.base     = (addr->data.address.base > 0 ? addr->data.address.base : addr->data.address.index);
            addr->data.address.index    = insn->in_op2.data.reg;
            addr->data.address.scale    = 1;
            return TRUE;
    } else if (insn->in_code == x86insn_lea && (ADDRESS_IS_BASE_OFS(*addr) || ADDRESS_IS_UNSCALED_INDEX_OFS(*addr))) {
        addr->data.address.base     = insn->in_op2.data.address.base;
        addr->data.address.index    = insn->in_op2.data.address.index;
        addr->data.address.scale    = insn->in_op2.data.address.scale;
        addr->data.address.offset   += insn->in_op2.data.address.offset;
        return TRUE;
    } else {
        return FALSE;
    }
}

//
// Пытается поместить в адрес столько вычислений, сколько возможно.
static void _try_optimize_address(function_desc *function, x86_instruction *insn, x86_operand *addr)
{
    x86_operand_type type = x86op_dword;
    x86_instruction *def, *usage;
    x86_operand *found;
    BOOL allowed;
    int reg;

    if (addr->data.address.base > 0) {
        reg = addr->data.address.base;
        def = _find_local_definition(function, insn, reg);

        if (def && _is_unused_anymore(function, insn, reg)) {
            allowed = TRUE;

            for (usage = def->in_next; usage != insn->in_next && allowed; usage = usage->in_next) {
                if (bincode_find_usage_as_register_operand(usage, type, reg)) {
                    allowed = FALSE;
                }

                found = bincode_find_usage_as_address_operand(usage, type, reg);

                if (found && !_can_combine_address_and_insn(reg, found, def)) {
                    allowed = FALSE;
                }
            }

            if (allowed) {
                x86_dataflow_erase_instruction(function, def);
            }
        }
    }

    if (addr->data.address.index > 0 && addr->data.address.scale == 1) {
        reg = addr->data.address.index;
        def = _find_local_definition(function, insn, reg);

        if (def && _is_unused_anymore(function, insn, reg)) {
            allowed = TRUE;

            for (usage = def->in_next; usage != insn->in_next && allowed; usage = usage->in_next) {
                if (bincode_find_usage_as_register_operand(usage, type, reg)) {
                    allowed = FALSE;
                }

                found = bincode_find_usage_as_address_operand(usage, type, reg);

                if (found && !_can_combine_address_and_insn(reg, found, def)) {
                    allowed = FALSE;
                }
            }

            if (allowed) {
                x86_dataflow_erase_instruction(function, def);
            }
        }
    }
}

//
// Пытается распространять константу вместо регистра.
static void _try_optimize_mov_reg_const(function_desc *function, x86_instruction *mov)
{
    int reg, i, def_count;
    x86_instruction **definitions;
    x86_operand_type type = x86op_dword;

    reg = mov->in_op1.data.reg;
    x86_dataflow_find_all_usages_of_definition(reg, mov, type, _usage_arr, &_usage_count, _usage_max_count);

    definitions = alloca(sizeof(void*) * _usage_max_count);

    // проверяем, что регистр используется только в read-only контекстах
    for (i = 0; i < _usage_count; i++) {
        if (bincode_is_pseudoreg_modified_by_insn(_usage_arr[i], type, reg)
            || !OP_IS_THIS_PSEUDO_REG(_usage_arr[i]->in_op2, type, reg)
            || IS_MUL_DIV_INSN(_usage_arr[i]->in_code)) {
                return;
            }

        x86_dataflow_find_all_definitions(reg, _usage_arr[i], type, definitions, &def_count, _usage_max_count);

        if (def_count != 1) {
            return;
        }

        ASSERT(definitions[0] == mov);
    }

    // заменяем все вхождения
    for (i = 0; i < _usage_count; i++) {
        _usage_arr[i]->in_op2 = mov->in_op2;
    }

    // удаляем инструкцию
    x86_dataflow_erase_instruction(function, mov);
}

//
// Пытается распространять константу вместо регистра.
static void _try_optimize_movss(function_desc *function, x86_instruction *movss)
{
    int reg, i, def_count;
    x86_instruction **definitions;
    x86_operand_type type = x86op_float;

    if (movss->in_op2.op_loc != x86loc_symbol && movss->in_op2.op_loc != x86loc_symbol_offset || !OP_IS_PSEUDO_REG(movss->in_op1, type)) {
        return;
    }

    reg = movss->in_op1.data.reg;
    x86_dataflow_find_all_usages_of_definition(reg, movss, type, _usage_arr, &_usage_count, _usage_max_count);

    definitions = alloca(sizeof(void*) * _usage_max_count);

    // проверяем, что регистр используется только в read-only контекстах
    for (i = 0; i < _usage_count; i++) {
        if (bincode_is_pseudoreg_modified_by_insn(_usage_arr[i], type, reg)
            || !OP_IS_THIS_PSEUDO_REG(_usage_arr[i]->in_op2, type, reg) || !OP_IS_PSEUDO_REG(_usage_arr[i]->in_op1, type)) {
                return;
            }

        x86_dataflow_find_all_definitions(reg, _usage_arr[i], type, definitions, &def_count, _usage_max_count);
        if (def_count != 1) {
            return;
        }

        ASSERT(definitions[0] == movss);
    }

    // заменяем все вхождения
    for (i = 0; i < _usage_count; i++) {
        _usage_arr[i]->in_op2 = movss->in_op2;
    }

    // удаляем инструкцию
    x86_dataflow_erase_instruction(function, movss);
}

//
// Оптимизирует конструкции с LEA.
static void _try_optimize_lea(function_desc *function, x86_instruction *insn)
{
    ASSERT(insn->in_op1.op_loc == x86loc_register);
    ASSERT(insn->in_op1.data.reg > 0);  // LEA оперирует только псевдорегистрами.

    if (insn->in_op2.op_loc == x86loc_symbol) {
        _try_optimize_lea_reg_symbol(function, insn);
    } else {
        ASSERT(insn->in_op2.op_loc == x86loc_address);
        _try_optimize_lea_reg_address(function, insn);
    }
}

//
// Оптимизирует конструкции с MOV.
static void _try_optimize_mov(function_desc *function, x86_instruction *insn)
{
    x86_dataflow_set_current_insn(function, x86op_dword, insn);

    if (OP_IS_PSEUDO_REG(insn->in_op1, x86op_dword) && !x86_dataflow_is_pseudoreg_alive_after(insn->in_op1.data.reg)) {
        bincode_erase_instruction(function, insn);
    } else if (OP_IS_PSEUDO_REG(insn->in_op1, x86op_dword) && OP_IS_CONSTANT(insn->in_op2)) {
        _try_optimize_mov_reg_const(function, insn);
    }
}

//
// Оптимизирует конструкции с ADD/SUB.
static void _try_optimize_add_sub(function_desc *function, x86_instruction *insn)
{
    if (OP_IS_CONSTANT(insn->in_op2)) {
        int val = insn->in_op2.data.int_val;

        if (val == 1 || val == -1) {
            insn->in_code = ((val == -1) ^ (insn->in_code == x86insn_int_sub)) ? x86insn_int_dec : x86insn_int_inc;
            insn->in_op2.op_loc = x86loc_none;
        }
    }
}

//
// Удаляет инструкцию CMP reg,0 или TEST, следующую сразу после арифметичекой операции с этим же регистром.
static void _try_optimize_cmp_test(function_desc *function, x86_instruction *cmp)
{
    if (OP_IS_PSEUDO_REG(cmp->in_op1, x86op_dword) && IS_FLAGS_MODIFYING_INSN(cmp->in_prev->in_code)
        && (OP_IS_CONSTANT(cmp->in_op2) && cmp->in_op2.data.int_val == 0 || cmp->in_code == x86insn_int_test)
        && cmp->in_prev && OP_IS_THIS_PSEUDO_REG(cmp->in_prev->in_op1, x86op_dword, cmp->in_op1.data.reg)
        && cmp->in_next && (cmp->in_next->in_code == x86insn_je || cmp->in_next->in_code == x86insn_jne)) {
            x86_dataflow_erase_instruction(function, cmp);
        }
}

//
// Оптимизирует целочисленные инструкции.
static void _optimize_dword_insns(function_desc *function)
{
    x86_instruction *insn, *next, *prev;

    _usage_arr = allocator_alloc(allocator_per_function_pool, sizeof(void *) * function->func_insn_count);
    _usage_max_count = function->func_insn_count;

    x86_dataflow_init_alive_reg_tables(function, x86op_dword);
    x86_dataflow_init_use_def_tables(function, x86op_dword);

    for (insn = function->func_binary_code; insn; insn = next) {
        next = insn->in_next;
        prev = insn->in_prev;

        if (prev && (prev->in_code == x86insn_jmp || prev->in_code == x86insn_ret) && insn->in_code != x86insn_label) {
            bincode_erase_instruction(function, insn);
            continue;
        }

        switch (insn->in_code) {
        case x86insn_lea:
            _try_optimize_lea(function, insn);
            break;

        case x86insn_int_mov:
            _try_optimize_mov(function, insn);
            break;

        case x86insn_int_add:
        case x86insn_int_sub:
            _try_optimize_add_sub(function, insn);
            break;

        case x86insn_int_cmp:
        case x86insn_int_test:
            _try_optimize_cmp_test(function, insn);
            break;
        }
    }

    for (insn = function->func_binary_code; insn; insn = next) {
        next = insn->in_next;

        if (OP_IS_ADDRESS(insn->in_op1)) {
            _try_optimize_address(function, insn, &insn->in_op1);
        } else if (OP_IS_ADDRESS(insn->in_op2)) {
            _try_optimize_address(function, insn, &insn->in_op2);
        }
    }

    allocator_free(allocator_per_function_pool, _usage_arr, sizeof(void *) * _usage_max_count);
}

//
// Оптимизирует флоатовые инструкции.
static void _optimize_float_insn(function_desc *function)
{
    x86_instruction *insn, *next;

    _usage_arr = allocator_alloc(allocator_per_function_pool, sizeof(void *) * function->func_insn_count);
    _usage_max_count = function->func_insn_count;
    x86_dataflow_init_use_def_tables(function, x86op_float);

    for (insn = function->func_binary_code; insn; insn = next) {
        next = insn->in_next;

        switch (insn->in_code) {
        case x86insn_sse_movss:
        case x86insn_sse_movsd:
            _try_optimize_movss(function, insn);
            break;
        }
    }

    allocator_free(allocator_per_function_pool, _usage_arr, sizeof(void *) * function->func_insn_count);
}

//
// Устраняет неиспользуемые метки в коде.
static void _kill_unused_labels(function_desc *function)
{
    int labels_count    = function->func_labels_count;
    int *labels_stat    = (int *) allocator_alloc(allocator_per_function_pool, labels_count*sizeof(int));
    x86_instruction *insn, *next;

    memset(labels_stat, 0, labels_count*sizeof(int));

    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        if (IS_JMP_INSN(insn->in_code)) {
            ASSERT(insn->in_op1.op_loc == x86loc_label);
            labels_stat[insn->in_op1.data.label]++;
        }
    }

    for (insn = function->func_binary_code; insn; insn = next) {
        next = insn->in_next;

        if (insn->in_code == x86insn_label) {
            ASSERT(insn->in_op1.op_loc == x86loc_label);
            if (labels_stat[insn->in_op1.data.label] == 0) {
                bincode_erase_instruction(function, insn);
            }
        }
    }

    allocator_free(allocator_per_function_pool, labels_stat, labels_count*sizeof(int));
}

//
// Итерация оптимизации. Оптимизатор пытается объединить идущие подряд инструкции в более эффективные формы.
void x86_local_optimization_pass(function_desc *function)
{
    int old_insn_count;

    function->func_insn_count = unit_get_instruction_count(function);

    do {
        old_insn_count = function->func_insn_count;

        _optimize_dword_insns(function);
        _optimize_float_insn(function);
        _kill_unused_labels(function);

        function->func_insn_count = unit_get_instruction_count(function);
    } while (function->func_insn_count != old_insn_count);
}

