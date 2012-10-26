
#include "common.h"
#include "x86_bincode.h"
#include "x86_optimizer.h"
#include "x86_regalloc.h"


// FIXME: при кодогенерации не должно появляться байтовых регистров; нужно делать movzx/movsx в нужных местах.


#define ADDRESS_IS_BASE(OP)                 ((OP).data.address.base > 0 && (OP).data.address.index == 0 \
                                                && (OP).data.address.offset == 0)
#define ADDRESS_IS_UNSCALED_INDEX(OP)       ((OP).data.address.base == 0 && (OP).data.address.index > 0 \
                                                && (OP).data.address.offset == 0  && (OP).data.address.scale == 1)
#define ADDRESS_IS_BASE_OFS(OP)             ((OP).data.address.base > 0 && (OP).data.address.index == 0)
#define ADDRESS_IS_UNSCALED_INDEX_OFS(OP)   ((OP).data.address.base == 0 && (OP).data.address.index > 0 \
                                                && (OP).data.address.scale == 1)


static void _try_optimize_lea       (function_desc *function, x86_instruction *insn);
static void _try_optimize_mov       (function_desc *function, x86_instruction *insn);
static void _try_optimize_add_sub   (function_desc *function, x86_instruction *insn);


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
    x86_register_ref regs[MAX_REGISTERS_PER_INSN];
    int regs_cnt, i;

    bincode_extract_pseudoregs_from_insn(insn, x86op_dword, regs, &regs_cnt);

    for (i = 0; i < regs_cnt; i++) {
        if (*regs[i].reg_addr == reg) {
            *regs[i].reg_addr = reg2;
        }
    }
}

//
// Проверяет, является ли операнд адресом, использующим reg.
// Нужно для распространения значений.
static BOOL _is_address_using_reg(x86_operand *op, int reg)
{
    return (op->op_loc == x86loc_address && (op->data.address.base == reg || op->data.address.index == reg));
}

//
// Эта функция пытается адрес src, находящийся в регистре reg, сложить с dst в рамках режимов адресации x86,
// и записать результат в dst.
static BOOL _try_combine_addresses(x86_operand *dst, x86_operand *src, int reg)
{
    if (!ADDRESS_IS_BASE_OFS(*dst)) {
        return FALSE;
    }

    ASSERT(dst->data.address.base == reg);

    dst->data.address.base      = src->data.address.base;
    dst->data.address.index     = src->data.address.index;
    dst->data.address.offset    += src->data.address.offset;
    dst->data.address.scale     = src->data.address.scale;

    return TRUE;
}


//
//
// Функции для оптимизации кода в известных специальных случаях.
//
//

//
// Заменяет все использования регистра на смещение символа, и если это всегда удаётся, удаляем инструкцию LEA.
static void _try_optimize_lea_reg_symbol(function_desc *function, x86_instruction *insn)
{
    x86_instruction *usage;
    int reg;
    x86_pseudoreg_info *pseudoreg_info;


    reg             = insn->in_op1.data.reg;
    ASSERT(reg < function->func_dword_regstat.count);
    pseudoreg_info  = &function->func_dword_regstat.ptr[reg];

    if (pseudoreg_info->reg_changes_value) {
        // Мы не можем заменить регистр, если он модифицируется.
        return;
    }

    for (usage = insn->in_next; usage != pseudoreg_info->reg_last_read->in_next; usage = usage->in_next) {
        ASSERT(usage);

        if (!_replace_register_with_symbol_offset(usage, reg, insn->in_op2.data.sym.name)) {
            return;
        }
    }

    bincode_erase_instruction(function, insn);
}

