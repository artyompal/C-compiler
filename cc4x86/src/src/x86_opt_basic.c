
#include "common.h"
#include "x86_bincode.h"
#include "x86_optimizer.h"
#include "x86_regalloc.h"


#define ADDRESS_IS_BASE(OP)                 ((OP).data.address.base > 0 && (OP).data.address.index == 0 \
                                                && (OP).data.address.offset == 0)
#define ADDRESS_IS_UNSCALED_INDEX(OP)       ((OP).data.address.base == 0 && (OP).data.address.index > 0 \
                                                && (OP).data.address.offset == 0  && (OP).data.address.scale == 1)
#define ADDRESS_IS_BASE_OFS(OP)             ((OP).data.address.base > 0 && (OP).data.address.index == 0)
#define ADDRESS_IS_UNSCALED_INDEX_OFS(OP)   ((OP).data.address.base == 0 && (OP).data.address.index > 0 \
                                                && (OP).data.address.scale == 1)


static void _try_optimize_lea       (function_desc *function, x86_instruction *instr);
static void _try_optimize_mov       (function_desc *function, x86_instruction *instr);
static void _try_optimize_add_sub   (function_desc *function, x86_instruction *instr);


//
//
// ��������������� ������� ��� �������� � ����������� ���� � ����������� �������.
//
//

//
// �������� ������� ��������� �������. ������������ ��� ���������� LEA.
static BOOL _replace_register_with_symbol_offset(x86_instruction *instr, int reg, symbol *sym)
{
    if (bincode_operand_contains_register(&instr->in_op1, reg)) {
        if (instr->in_op1.op_type == x86op_address && ADDRESS_IS_BASE(instr->in_op1)) {
            instr->in_op1.op_type   = x86op_symbol;
            instr->in_op1.data.sym  = sym;
        } else {
            return FALSE;
        }
    }

    if (bincode_operand_contains_register(&instr->in_op2, reg)) {
        if (instr->in_op2.op_type == x86op_address && ADDRESS_IS_BASE(instr->in_op2)) {
            instr->in_op2.op_type   = x86op_symbol;
            instr->in_op2.data.sym  = sym;
        } else if (instr->in_op2.op_type == x86op_int_register) {
            instr->in_op2.op_type   = x86op_symbol_offset;
            instr->in_op2.data.sym  = sym;
        } else {
            return FALSE;
        }
    }

    return TRUE;
}

//
// �������� ������� ������ ���������. ������������ ��� ���������� ������ ����������� ���������.
static void _replace_register_in_instruction(x86_instruction *instr, int reg, int reg2)
{
    int *regs[MAX_REGISTERS_PER_INSTR], regs_cnt, i;

    bincode_extract_pseudoregs_from_instr(instr, regs, &regs_cnt);

    for (i = 0; i < regs_cnt; i++) {
        if (*regs[i] == reg) {
            *regs[i] = reg2;
        }
    }
}

//
// ���������, �������� �� ������� �������, ������������ reg.
// ����� ��� ��������������� ��������.
static BOOL _is_address_using_reg(x86_operand *op, int reg)
{
    return (op->op_type == x86op_address && (op->data.address.base == reg || op->data.address.index == reg));
}

//
// ��� ������� �������� ����� src, ����������� � �������� reg, ������� � dst � ������ ������� ��������� x86,
// � �������� ��������� � dst.
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
// ������� ��� ����������� ���� � ��������� ����������� �������.
//
//

//
// �������� ��� ������������� �������� �� �������� �������, � ���� ��� ������ ������, ������� ���������� LEA.
static void _try_optimize_lea_reg_symbol(function_desc *function, x86_instruction *instr)
{
    x86_instruction *usage;
    int reg;
    x86_pseudoreg_info *pseudoreg_info;


    reg             = instr->in_op1.data.reg;
    ASSERT(reg < function->func_pseudoregs_cnt);
    pseudoreg_info  = &function->func_pseudoregs_map[reg];

    if (pseudoreg_info->reg_changes_value) {
        // �� �� ����� �������� �������, ���� �� ��������������.
        return;
    }

    for (usage = instr->in_next; usage != pseudoreg_info->reg_last_read->in_next; usage = usage->in_next) {
        ASSERT(usage);

        if (!_replace_register_with_symbol_offset(usage, reg, instr->in_op2.data.sym)) {
            return;
        }
    }

    bincode_erase_instruction(function, instr);
}

