
#include "common.h"
#include "x86_bincode.h"
#include "x86_codegen.h"
#include "x86_regalloc.h"


//
// ��������������� �������, ������������ ���������� ����������� �����������:
// �����������, ����� �������� ������������ ������ �������� ��� ������ ���������.
//

static void _extract_pseudoregs_from_operand(x86_operand *op, x86_operand_type type, x86_register_ref regs[MAX_REGISTERS_PER_INSN], int *regs_cnt)
{
    if (OP_IS_REGISTER(*op)) {
        ASSERT(*regs_cnt <= MAX_REGISTERS_PER_INSN - 1);

        if (op->data.reg > 0 && x86_equal_types(op->op_type, type)) {
            regs[*regs_cnt].reg_type    = op->op_type;
            regs[*regs_cnt].reg_addr    = &op->data.reg;
            ++*regs_cnt;
        }
    } else if (OP_IS_ADDRESS(*op) && type == x86op_dword) {
        ASSERT(*regs_cnt <= MAX_REGISTERS_PER_INSN - 2);

        if (op->data.address.base > 0) {
            regs[*regs_cnt].reg_type    = x86op_dword;
            regs[*regs_cnt].reg_addr    = &op->data.address.base;
            ++*regs_cnt;
        }

        if (op->data.address.index > 0) {
            regs[*regs_cnt].reg_type    = x86op_dword;
            regs[*regs_cnt].reg_addr    = &op->data.address.index;
            ++*regs_cnt;
        }
    }
}

void bincode_extract_pseudoregs_from_operand(x86_operand *op, x86_operand_type type, x86_register_ref regs[MAX_REGISTERS_PER_INSN], int *regs_cnt)
{
    *regs_cnt = 0;
    _extract_pseudoregs_from_operand(op, type, regs, regs_cnt);
}

void bincode_extract_pseudoregs_from_insn(x86_instruction *insn, x86_operand_type type, x86_register_ref regs[MAX_REGISTERS_PER_INSN], int *regs_cnt)
{
    *regs_cnt = 0;
    _extract_pseudoregs_from_operand(&insn->in_op1, type, regs, regs_cnt);

    if (insn->in_code != x86insn_call)
        _extract_pseudoregs_from_operand(&insn->in_op2, type, regs, regs_cnt);
}

void bincode_extract_pseudoregs_from_insn_wo_dupes(x86_instruction *insn, x86_operand_type type, int regs[MAX_REGISTERS_PER_INSN], int *regs_cnt)
{
    x86_register_ref tmp_regs[MAX_REGISTERS_PER_INSN];
    int tmp_regs_cnt, i, j, cnt;

    bincode_extract_pseudoregs_from_insn(insn, type, tmp_regs, &tmp_regs_cnt);
    cnt = 0;

    for (i = 0; i < tmp_regs_cnt; i++) {
        for (j = 0; j < cnt; j++) {
            if (*tmp_regs[i].reg_addr == regs[j]) break;
        }

        if (j == cnt) {
            ASSERT(x86_equal_types(tmp_regs[i].reg_type, type));
            regs[cnt++] = *tmp_regs[i].reg_addr;
        }
    }

    *regs_cnt = cnt;
}

void bincode_extract_real_registers_from_insn(x86_instruction *insn, x86_operand_type type, x86_register regs[MAX_REGISTERS_PER_INSN], int *regs_cnt)
{
    *regs_cnt = 0;

    if (OP_IS_REAL_REG(insn->in_op1) &&
        (insn->in_op1.op_type != x86op_dword || insn->in_op1.data.reg != ~x86reg_esp) &&
            x86_equal_types(insn->in_op1.op_type, type)) {
                regs[*regs_cnt].reg_type    = insn->in_op1.op_type;
                regs[*regs_cnt].reg_value   = ~insn->in_op1.data.reg;
                ++*regs_cnt;
            }

    if (OP_IS_REAL_REG(insn->in_op2) && insn->in_code != x86insn_call &&
        (insn->in_op2.op_type != x86op_dword || insn->in_op2.data.reg != ~x86reg_esp) &&
            x86_equal_types(insn->in_op2.op_type, type)) {
                regs[*regs_cnt].reg_type    = insn->in_op2.op_type;
                regs[*regs_cnt].reg_value   = ~insn->in_op2.data.reg;
                ++*regs_cnt;
            }

    if (IS_SET_INSN(insn->in_code) && type != x86op_dword) {
        regs[*regs_cnt].reg_value   = x86op_dword;
        regs[*regs_cnt].reg_value   = x86reg_eax;
        ++*regs_cnt;
    }
}