//
// Пробует убрать инструкцию LEA.
static void _try_optimize_lea_reg_address(function_desc *function, x86_instruction *insn)
{
    x86_instruction *usage;
    int reg, reg2;
    x86_pseudoreg_info *pseudoreg_info;
    BOOL can_eliminate;


    reg             = insn->in_op1.data.reg;
    ASSERT(reg < function->func_dword_regstat.count);
    pseudoreg_info  = &function->func_dword_regstat.ptr[reg];

    if (pseudoreg_info->reg_changes_value) {
        // Мы не можем заменить регистр, если он модифицируется.
        return;
    }

    // Если инструкция - тривиальный LEA вроде LEA EAX,[EDX] или  LEA EAX,[EDX*1], то просто устраняем её.
    if (ADDRESS_IS_BASE(insn->in_op2)) {
        reg2 = insn->in_op2.data.address.base;
        bincode_erase_instruction(function, insn);

        for (usage = insn->in_next; usage != pseudoreg_info->reg_last_read->in_next; usage = usage->in_next) {
            ASSERT(usage);
            _replace_register_in_instruction(usage, reg, reg2);
        }
    } else if (ADDRESS_IS_UNSCALED_INDEX(insn->in_op2)) {
        reg2 = insn->in_op2.data.address.index;
        bincode_erase_instruction(function, insn);

        for (usage = insn->in_next; usage != pseudoreg_info->reg_last_read->in_next; usage = usage->in_next) {
            ASSERT(usage);
            _replace_register_in_instruction(usage, reg, reg2);
        }
    } else {
        // Иначе исследуем её использование и пытаемся объединить адреса в одной инструкции.
        // Если не получается, то прекращаем; иначе удаляем исходную инструкцию.
        can_eliminate = TRUE;

        for (usage = insn->in_next; usage != pseudoreg_info->reg_last_read->in_next; usage = usage->in_next) {
            ASSERT(usage);

            if (_is_address_using_reg(&usage->in_op1, reg) && !_try_combine_addresses(&usage->in_op1, &insn->in_op2, reg)
                || bincode_operand_contains_register(&usage->in_op1, x86op_dword, reg)) {
                    can_eliminate = FALSE;
                    break;
            }

            if (_is_address_using_reg(&usage->in_op2, reg) && !_try_combine_addresses(&usage->in_op2, &insn->in_op2, reg)
                || bincode_operand_contains_register(&usage->in_op2, x86op_dword, reg)) {
                    can_eliminate = FALSE;
                    break;
            }
        }

        if (can_eliminate) {
            bincode_erase_instruction(function, insn);
        }
    }
}

//
// Выкидывает регистр, значение которого известно в компайл-тайм, из адреса, и корректирует смещение.
static void _replace_register_in_address_with_constant(x86_operand *op, int reg, int val)
{
    ASSERT(OP_IS_ADDRESS(*op));

    if (op->data.address.base == reg) {
        op->data.address.offset += val;
        op->data.address.base   = 0;
    }

    if (op->data.address.index == reg) {
        op->data.address.offset += val;
        op->data.address.index  = 0;
    }
}

//
// Проверяет соответствие кода паттерну MOV EAX,4; ADD EAX,[EBP+8]; FLD [EAX].
// Если совпадение найдено, возвращает адрес инструкции ADD, иначе NULL.
static x86_instruction *_is_constant_used_only_for_addition_in_address(function_desc *function, x86_instruction *insn)
{
    x86_instruction *usage, *addition   = NULL;
    int reg                             = insn->in_op1.data.reg;
    x86_pseudoreg_info *pseudoreg_info  = &function->func_dword_regstat.ptr[reg];


    // Проверяем, соответствует ли код паттерну.
    for (usage = insn->in_next; usage != pseudoreg_info->reg_last_read->in_next; usage = usage->in_next) {
        if (bincode_operand_contains_register(&usage->in_op1, x86op_dword, reg)) {
            if (addition) {
                if (OP_IS_PSEUDO_REG(usage->in_op1)) {
                    // Неподдерживаемый случай: регистр повторно модифицируется.
                    return NULL;
                }
            } else {
                if (usage->in_code != x86insn_int_add || !OP_IS_PSEUDO_REG(usage->in_op1)
                    || bincode_operand_contains_register(&usage->in_op2, x86op_dword, reg)) {
                        // Неподдерживаемый случай: регистр используется до модификации
                        // или модифицируется с зависимостью от собственного значения.
                        return NULL;
                }

                addition = usage;
            }
        } else if (bincode_operand_contains_register(&usage->in_op2, x86op_dword, reg)) {
            if (addition) {
                if (OP_IS_PSEUDO_REG(usage->in_op2)) {
                    // Неподдерживаемый случай: регистр используется вне адреса.
                    return NULL;
                }
            } else {
                // Неподдерживаемый случай: регистр используется до модификации.
                return NULL;
            }
        }
    }

    return addition;
}