//
// ������� ������ ���������� LEA.
static void _try_optimize_lea_reg_address(function_desc *function, x86_instruction *instr)
{
    x86_instruction *usage;
    int reg, reg2;
    x86_pseudoreg_info *pseudoreg_info;
    BOOL can_eliminate;


    reg             = instr->in_op1.data.reg;
    ASSERT(reg < function->func_pseudoregs_cnt);
    pseudoreg_info  = &function->func_pseudoregs_map[reg];

    if (pseudoreg_info->reg_changes_value) {
        // �� �� ����� �������� �������, ���� �� ��������������.
        return;
    }

    // ���� ���������� - ����������� LEA ����� LEA EAX,[EDX] ���  LEA EAX,[EDX*1], �� ������ ��������� �.
    if (ADDRESS_IS_BASE(instr->in_op2)) {
        reg2 = instr->in_op2.data.address.base;
        bincode_erase_instruction(function, instr);

        for (usage = instr->in_next; usage != pseudoreg_info->reg_last_read->in_next; usage = usage->in_next) {
            ASSERT(usage);
            _replace_register_in_instruction(usage, reg, reg2);
        }
    } else if (ADDRESS_IS_UNSCALED_INDEX(instr->in_op2)) {
        reg2 = instr->in_op2.data.address.index;
        bincode_erase_instruction(function, instr);

        for (usage = instr->in_next; usage != pseudoreg_info->reg_last_read->in_next; usage = usage->in_next) {
            ASSERT(usage);
            _replace_register_in_instruction(usage, reg, reg2);
        }
    } else {
        // ����� ��������� � ������������� � �������� ���������� ������ � ����� ����������.
        // ���� �� ����������, �� ����������; ����� ������� �������� ����������.
        can_eliminate = TRUE;

        for (usage = instr->in_next; usage != pseudoreg_info->reg_last_read->in_next; usage = usage->in_next) {
            ASSERT(usage);

            if (bincode_instr_contains_register(usage, reg)) {
                if (_is_address_using_reg(&usage->in_op1, reg)) {
                    if (!_try_combine_addresses(&usage->in_op1, &instr->in_op2, reg)) {
                        can_eliminate = FALSE;
                        break;
                    }
                }

                if (_is_address_using_reg(&usage->in_op2, reg)) {
                    if (!_try_combine_addresses(&usage->in_op2, &instr->in_op2, reg)) {
                        can_eliminate = FALSE;
                        break;
                    }
                }
            }
        }

        if (can_eliminate) {
            bincode_erase_instruction(function, instr);
        }
    }
}

//
// ���������� �������, �������� �������� �������� � �������-����, �� ������, � ������������ ��������.
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
// ��������� ������������ ���� �������� MOV EAX,4; ADD EAX,[EBP+8]; FLD [EAX].
// ���� ���������� �������, ���������� ����� ���������� ADD, ����� NULL.
static x86_instruction *_is_constant_used_only_for_addition_in_address(function_desc *function, x86_instruction *instr)
{
    x86_instruction *usage, *addition   = NULL;
    int reg                             = instr->in_op1.data.reg;
    x86_pseudoreg_info *pseudoreg_info  = &function->func_pseudoregs_map[reg];


    // ���������, ������������� �� ��� ��������.
    for (usage = instr->in_next; usage != pseudoreg_info->reg_last_read->in_next; usage = usage->in_next) {
        if (bincode_operand_contains_register(&usage->in_op1, reg)) {
            if (addition) {
                if (OP_IS_PSEUDO_REG(usage->in_op1)) {
                    // ���������������� ������: ������� �������� ��������������.
                    return NULL;
                }
            } else {
                if (usage->in_code != x86instr_int_add || !OP_IS_PSEUDO_REG(usage->in_op1)
                    || bincode_operand_contains_register(&usage->in_op2, reg)) {
                        // ���������������� ������: ������� ������������ �� �����������
                        // ��� �������������� � ������������ �� ������������ ��������.
                        return NULL;
                }

                addition = usage;
            }
        } else if (bincode_operand_contains_register(&usage->in_op2, reg)) {
            if (addition) {
                if (OP_IS_PSEUDO_REG(usage->in_op2)) {
                    // ���������������� ������: ������� ������������ ��� ������.
                    return NULL;
                }
            } else {
                // ���������������� ������: ������� ������������ �� �����������.
                return NULL;
            }
        }
    }

    return addition;
}