BOOL bincode_insn_contains_register(x86_instruction *insn, x86_operand_type type, int reg)
{
    x86_register_ref regs_arr[MAX_REGISTERS_PER_INSN];
    int regs_count, i;

    bincode_extract_pseudoregs_from_insn(insn, type, regs_arr, &regs_count);

    for (i = 0; i < regs_count; i++) {
        if (regs_arr[i].reg_type == type && *regs_arr[i].reg_addr == reg) {
            return TRUE;
        }
    }

    return FALSE;
}

BOOL bincode_operand_contains_register(x86_operand *op, x86_operand_type type, int reg)
{
    x86_register_ref regs_arr[MAX_REGISTERS_PER_INSN];
    int regs_count, i;

    bincode_extract_pseudoregs_from_operand(op, type, regs_arr, &regs_count);

    for (i = 0; i < regs_count; i++) {
        if (regs_arr[i].reg_type == type && *regs_arr[i].reg_addr == reg) {
            return TRUE;
        }
    }

    return FALSE;
}

void bincode_extract_pseudoregs_read_by_insn(x86_instruction *insn, x86_operand_type type, int regs[MAX_REGISTERS_PER_INSN], int *regs_cnt)
{
    *regs_cnt = 0;

    if (OP_IS_ADDRESS(insn->in_op1)) {
        if (type == x86op_dword) {
            ASSERT(*regs_cnt <= MAX_REGISTERS_PER_INSN - 2);

            if (insn->in_op1.data.address.base > 0)
            {
                regs[*regs_cnt] = insn->in_op1.data.address.base;
                ++*regs_cnt;
            }

            if (insn->in_op1.data.address.index > 0)
            {
                regs[*regs_cnt] = insn->in_op1.data.address.index;
                ++*regs_cnt;
            }
        }
    } else if (OP_IS_REGISTER(insn->in_op1) && !IS_DEFINING_INSN(insn->in_code, type)) {
        ASSERT(*regs_cnt <= MAX_REGISTERS_PER_INSN - 1);

        if (insn->in_op1.data.reg > 0 && x86_equal_types(type, insn->in_op1.op_type))
        {
            regs[*regs_cnt] = insn->in_op1.data.reg;
            ++*regs_cnt;
        }
    }

    if (OP_IS_REGISTER(insn->in_op2)) {
        ASSERT(*regs_cnt <= MAX_REGISTERS_PER_INSN - 1);

        if (insn->in_op2.data.reg > 0 && x86_equal_types(type, insn->in_op2.op_type))
        {
            regs[*regs_cnt] = insn->in_op2.data.reg;
            ++*regs_cnt;
        }
    } else if (OP_IS_ADDRESS(insn->in_op2)) {
        if (type == x86op_dword) {
            ASSERT(*regs_cnt <= MAX_REGISTERS_PER_INSN - 2);

            if (insn->in_op2.data.address.base > 0)
            {
                regs[*regs_cnt] = insn->in_op2.data.address.base;
                ++*regs_cnt;
            }

            if (insn->in_op2.data.address.index > 0)
            {
                regs[*regs_cnt] = insn->in_op2.data.address.index;
                ++*regs_cnt;
            }
        }
    }
}

void bincode_extract_pseudoregs_modified_by_insn(x86_instruction *insn, x86_operand_type type, int regs[MAX_REGISTERS_PER_INSN], int *regs_cnt)
{
    *regs_cnt = 0;

    if (OP_IS_REGISTER(insn->in_op1) && x86_equal_types(type, insn->in_op1.op_type) && IS_MODIFYING_INSN(insn->in_code))
        if (insn->in_op1.data.reg > 0)
        {
            regs[*regs_cnt] = insn->in_op1.data.reg;
            ++*regs_cnt;
        }
}

void bincode_extract_pseudoregs_overwritten_by_insn(x86_instruction *insn, x86_operand_type type, int regs[MAX_REGISTERS_PER_INSN], int *regs_cnt)
{
    *regs_cnt = 0;

    if (OP_IS_REGISTER(insn->in_op1) && x86_equal_types(type, insn->in_op1.op_type) && IS_DEFINING_INSN(insn->in_code, type))
        if (insn->in_op1.data.reg > 0)
        {
            regs[*regs_cnt] = insn->in_op1.data.reg;
            ++*regs_cnt;
        }
}


//
// �������� ��������� ��������� ����������.
//

void bincode_create_operand_from_int_constant(x86_operand *op, x86_operand_type type, int constant)
{
    op->op_loc              = x86loc_int_constant;
    op->op_type             = type;
    op->data.int_val        = constant;
}

void bincode_create_operand_from_register(x86_operand *op, x86_operand_type type, int reg)
{
    op->op_loc              = x86loc_register;
    op->op_type             = type;
    op->data.reg            = ~reg;
}

void bincode_create_operand_from_pseudoreg(x86_operand *op, x86_operand_type type, int reg)
{
    op->op_loc              = x86loc_register;
    op->op_type             = type;
    op->data.reg            = reg;
}