//
// Проверяет соответствие кода паттерну MOV reg,const; IMUL reg,mem.
// Если совпадение найдено, возвращает адрес инструкции IMUL.
static x86_instruction *_is_constant_used_only_in_imul(function_desc *function, x86_instruction *insn)
{
    x86_instruction *usage;
    int reg                             = insn->in_op1.data.reg;
    x86_pseudoreg_info *pseudoreg_info  = &function->func_dword_regstat.ptr[reg];


    for (usage = insn->in_next; usage != pseudoreg_info->reg_last_read->in_next; usage = usage->in_next) {
        ASSERT(usage);

        if (OP_IS_THIS_PSEUDO_REG(usage->in_op1, x86op_dword, reg)) {
            if (usage->in_code == x86insn_int_imul && !bincode_operand_contains_register(&usage->in_op2, x86op_dword, reg)
                && !OP_IS_CONSTANT(usage->in_op2)) {
                    return usage;
            } else {
                return NULL;
            }
        } else if (bincode_insn_contains_register(usage, x86op_dword, reg)) {
            return NULL;
        }
    }

    return NULL;
}

//
// Пытается распространять константу вместо регистра.
static void _try_optimize_mov_reg_const(function_desc *function, x86_instruction *insn)
{
    x86_instruction *usage, *pattern;
    int reg                             = insn->in_op1.data.reg;
    x86_pseudoreg_info *pseudoreg_info  = &function->func_dword_regstat.ptr[reg];
    int val                             = insn->in_op2.data.int_val;

    // Если регистр нигде не модифицируется, просто подставляем его как константу вместо регистрового операнда
    // или корректируем смещение адреса на эту константу везде, где он используется в адресе.
    if (!pseudoreg_info->reg_changes_value) {
        for (usage = insn->in_next; usage != pseudoreg_info->reg_last_read->in_next; usage = usage->in_next) {
            ASSERT(usage);

            if (_is_address_using_reg(&usage->in_op1, reg)) {
                _replace_register_in_address_with_constant(&usage->in_op1, reg, val);
            } else if (OP_IS_THIS_PSEUDO_REG(usage->in_op1, x86op_dword, reg)) {
                ASSERT(!IS_VOLATILE_INSN(usage->in_code, usage->in_op1.op_type));
                return;
            }

            if (_is_address_using_reg(&usage->in_op2, reg)) {
                _replace_register_in_address_with_constant(&usage->in_op2, reg, val);
            } else if (OP_IS_THIS_PSEUDO_REG(usage->in_op2, x86op_dword, reg)) {
                if (IS_MUL_DIV_INSN(usage->in_code)) {
                    return;
                }

                usage->in_op2.op_loc       = x86loc_int_constant;
                usage->in_op2.data.int_val  = val;
            }
        }

        bincode_erase_instruction(function, insn);
        return;
    }


    // Если эта константа используется только для вычисления адреса, запихиваем её в адрес.
    pattern = _is_constant_used_only_for_addition_in_address(function, insn);

    if (pattern) {
        // Код соответствует паттерну, удаляем MOV и заменяем ADD на MOV.
        bincode_erase_instruction(function, insn);
        pattern->in_code   = x86insn_int_mov;

        // Корректируем все адреса, использующие данные регистр, на константное смещение.
        for (usage = pattern->in_next; usage != pseudoreg_info->reg_last_read->in_next; usage = usage->in_next) {
            if (bincode_operand_contains_register(&usage->in_op1, x86op_dword, reg)) {
                usage->in_op1.data.address.offset += val;
            } else if (bincode_operand_contains_register(&usage->in_op2, x86op_dword, reg)) {
                usage->in_op2.data.address.offset += val;
            }
        }

        return;
    }


    // Если эта константа используется в IMUL, генерируем трёхоперандную форму IMUL.
    pattern = _is_constant_used_only_in_imul(function, insn);

    if (pattern) {
        // Удаляем MOV и заменяем IMUL на его трёхоперандную форму.
        bincode_erase_instruction(function, insn);
        pattern->in_code    = x86insn_imul_const;
        pattern->in_op2     = pattern->in_op1;
        pattern->in_op3     = val;
        return;
    }
}

