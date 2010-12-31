
#include "common.h"
#include "x86_bincode.h"
#include "x86_optimizer.h"
#include "x86_regalloc.h"


// FIXME: ��� ������������� �� ������ ���������� �������� ���������; ����� ������ movzx/movsx � ������ ������.


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
// ��������������� ������� ��� �������� � ����������� ���� � ����������� �������.
//
//

//
// �������� ������� ��������� �������. ������������ ��� ���������� LEA.
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
// �������� ������� ������ ���������. ������������ ��� ���������� ������ ����������� ���������.
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
// ���������, �������� �� ������� �������, ������������ reg.
// ����� ��� ��������������� ��������.
static BOOL _is_address_using_reg(x86_operand *op, int reg)
{
    return (op->op_loc == x86loc_address && (op->data.address.base == reg || op->data.address.index == reg));
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
static void _try_optimize_lea_reg_symbol(function_desc *function, x86_instruction *insn)
{
    x86_instruction *usage;
    int reg;
    x86_pseudoreg_info *pseudoreg_info;


    reg             = insn->in_op1.data.reg;
    ASSERT(reg < function->func_dword_regstat.count);
    pseudoreg_info  = &function->func_dword_regstat.ptr[reg];

    if (pseudoreg_info->reg_changes_value) {
        // �� �� ����� �������� �������, ���� �� ��������������.
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
// ������� ������ ���������� LEA.
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
        // �� �� ����� �������� �������, ���� �� ��������������.
        return;
    }

    // ���� ���������� - ����������� LEA ����� LEA EAX,[EDX] ���  LEA EAX,[EDX*1], �� ������ ��������� �.
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
        // ����� ��������� � ������������� � �������� ���������� ������ � ����� ����������.
        // ���� �� ����������, �� ����������; ����� ������� �������� ����������.
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
static x86_instruction *_is_constant_used_only_for_addition_in_address(function_desc *function, x86_instruction *insn)
{
    x86_instruction *usage, *addition   = NULL;
    int reg                             = insn->in_op1.data.reg;
    x86_pseudoreg_info *pseudoreg_info  = &function->func_dword_regstat.ptr[reg];


    // ���������, ������������� �� ��� ��������.
    for (usage = insn->in_next; usage != pseudoreg_info->reg_last_read->in_next; usage = usage->in_next) {
        if (bincode_operand_contains_register(&usage->in_op1, x86op_dword, reg)) {
            if (addition) {
                if (OP_IS_PSEUDO_REG(usage->in_op1)) {
                    // ���������������� ������: ������� �������� ��������������.
                    return NULL;
                }
            } else {
                if (usage->in_code != x86insn_int_add || !OP_IS_PSEUDO_REG(usage->in_op1)
                    || bincode_operand_contains_register(&usage->in_op2, x86op_dword, reg)) {
                        // ���������������� ������: ������� ������������ �� �����������
                        // ��� �������������� � ������������ �� ������������ ��������.
                        return NULL;
                }

                addition = usage;
            }
        } else if (bincode_operand_contains_register(&usage->in_op2, x86op_dword, reg)) {
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
// �������� �������������� ��������� ������ ��������.
static void _try_optimize_mov_reg_const(function_desc *function, x86_instruction *insn)
{
    x86_instruction *usage, *pattern;
    int reg                             = insn->in_op1.data.reg;
    x86_pseudoreg_info *pseudoreg_info  = &function->func_dword_regstat.ptr[reg];
    int val                             = insn->in_op2.data.int_val;

    // ���� ������� ����� �� ��������������, ������ ����������� ��� ��� ��������� ������ ������������ ��������
    // ��� ������������ �������� ������ �� ��� ��������� �����, ��� �� ������������ � ������.
    if (!pseudoreg_info->reg_changes_value) {
        for (usage = insn->in_next; usage != pseudoreg_info->reg_last_read->in_next; usage = usage->in_next) {
            ASSERT(usage);

            if (_is_address_using_reg(&usage->in_op1, reg)) {
                _replace_register_in_address_with_constant(&usage->in_op1, reg, val);
            } else if (OP_IS_THIS_PSEUDO_REG(usage->in_op1, x86op_dword, reg)) {
                return;
            }

            if (_is_address_using_reg(&usage->in_op2, reg)) {
                _replace_register_in_address_with_constant(&usage->in_op2, reg, val);
            } else if (OP_IS_THIS_PSEUDO_REG(usage->in_op2, x86op_dword, reg)) {
                if (usage->in_code == x86insn_int_mul || usage->in_code == x86insn_int_div
                    || usage->in_code == x86insn_int_idiv) {
                        return;
                }

                usage->in_op2.op_loc       = x86loc_int_constant;
                usage->in_op2.data.int_val  = val;
            }
        }

        bincode_erase_instruction(function, insn);
        return;
    }


    // ���� ��� ��������� ������������ ������ ��� ���������� ������, ���������� � � �����.
    pattern = _is_constant_used_only_for_addition_in_address(function, insn);

    if (pattern) {
        // ��� ������������� ��������, ������� MOV � �������� ADD �� MOV.
        bincode_erase_instruction(function, insn);
        pattern->in_code   = x86insn_int_mov;

        // ������������ ��� ������, ������������ ������ �������, �� ����������� ��������.
        for (usage = pattern->in_next; usage != pseudoreg_info->reg_last_read->in_next; usage = usage->in_next) {
            if (bincode_operand_contains_register(&usage->in_op1, x86op_dword, reg)) {
                usage->in_op1.data.address.offset += val;
            } else if (bincode_operand_contains_register(&usage->in_op2, x86op_dword, reg)) {
                usage->in_op2.data.address.offset += val;
            }
        }

        return;
    }


    // ���� ��� ��������� ������������ � IMUL, ���������� ������������� ����� IMUL.
    pattern = _is_constant_used_only_in_imul(function, insn);

    if (pattern) {
        // ������� MOV � �������� IMUL �� ��� ������������� �����.
        bincode_erase_instruction(function, insn);
        pattern->in_code    = x86insn_imul_const;
        pattern->in_op3     = val;
        return;
    }
}

//
// �������� ��������/��������� �������� � ���������� �� LEA.
// �������: MOV reg,reg_src; ADD reg,val
static BOOL _try_optimize_reg_add_sub_const_into_lea(function_desc *function, x86_instruction *insn)
{
    int reg                             = insn->in_op1.data.reg;
    x86_pseudoreg_info *pseudoreg_info  = &function->func_dword_regstat.ptr[reg];
    int val                             = insn->in_op2.data.int_val;
    x86_instruction *mov, *checked;
    int reg_src;


    // ��������� ������������ ���� ��������.
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


    // ������� MOV � �������� ADD �� LEA.
    bincode_erase_instruction(function, mov);

    if (insn->in_code == x86insn_int_sub) {
        val = -val;
    }

    insn->in_code = x86insn_lea;
    bincode_create_operand_addr_from_reg_offset(&insn->in_op2, x86op_dword, reg_src, val);

    return TRUE;
}

//
// �������� ������������� ADD reg,const � INC/DEC.
static void _try_optimize_add_sub_const(function_desc *function, x86_instruction *insn)
{
    int val = insn->in_op2.data.int_val;

    if (val == 1 || val == -1) {
        insn->in_code = ((val == -1) ^ (insn->in_code == x86insn_int_sub)) ? x86insn_int_dec : x86insn_int_inc;
        insn->in_op2.op_loc = x86loc_none;
    }
}


//
//
// �������, ���������� ��������� ������������������, ������������ �� �������� ����������.
//
//

//
// ������������ ����������� � LEA.
static void _try_optimize_lea(function_desc *function, x86_instruction *insn)
{
    ASSERT(insn->in_op1.op_loc == x86loc_register);
    ASSERT(insn->in_op1.data.reg > 0);  // LEA ��������� ������ ����������������.

    if (insn->in_op2.op_loc == x86loc_symbol) {
        _try_optimize_lea_reg_symbol(function, insn);
    } else {
        ASSERT(insn->in_op2.op_loc == x86loc_address);
        _try_optimize_lea_reg_address(function, insn);
    }
}

//
// ������������ ����������� � MOV.
static void _try_optimize_mov(function_desc *function, x86_instruction *insn)
{
    if (OP_IS_PSEUDO_REG(insn->in_op1) && OP_IS_CONSTANT(insn->in_op2)) {
        _try_optimize_mov_reg_const(function, insn);
    }
}

//
// ������������ ����������� � ADD/SUB.
static void _try_optimize_add_sub(function_desc *function, x86_instruction *insn)
{
    if (OP_IS_CONSTANT(insn->in_op2)) {
        if (!_try_optimize_reg_add_sub_const_into_lea(function, insn)) {
            _try_optimize_add_sub_const(function, insn);
        }
    }
}


//
// ���� �����������, ������� ����������� ����� ����� ��������� �������������� ����.
// �� ���� ����� ����������� �������� ���������� ������ ������ ���������� � ����� ����������� �����,
// ��������� ���������� �������������� ��� x86 (�������� �������������� -
// � ������� ������� ���������� ��������� ���������� ��������� � x86).
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
        }
    }
}

//
// ���� �����������, ������� ����������� ����� ���������� � �� �������� ����������� ����������.
// �� �� ����� ������ ��������� ��������� ����, ��������, �� �� ����� ������� ������ push_all/pop_all,
// ��� ��� ��� ������������ ������� ����������.
//

void x86_optimization_after_inlining(function_desc *function)
{
    x86_instruction *insn, *next, *prev;

    for (insn = function->func_binary_code; insn; insn = next) {
        next = insn->in_next;
        prev = insn->in_prev;

        switch (insn->in_code) {
        case x86insn_push_all:
            if (prev && prev->in_code == x86insn_pop_all) {
                bincode_erase_instruction(function, insn);
                bincode_erase_instruction(function, prev);
                continue;
            }
            break;
        }
    }
}


// ���������� �������, ���� �� ������������ ��� ������ ����� ����������� ����������.
static BOOL _try_kill_copies_of_regvar(function_desc *function, x86_instruction *insn)
{
    int reg, regvar, regs_cnt, i;
    x86_register_ref regs_arr[MAX_REGISTERS_PER_INSN];
    x86_instruction *insn2;
    x86_operand_type type   = insn->in_op1.op_type;
    register_stat *regstat  = unit_get_regstat(function, type);


    // ���� ������� ���-�� ����������, ��� ������ �������
    reg     = insn->in_op1.data.reg;
    if (regstat->ptr[reg].reg_changes_value) {
        return FALSE;
    }

    // ���� ������ ������� - �� ����������� ����������, �������
    regvar  = insn->in_op2.data.reg;
    if (regvar < function->func_start_of_regvars[type]) {
        return FALSE;
    }

    // ���� ���������� ������ �������� �� ����� ����� �������� ���� ���� �������� ��������, �� ������ �������
    for (insn2 = regstat->ptr[reg].reg_first_write;
        insn2 != regstat->ptr[reg].reg_last_read; insn2 = insn2->in_next)
            if (IS_INT_MODIFYING_INSN(insn2->in_code) && insn2->in_op1.op_type == type
                && insn2->in_op1.data.reg == insn->in_op2.data.reg || insn2->in_code == x86insn_label) {
                    return FALSE;
                }

    insn2  = insn->in_next;
    bincode_erase_instruction(function, insn);

    insn    = insn2;
    regstat = unit_get_regstat(function, type);
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

// ���������� �������, ���� �� ������������ ��� ���������� ����������� ����������.
static BOOL _try_optimize_regvar_evaluation(function_desc *function, x86_instruction *insn)
{
    int reg, regvar, regs_cnt, i;
    x86_register_ref regs_arr[MAX_REGISTERS_PER_INSN];
    x86_instruction *insn2;
    x86_operand_type type = insn->in_op1.op_type;
    register_stat *regstat  = unit_get_regstat(function, type);


    reg     = insn->in_op2.data.reg;
    if (reg >= function->func_start_of_regvars[type]) {
        return FALSE;
    }

    regvar  = insn->in_op1.data.reg;
    if (regvar < function->func_start_of_regvars[type]) {
        return FALSE;
    }

    // ���������, ��� ����� ���� ���������� ����������� ���������� �� �������������� � ���� �������.
    for (insn2 = function->func_binary_code; insn2 != insn; insn2 = insn2->in_next) {
        bincode_extract_pseudoregs_from_insn(insn2, type, regs_arr, &regs_cnt);

        for (i = 0; i < regs_cnt; i++) {
            if (*regs_arr[i].reg_addr == regvar) {
                return FALSE;
            }
        }
    }

    // �������� ��� ��������� �������� �� ����������� ����������.
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


//
// ���� �����������, ������� ����������� ����� �������� ����������� ����������.
// �������� ����������, ���� ��� ������ ��������� ����� ����������.
void x86_optimization_after_regvar_allocation(function_desc *function)
{
    x86_instruction *insn, *next;
    BOOL was_smth;
    int orig_insn_count, insn_count;

    for (;;) {
        was_smth = FALSE;

        // ������� ��������� ������ ����������� ���������.
        for (insn = function->func_binary_code; insn; insn = next) {
            next = insn->in_next;

            if ((insn->in_code == x86insn_int_mov || insn->in_code == x86insn_sse_movss || insn->in_code == x86insn_sse_movsd)
                && OP_IS_PSEUDO_REG(insn->in_op1) && OP_IS_PSEUDO_REG(insn->in_op2)) {
                    if (_try_kill_copies_of_regvar(function, insn) || _try_optimize_regvar_evaluation(function, insn)) {
                        was_smth = TRUE;
                    }
            }
        }

        if (!was_smth)
            return;

        // ������� ����� ���������� � �������.
        for (insn_count = 0, insn = function->func_binary_code; insn; insn = insn->in_next)
            insn_count++;

        // ���� ����������� ��� ����������, � ����� ���������.
        do {
            // ����������� ���������� ����� ����������, ������� �� ������� � �����������.
            x86_analyze_registers_usage(function);

            orig_insn_count = insn_count;

            // ��������� �������� �����������.
            x86_optimization_after_codegen(function);

            // ������� ����� ���������� � �������.
            for (insn_count = 0, insn = function->func_binary_code; insn; insn = insn->in_next) {
                insn_count++;
            }

            // ������ ���������� ��������� �� ������.
            ASSERT(insn_count <= orig_insn_count);
        } while (insn_count != orig_insn_count);
    }
}