//
// ��������� ������������ ���� �������� MOV reg,const; IMUL reg,mem.
// ���� ���������� �������, ���������� ����� ���������� IMUL.
static x86_instruction *_is_constant_used_only_in_imul(function_desc *function, x86_instruction *instr)
{
    x86_instruction *usage;
    int reg                             = instr->in_op1.data.reg;
    x86_pseudoreg_info *pseudoreg_info  = &function->func_pseudoregs_map[reg];


    for (usage = instr->in_next; usage != pseudoreg_info->reg_last_read->in_next; usage = usage->in_next) {
        ASSERT(usage);

        if (OP_IS_THIS_PSEUDO_REG(usage->in_op1, reg)) {
            if (usage->in_code == x86instr_int_imul && !bincode_operand_contains_register(&usage->in_op2, reg)
                && !OP_IS_CONSTANT(usage->in_op2)) {
                    return usage;
            } else {
                return NULL;
            }
        } else if (bincode_instr_contains_register(usage, reg)) {
            return NULL;
        }
    }

    return NULL;
}

//
// �������� �������������� ��������� ������ ��������.
static void _try_optimize_mov_reg_const(function_desc *function, x86_instruction *instr)
{
    x86_instruction *usage, *pattern;
    int reg                             = instr->in_op1.data.reg;
    x86_pseudoreg_info *pseudoreg_info  = &function->func_pseudoregs_map[reg];
    int val                             = instr->in_op2.data.int_val;


    // ���� ������� ����� �� ��������������, ������ ����������� ��� ��� ��������� ������ ������������ ��������
    // ��� ������������ �������� ������ �� ��� ��������� �����, ��� �� ������������ � ������.
    if (!pseudoreg_info->reg_changes_value) {
        for (usage = instr->in_next; usage != pseudoreg_info->reg_last_read->in_next; usage = usage->in_next) {
            ASSERT(usage);

            if (_is_address_using_reg(&usage->in_op1, reg)) {
                _replace_register_in_address_with_constant(&usage->in_op1, reg, val);
            } else if (OP_IS_THIS_PSEUDO_REG(usage->in_op1, reg)) {
                ASSERT(FALSE);
            }

            if (_is_address_using_reg(&usage->in_op2, reg)) {
                _replace_register_in_address_with_constant(&usage->in_op2, reg, val);
            } else if (OP_IS_THIS_PSEUDO_REG(usage->in_op2, reg)) {
                usage->in_op2.op_type       = x86op_int_constant;
                usage->in_op2.data.int_val  = val;
            }
        }

        bincode_erase_instruction(function, instr);
        return;
    }


    // ���� ��� ��������� ������������ ������ ��� ���������� ������, ���������� � � �����.
    pattern = _is_constant_used_only_for_addition_in_address(function, instr);

    if (pattern) {
        // ��� ������������� ��������, ������� MOV � �������� ADD �� MOV.
        bincode_erase_instruction(function, instr);
        pattern->in_code   = x86instr_int_mov;

        // ������������ ��� ������, ������������ ������ �������, �� ����������� ��������.
        for (usage = pattern->in_next; usage != pseudoreg_info->reg_last_read->in_next; usage = usage->in_next) {
            if (bincode_operand_contains_register(&usage->in_op1, reg)) {
                usage->in_op1.data.address.offset += val;
            } else if (bincode_operand_contains_register(&usage->in_op2, reg)) {
                usage->in_op2.data.address.offset += val;
            }
        }

        return;
    }


    // ���� ��� ��������� ������������ � IMUL, ���������� ������������� ����� IMUL.
    pattern = _is_constant_used_only_in_imul(function, instr);

    if (pattern) {
        // ������� MOV � �������� IMUL �� ��� ������������� �����.
        bincode_erase_instruction(function, instr);
        pattern->in_code    = x86instr_imul_const;
        pattern->in_op3     = val;
        return;
    }
}