//
// Заменяет сложение/вычитание регистра с константой на LEA.
// Паттерн: MOV reg,reg_src; ADD reg,val
static BOOL _try_optimize_reg_add_sub_const_into_lea(function_desc *function, x86_instruction *insn)
{
    int reg                             = insn->in_op1.data.reg;
    x86_pseudoreg_info *pseudoreg_info  = &function->func_dword_regstat.ptr[reg];
    int val                             = insn->in_op2.data.int_val;
    x86_instruction *mov, *checked;
    int reg_src;


    // Проверяем соответствие кода паттерну.
    if (!OP_IS_PSEUDO_REG(insn->in_op1)) {
        return FALSE;
    }

    mov = pseudoreg_info->reg_first_write;

    if (mov->in_code != x86insn_int_mov || !OP_IS_THIS_PSEUDO_REG(mov->in_op1, x86op_dword, reg) || mov->in_op2.op_loc != x86loc_register) {
        return FALSE;
    }

    reg_src = mov->in_op2.data.reg;

    for (checked = mov->in_next; checked != insn; checked = checked->in_next) {
        if (bincode_insn_contains_register(checked, x86op_dword, reg) || OP_IS_THIS_REAL_REG(checked->in_op1, x86op_dword, reg_src)) {
            return FALSE;
        }
    }


    // Удаляем MOV и заменяем ADD на LEA.
    bincode_erase_instruction(function, mov);

    if (insn->in_code == x86insn_int_sub) {
        val = -val;
    }

    insn->in_code = x86insn_lea;
    bincode_create_operand_addr_from_reg_offset(&insn->in_op2, x86op_dword, reg_src, val);

    return TRUE;
}

//
// Пытается преобразовать ADD reg,const в INC/DEC.
static void _try_optimize_add_sub_const(function_desc *function, x86_instruction *insn)
{
    int val = insn->in_op2.data.int_val;

    if (val == 1 || val == -1) {
        insn->in_code = ((val == -1) ^ (insn->in_code == x86insn_int_sub)) ? x86insn_int_dec : x86insn_int_inc;
        insn->in_op2.op_loc = x86loc_none;
    }
}

//
// Пытается распространять константу вместо регистра.
static void _try_optimize_movss(function_desc *function, x86_instruction *insn)
{
    x86_instruction *usage;
    int reg                             = insn->in_op1.data.reg;
    x86_pseudoreg_info *pseudoreg_info  = &function->func_sse_regstat.ptr[reg];

    if (!OP_IS_PSEUDO_REG(insn->in_op1) || OP_IS_REGVAR(insn->in_op1.data.reg, insn->in_op1.op_type)) {
        return;
    }

    // Если регистр нигде не модифицируется, просто подставляем второй операнд вместо него.
    if (!pseudoreg_info->reg_changes_value) {
        for (usage = insn->in_next; usage != pseudoreg_info->reg_last_read->in_next; usage = usage->in_next) {
            ASSERT(usage);

            if (OP_IS_THIS_PSEUDO_REG(usage->in_op1, insn->in_op2.op_type, reg)) {
                return;
            }

            if (OP_IS_THIS_PSEUDO_REG(usage->in_op2, insn->in_op2.op_type, reg)) {
                if (!OP_IS_PSEUDO_REG(usage->in_op1)) {
                    return;
                }

                usage->in_op2 = insn->in_op2;
            }
        }

        bincode_erase_instruction(function, insn);
        return;
    }
}



//
//
// Функции, выделяющие известные последовательности, начинающиеся на заданную инструкцию.
//
//

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
    if (OP_IS_PSEUDO_REG(insn->in_op1) && OP_IS_CONSTANT(insn->in_op2)) {
        _try_optimize_mov_reg_const(function, insn);
    }
}

//
// Оптимизирует конструкции с ADD/SUB.
static void _try_optimize_add_sub(function_desc *function, x86_instruction *insn)
{
    if (OP_IS_CONSTANT(insn->in_op2)) {
        if (!_try_optimize_reg_add_sub_const_into_lea(function, insn)) {
            _try_optimize_add_sub_const(function, insn);
        }
    }
}