void bincode_create_operand_and_alloc_pseudoreg(x86_operand *op, x86_operand_type type)
{
    op->op_loc              = x86loc_register;
    op->op_type             = type;
    op->data.reg            = x86_codegen_alloc_pseudoreg(type);
}

void bincode_create_operand_and_alloc_pseudoreg_in_function(function_desc *function, x86_operand *op, x86_operand_type type)
{
    op->op_loc              = x86loc_register;
    op->op_type             = type;
    op->data.reg            = function->func_pseudoregs_count[x86_encode_register_type(type)]++;
}

void bincode_create_operand_addr_from_reg(x86_operand *op, x86_operand_type type, int reg)
{
    op->op_loc              = x86loc_address;
    op->op_type             = type;
    op->data.address.base   = reg;
    op->data.address.index  = 0;
    op->data.address.offset = 0;
}

void bincode_create_operand_addr_from_reg_offset(x86_operand *op, x86_operand_type type, int reg, int offset)
{
    op->op_loc              = x86loc_address;
    op->op_type             = type;
    op->data.address.base   = reg;
    op->data.address.index  = 0;
    op->data.address.offset = offset;
}

void bincode_create_operand_addr_from_reg_reg(x86_operand *op, x86_operand_type type, int reg1, int reg2)
{
    op->op_loc              = x86loc_address;
    op->op_type             = type;
    op->data.address.base   = reg1;
    op->data.address.index  = reg2;
    op->data.address.scale  = 1;
    op->data.address.offset = 0;
}

void bincode_create_operand_addr_from_reg_reg_scale(x86_operand *op, x86_operand_type type, int reg1, int reg2, int scale)
{
    op->op_loc              = x86loc_address;
    op->op_type             = type;
    op->data.address.base   = reg1;
    op->data.address.index  = reg2;
    op->data.address.scale  = scale;
    op->data.address.offset = 0;
}

void bincode_create_operand_addr_from_ebp_offset(x86_operand *op, x86_operand_type type, int offset)
{
    op->op_loc              = x86loc_address;
    op->op_type             = type;
    op->data.address.base   = ~x86reg_ebp;
    op->data.address.index  = 0;
    op->data.address.offset = offset;
}

void bincode_create_operand_addr_from_esp_offset(x86_operand *op, x86_operand_type type, int offset)
    {
    op->op_loc              = x86loc_address;
    op->op_type             = type;
    op->data.address.base   = ~x86reg_esp;
    op->data.address.index  = 0;
    op->data.address.offset = offset;
}

void bincode_create_operand_from_symbol(x86_operand *op, symbol *sym)
{
    op->op_loc              = x86loc_symbol;
    op->op_type             = x86op_dword;
    op->data.sym.name       = sym;
    op->data.sym.offset     = 0;
}

void bincode_create_operand_from_label(x86_operand *op, int label)
{
    op->op_loc              = x86loc_label;
    op->op_type             = x86op_none;
    op->data.label          = label;
}


//
// ��������� ������������ ��������.
//

x86_instruction_code bincode_encode_float_constant(double val)
{
    if (val == 0.0) {
        return x86insn_fpu_zero;
    } else if (val == 1.0) {
        return x86insn_fpu_identity;
    } else if (val == 3.14159265358979323846) {
        return x86insn_fpu_pi;
    } else {
        return x86insn_count;
    }
}


//
// ������������ ��������� ����, ��������������� ���������� �������.
//

x86_instruction *bincode_create_instruction(x86_instruction_code code, x86_operand *op1, x86_operand *op2)
{
    x86_instruction *res    = allocator_alloc(allocator_global_pool, sizeof(x86_instruction));

    res->in_code            = code;

    if (op1) {
        res->in_op1         = *op1;
    } else {
        res->in_op1.op_loc = x86loc_none;
    }

    if (op2) {
        res->in_op2         = *op2;
    } else {
        res->in_op2.op_loc = x86loc_none;
    }

    return res;
}


void bincode_insert_instruction(function_desc *function, x86_instruction *pos, x86_instruction_code code,
                                x86_operand *op1, x86_operand *op2)
{
    x86_instruction *res    = bincode_create_instruction(code, op1, op2);

    res->in_next            = pos;
    res->in_prev            = pos->in_prev;
    pos->in_prev            = res;

    if (res->in_prev) {
        res->in_prev->in_next           = res;
    } else {
        function->func_binary_code      = res;
    }

    if (res->in_next) {
        res->in_next->in_prev           = res;
    } else {
        function->func_binary_code_end  = res;
    }
}

void bincode_insert_unary_instruction(function_desc *function, x86_instruction *pos, x86_instruction_code code,
                                      x86_operand *op)
{
    x86_operand empty_op;

    empty_op.op_loc = x86op_none;
    bincode_insert_instruction(function, pos, code, op, &empty_op);
}