//
// �������� ��������/��������� �������� � ���������� �� LEA.
// �������: MOV reg,reg_src; ADD reg,val
static BOOL _try_optimize_reg_add_sub_const_into_lea(function_desc *function, x86_instruction *instr)
{
    int reg                             = instr->in_op1.data.reg;
    x86_pseudoreg_info *pseudoreg_info  = &function->func_pseudoregs_map[reg];
    int val                             = instr->in_op2.data.int_val;
    x86_instruction *mov, *checked;
    int reg_src;


    // ��������� ������������ ���� ��������.
    if (!OP_IS_PSEUDO_REG(instr->in_op1)) {
        return FALSE;
    }

    mov = pseudoreg_info->reg_first_write;

    if (mov->in_code != x86instr_int_mov || !OP_IS_THIS_PSEUDO_REG(mov->in_op1, reg) || mov->in_op2.op_type != x86op_int_register) {
        return FALSE;
    }

    reg_src = mov->in_op2.data.reg;

    for (checked = mov->in_next; checked != instr; checked = checked->in_next) {
        if (bincode_instr_contains_register(checked, reg) || OP_IS_THIS_REAL_REG(checked->in_op1, reg_src)) {
            return FALSE;
        }
    }


    // ������� MOV � �������� ADD �� LEA.
    bincode_erase_instruction(function, mov);

    if (instr->in_code == x86instr_int_sub) {
        val = -val;
    }

    instr->in_code = x86instr_lea;
    bincode_create_operand_addr_from_reg_offset(&instr->in_op2, reg_src, val);

    return TRUE;
}

//
// �������� ������������� ADD reg,const � INC/DEC.
static void _try_optimize_add_sub_const(function_desc *function, x86_instruction *instr)
{
    int val = instr->in_op2.data.int_val;

    if (val == 1 || val == -1) {
        instr->in_code = ((val == -1) ^ (instr->in_code == x86instr_int_sub)) ? x86instr_int_dec : x86instr_int_inc;
        instr->in_op2.op_type = x86op_none;
    }
}


//
//
// �������, ���������� ��������� ������������������, ������������ �� �������� ����������.
//
//

//
// ������������ ����������� � LEA.
static void _try_optimize_lea(function_desc *function, x86_instruction *instr)
{
    ASSERT(instr->in_op1.op_type == x86op_int_register);
    ASSERT(instr->in_op1.data.reg > 0);  // LEA ��������� ������ ����������������.

    if (instr->in_op2.op_type == x86op_symbol) {
        _try_optimize_lea_reg_symbol(function, instr);
    } else {
        ASSERT(instr->in_op2.op_type == x86op_address);
        _try_optimize_lea_reg_address(function, instr);
    }
}

//
// ������������ ����������� � MOV.
static void _try_optimize_mov(function_desc *function, x86_instruction *instr)
{
    if (OP_IS_PSEUDO_REG(instr->in_op1) && OP_IS_CONSTANT(instr->in_op2)) {
        _try_optimize_mov_reg_const(function, instr);
    }
}

//
// ������������ ����������� � ADD/SUB.
static void _try_optimize_add_sub(function_desc *function, x86_instruction *instr)
{
    if (OP_IS_CONSTANT(instr->in_op2)) {
        if (!_try_optimize_reg_add_sub_const_into_lea(function, instr)) {
            _try_optimize_add_sub_const(function, instr);
        }
    }
}


//
// ���� �����������, ������� ����������� ����� ����� ��������� �������������� ����.
// �� ���� ����� ����������� �������� ���������� ������ ������ ���������� � ����� ����������� �����,
// ��������� ���������� �������������� ��� x86 (�������� �������������� � ������� ������� ����������
// ��������� ���������� ��������� � x86).
//