//
// Этап оптимизации, который выполняется сразу после генерации промежуточного кода.
// На этом этапе оптимизатор пытается объединить идущие подряд инструкции в более эффективные формы,
// восполняя недостатки кодогенератора для x86 (проблема кодогенератора -
// в слишком большом количестве возможных комбинаций операндов в x86).
//

void x86_optimization_after_codegen(function_desc *function)
{
    x86_instruction *insn, *next, *prev;

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

        case x86insn_sse_movss:
        case x86insn_sse_movsd:
            _try_optimize_movss(function, insn);
            break;
        }
    }
}


// Устраняет неиспользуемые метки в коде.
static void _optimize_labels(function_desc *function)
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

// Этап оптимизации, который выполняется после инлайнинга и до введения регистровых переменных.
void x86_optimization_after_inlining(function_desc *function)
{
    _optimize_labels(function);
}


// Выкидывает регистр, если он используется как точная копия регистровой переменной.
static BOOL _try_kill_copies_of_regvar(function_desc *function, x86_instruction *insn)
{
    int reg, regvar, regs_cnt, i;
    x86_register_ref regs_arr[MAX_REGISTERS_PER_INSN];
    x86_instruction *insn2;
    x86_operand_type type   = insn->in_op1.op_type;
    register_stat *regstat  = unit_get_regstat(function, type);


    // если регистр где-то изменяется, его нельзя удалять
    reg     = insn->in_op1.data.reg;
    if (regstat->ptr[reg].reg_changes_value) {
        return FALSE;
    }

    // если второй операнд - не регистровая переменная, выходим
    regvar  = insn->in_op2.data.reg;
    if (!OP_IS_REGVAR(regvar, type)) {
        return FALSE;
    }

    // если переменная меняет значение до конца жизни регистра либо туда возможны переходы, то нельзя удалять
    for (insn2 = regstat->ptr[reg].reg_first_write;
        insn2 != regstat->ptr[reg].reg_last_read; insn2 = insn2->in_next)
            if (OP_IS_THIS_PSEUDO_REG(insn2->in_op1, type, insn->in_op2.data.reg) && IS_VOLATILE_INSN(insn2->in_code, type)
                || insn2->in_code == x86insn_label) {
                    return FALSE;
                }

    insn2  = insn->in_next;
    bincode_erase_instruction(function, insn);

    insn    = insn2;
    insn2   = regstat->ptr[reg].reg_last_read->in_next;

    for (; insn != insn2; insn = insn->in_next) {
        bincode_extract_pseudoregs_from_insn(insn, type, regs_arr, &regs_cnt);

        for (i = 0; i < regs_cnt; i++) {
            if (*regs_arr[i].reg_addr == reg) {
                *regs_arr[i].reg_addr = regvar;
            }
        }
    }

    return TRUE;
}

// Выкидывает регистр, если он используется для вычисления регистровой переменной.
static BOOL _try_optimize_regvar_evaluation(function_desc *function, x86_instruction *insn)
{
    int reg, regvar, regs_cnt, i;
    x86_register_ref regs_arr[MAX_REGISTERS_PER_INSN];
    x86_instruction *insn2;
    x86_operand_type type = insn->in_op1.op_type;
    register_stat *regstat  = unit_get_regstat(function, type);


    reg     = insn->in_op2.data.reg;
    if (OP_IS_REGVAR(reg, type)) {
        return FALSE;
    }

    regvar  = insn->in_op1.data.reg;
    if (!OP_IS_REGVAR(regvar, type)) {
        return FALSE;
    }

    // Проверяем, что ранее этой инструкции регистровая переменная не использовалась в этой функции.
    for (insn2 = function->func_binary_code; insn2 != insn; insn2 = insn2->in_next) {
        bincode_extract_pseudoregs_from_insn(insn2, type, regs_arr, &regs_cnt);

        for (i = 0; i < regs_cnt; i++) {
            if (*regs_arr[i].reg_addr == regvar) {
                return FALSE;
            }
        }
    }

    // Заменяем все вхождения регистра на регистровую переменную.
    for (insn2 = regstat->ptr[reg].reg_first_write; insn2 != insn; insn2 = insn2->in_next) {
        bincode_extract_pseudoregs_from_insn(insn2, type, regs_arr, &regs_cnt);

        for (i = 0; i < regs_cnt; i++) {
            if (*regs_arr[i].reg_addr == reg) {
                *regs_arr[i].reg_addr = regvar;
            }
        }
    }

    bincode_erase_instruction(function, insn);
    return TRUE;
}