void bincode_insert_insn_reg_reg(function_desc *function, x86_instruction *pos, x86_instruction_code code,
                                x86_operand_type type, int dest_reg, int src_reg)
{
    x86_operand op1, op2;

    bincode_create_operand_from_pseudoreg(&op1, type, dest_reg);
    bincode_create_operand_from_pseudoreg(&op2, type, src_reg);
    bincode_insert_instruction(function, pos, code, &op1, &op2);
}

void bincode_insert_insn_reg_const(function_desc *function, x86_instruction *pos, x86_instruction_code code,
                                  x86_operand_type type, int dest_reg, int val)
{
    x86_operand op1, op2;

    bincode_create_operand_from_pseudoreg(&op1, type, dest_reg);
    bincode_create_operand_from_int_constant(&op2, type, val);
    bincode_insert_instruction(function, pos, code, &op1, &op2);
}

void bincode_insert_insn_reg_ebp_offset(function_desc *function, x86_instruction *pos, x86_instruction_code code,
                                       x86_operand_type type, int dest_reg, int offset)
{
    x86_operand op1, op2;

    bincode_create_operand_from_pseudoreg(&op1, x86_encode_register_type(type), dest_reg);
    bincode_create_operand_addr_from_ebp_offset(&op2, type, offset);
    bincode_insert_instruction(function, pos, code, &op1, &op2);
}

void bincode_insert_insn_ebp_offset_reg(function_desc *function, x86_instruction *pos, x86_instruction_code code,
                                       x86_operand_type type, int offset, int dest_reg)
{
    x86_operand op1, op2;

    bincode_create_operand_addr_from_ebp_offset(&op1, type, offset);
    bincode_create_operand_from_pseudoreg(&op2, x86_encode_register_type(type), dest_reg);
    bincode_insert_instruction(function, pos, code, &op1, &op2);
}

void bincode_insert_push_reg(function_desc *function, x86_instruction *pos, x86_operand_type type, int reg)
{
    x86_operand op;

    bincode_create_operand_from_pseudoreg(&op, type, reg);
    bincode_insert_instruction(function, pos, x86insn_push, &op, NULL);
}

void bincode_insert_pop_reg(function_desc *function, x86_instruction *pos, x86_operand_type type, int reg)
{
    x86_operand op;

    bincode_create_operand_from_pseudoreg(&op, type, reg);
    bincode_insert_instruction(function, pos, x86insn_pop, &op, NULL);
}

void bincode_insert_fp_esp_offset(function_desc *function, x86_instruction *pos, x86_instruction_code code, x86_operand_type type, int ofs)
{
    x86_operand op;

    bincode_create_operand_addr_from_esp_offset(&op, type, ofs);
    bincode_insert_instruction(function, pos, code, &op, NULL);
}

void bincode_insert_comment(function_desc *function, x86_instruction *pos, const char *s1, const char *s2)
{
    x86_operand op1, op2;

    bincode_create_operand_from_int_constant(&op1, x86op_unused, (int)s1);
    bincode_create_operand_from_int_constant(&op2, x86op_unused, (int)s2);
    bincode_insert_instruction(function, pos, x86insn_comment, &op1, &op2);
}

void bincode_erase_instruction(function_desc *function, x86_instruction *insn)
{
    if (insn->in_next) {
        insn->in_next->in_prev         = insn->in_prev;
    } else {
        function->func_binary_code_end  = insn->in_prev;
    }

    if (insn->in_prev) {
        insn->in_prev->in_next         = insn->in_next;
    } else {
        function->func_binary_code      = insn->in_next;
    }

    memset(insn, 0xee, sizeof(x86_instruction));
}


x86_operand_type bincode_encode_type(data_type *type)
{
    switch (type->type_code) {
    case code_type_char:
    case code_type_unsigned_char:
        return x86op_byte;

    case code_type_short:
    case code_type_unsigned_short:
        return x86op_word;

    case code_type_int:
    case code_type_unsigned_int:
    case code_type_long:
    case code_type_unsigned_long:
    case code_type_pointer:
    case code_type_sized_array:
    case code_type_unsized_array:
    case code_type_enum:
    case code_type_incomplete_enum:
        return x86op_dword;

    case code_type_long_long:
    case code_type_unsigned_long_long:
        return x86op_qword;

    case code_type_float:
        return x86op_float;
    case code_type_double:
    case code_type_long_double:
        return x86op_double;

    case code_type_structure:
    case code_type_union:
    case code_type_void:
        return x86op_unused;

    case code_type_function:
    case code_type_incomplete_structure:
    case code_type_incomplete_union:
    default:
        ASSERT(FALSE);
    }
}

int bincode_get_max_register(x86_operand_type type)
{
    return (type == x86op_dword ? x86reg_ebp : X86_MAX_REG);
}