void x86_optimization_after_codegen(function_desc *function)
{
    x86_instruction *instr, *next, *prev;


    for (instr = function->func_binary_code; instr; instr = next) {
        next = instr->in_next;
        prev = instr->in_prev;

        if (prev && (prev->in_code == x86instr_jmp || prev->in_code == x86instr_ret) && instr->in_code != x86instr_label) {
            bincode_erase_instruction(function, instr);
            continue;
        }

        switch (instr->in_code) {
        case x86instr_lea:
            _try_optimize_lea(function, instr);
            break;

        case x86instr_int_mov:
            _try_optimize_mov(function, instr);
            break;

        case x86instr_int_add:
        case x86instr_int_sub:
            _try_optimize_add_sub(function, instr);
            break;
        }
    }

    // ����������� ���������� ����� ����������, ������� �� ������� � �����������.
    x86_analyze_registers_usage(function);
}


// ���������� �������, ���� �� ������������ ��� ������ ����� ����������� ����������.
static BOOL _try_kill_copies_of_regvar(function_desc *function, x86_instruction *instr)
{
    int reg, regvar, *regs_arr[MAX_REGISTERS_PER_INSTR], regs_cnt, i;
    x86_instruction *instr2;

    reg     = instr->in_op1.data.reg;
    if (function->func_pseudoregs_map[reg].reg_changes_value) {
        return FALSE;
    }

    regvar  = instr->in_op2.data.reg;
    if (regvar < function->func_start_of_regvars) {
        return FALSE;
    }

    instr2  = instr->in_next;
    bincode_erase_instruction(function, instr);

    instr   = instr2;
    instr2  = function->func_pseudoregs_map[reg].reg_last_read->in_next;

    for (; instr != instr2; instr = instr->in_next) {
        bincode_extract_pseudoregs_from_instr(instr, regs_arr, &regs_cnt);

        for (i = 0; i < regs_cnt; i++) {
            if (*regs_arr[i] == reg) {
                *regs_arr[i] = regvar;
            }
        }
    }

    return TRUE;
}

// ���������� �������, ���� �� ������������ ��� ���������� ����������� ����������.
static BOOL _try_optimize_regvar_evaluation(function_desc *function, x86_instruction *instr)
{
    int reg, regvar, *regs_arr[MAX_REGISTERS_PER_INSTR], regs_cnt, i;
    x86_instruction *instr2;

    reg     = instr->in_op2.data.reg;
    if (reg >= function->func_start_of_regvars) {
        return FALSE;
    }

    regvar  = instr->in_op1.data.reg;
    if (regvar < function->func_start_of_regvars) {
        return FALSE;
    }

    for (instr2 = function->func_pseudoregs_map[reg].reg_first_write; instr2 != instr; instr2 = instr2->in_next) {
        bincode_extract_pseudoregs_from_instr(instr2, regs_arr, &regs_cnt);

        for (i = 0; i < regs_cnt; i++) {
            if (*regs_arr[i] == reg) {
                *regs_arr[i] = regvar;
            }
        }
    }

    bincode_erase_instruction(function, instr);
    return TRUE;
}


//
// ���� �����������, ������� ����������� ����� �������� ����������� ����������.
// ����� ����������� ��������� ���.
void x86_optimization_after_regvar_allocation(function_desc *function)
{
    x86_instruction *instr, *next;
    BOOL was_smth = FALSE;


    for (instr = function->func_binary_code; instr; instr = next) {
        next = instr->in_next;

        if (instr->in_code == x86instr_int_mov && OP_IS_PSEUDO_REG(instr->in_op1) && OP_IS_PSEUDO_REG(instr->in_op2)) {
            if (_try_kill_copies_of_regvar(function, instr) || _try_optimize_regvar_evaluation(function, instr)) {
                was_smth = TRUE;
            }
        }
    }

    if (was_smth) {
        // ����������� ���������� ����� ����������, ������� �� ������� � �����������.
        x86_analyze_registers_usage(function);

        // ��������, ����� �������� �������������� ����� ��������� ����.
        x86_optimization_after_codegen(function);

        // FIXME: ����� ��������� ���������� ������ ��������� �����������, ���� ��� �������� ����������.
        x86_optimization_after_codegen(function);
    }
}