// Выкидывает регистр, если он используется для модификации регистровой переменной.
static BOOL _try_optimize_regvar_modification(function_desc *function, x86_instruction *insn)
{
    int reg, regvar, regs_cnt, i;
    x86_register_ref regs_arr[MAX_REGISTERS_PER_INSN];
    x86_instruction *insn2;
    x86_operand_type type   = insn->in_op1.op_type;
    register_stat *regstat  = unit_get_regstat(function, type);


    // если первый операнд - регистровая переменная, выходим
    reg = insn->in_op1.data.reg;
    if (OP_IS_REGVAR(reg, type)) {
        return FALSE;
    }

    // если второй операнд - не регистровая переменная, выходим
    regvar = insn->in_op2.data.reg;
    if (!OP_IS_REGVAR(regvar, type)) {
        return FALSE;
    }

    // если переменная меняет значение до конца жизни регистра либо туда возможны переходы, то нельзя удалять
    for (insn2 = regstat->ptr[reg].reg_first_write; insn2 != regstat->ptr[reg].reg_last_read; insn2 = insn2->in_next)
        if (OP_IS_THIS_PSEUDO_REG(insn->in_op1, type, regvar) && IS_VOLATILE_INSN(insn->in_code, type)
            || insn2->in_code == x86insn_label) {
                return FALSE;
            }

    // последняя инструкция должна записывать значение обратно в регистровую переменную
    if (!IS_MOV_INSN(insn2->in_code) || !OP_IS_THIS_PSEUDO_REG(insn2->in_op1, type, regvar)
        || !OP_IS_THIS_PSEUDO_REG(insn2->in_op2, type, reg)) {
            return FALSE;
        }

    insn2  = insn->in_next;
    bincode_erase_instruction(function, insn);

    insn    = insn2;
    insn2   = regstat->ptr[reg].reg_last_read;

    for (; insn != insn2; insn = insn->in_next) {
        bincode_extract_pseudoregs_from_insn(insn, type, regs_arr, &regs_cnt);

        for (i = 0; i < regs_cnt; i++) {
            if (*regs_arr[i].reg_addr == reg) {
                *regs_arr[i].reg_addr = regvar;
            }
        }
    }

    bincode_erase_instruction(function, insn2);
    return TRUE;
}


// Пробует устранить лишние копирования регистров.
static BOOL _try_optimize_regvars_usage(function_desc *function)
{
    x86_instruction *insn, *next;
    BOOL was_smth = FALSE;

    for (insn = function->func_binary_code; insn; insn = next) {
        next = insn->in_next;

        if (IS_MOV_INSN(insn->in_code) && OP_IS_PSEUDO_REG(insn->in_op1) && OP_IS_PSEUDO_REG(insn->in_op2)) {
            if (_try_kill_copies_of_regvar(function, insn) ||
                _try_optimize_regvar_evaluation(function, insn) ||
                _try_optimize_regvar_modification(function, insn)) {
                was_smth = TRUE;
            }
        }
    }

    return was_smth;
}


//
// Этап оптимизации, который выполняется после введения регистровых переменных.
// Работает итеративно, пока ему удаётся уменьшить число инструкций.
void x86_optimization_after_regvar_allocation(function_desc *function)
{
    int orig_insn_count, insn_count;

    // Устраняем лишние копирования.
    if (!_try_optimize_regvars_usage(function))
        return;

    // Считаем число инструкций в функции.
    insn_count = unit_get_instruction_count(function);

    // Пока оптимизация даёт результаты, её можно повторять.
    do {
        // Регистровая статистика стала невалидной, поэтому мы обязаны её перестроить.
        x86_analyze_registers_usage(function);
        orig_insn_count = insn_count;

        // Выполняем итерацию оптимизации.
        x86_optimization_after_codegen(function);

        // Считаем число инструкций в функции.
        insn_count = unit_get_instruction_count(function);

        // Лишние инструкции появиться не должны.
        ASSERT(insn_count <= orig_insn_count);
    } while (insn_count != orig_insn_count);
}

