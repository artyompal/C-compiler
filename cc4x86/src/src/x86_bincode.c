
#include "common.h"
#include "x86_bincode.h"


//
//  Library routines for various optimizer units: tell which registers are used by the given instruction/operand.
//

static void _extract_pseudoregs_from_operand(x86_operand *op, int *regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt)
{
    if (op->op_type == x86op_int_register) {
        ASSERT(*regs_cnt <= MAX_REGISTERS_PER_INSTR - 1);

        if (op->data.reg > 0) {
            regs[(*regs_cnt)++] = &op->data.reg;
        }
    } else if (op->op_type == x86op_address) {
        ASSERT(*regs_cnt <= MAX_REGISTERS_PER_INSTR - 2);

        if (op->data.address.base > 0) {
            regs[(*regs_cnt)++] = &op->data.address.base;
        }

        if (op->data.address.index > 0) {
            regs[(*regs_cnt)++] = &op->data.address.index;
        }
    }
}

void bincode_extract_pseudoregs_from_operand(x86_operand *op, int *regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt)
{
    *regs_cnt = 0;

    _extract_pseudoregs_from_operand(op, regs, regs_cnt);
}

void bincode_extract_pseudoregs_from_instr(x86_instruction *instr, int *regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt)
{
    *regs_cnt = 0;

    _extract_pseudoregs_from_operand(&instr->in_op1, regs, regs_cnt);
    _extract_pseudoregs_from_operand(&instr->in_op2, regs, regs_cnt);
}

void bincode_extract_pseudoregs_from_instr_wo_dupes(x86_instruction *instr, int regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt)
{
    int *tmp_regs[MAX_REGISTERS_PER_INSTR], tmp_regs_cnt, i, j, cnt;

    bincode_extract_pseudoregs_from_instr(instr, tmp_regs, &tmp_regs_cnt);
    cnt = 0;

    for (i = 0; i < tmp_regs_cnt; i++) {
        for (j = 0; j < cnt; j++) {
            if (*tmp_regs[i] == regs[j]) {
                goto next;
            }
        }

        regs[cnt++] = *tmp_regs[i];
        next:
        ;
    }

    *regs_cnt = cnt;
}

void bincode_extract_real_registers_from_instr(x86_instruction *instr, int regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt)
{
    *regs_cnt = 0;

    if (instr->in_op1.op_type == x86op_int_register && instr->in_op1.data.reg < 0
        && instr->in_op1.data.reg != ~x86reg_esp) {
            regs[(*regs_cnt)++] = ~instr->in_op1.data.reg;
    }

    if (instr->in_op2.op_type == x86op_int_register && instr->in_op2.data.reg < 0
        && instr->in_op2.data.reg != ~x86reg_esp) {
            regs[(*regs_cnt)++] = ~instr->in_op2.data.reg;
    }

    if (instr->in_code == x86instr_cdq) {
        regs[(*regs_cnt)++] = x86reg_edx;
    } else if (IS_SET_INSTR(instr->in_code)) {
        regs[(*regs_cnt)++] = x86reg_eax;
    }
}

BOOL bincode_instr_contains_register(x86_instruction *instr, int reg)
{
    int *regs_arr[MAX_REGISTERS_PER_INSTR], regs_count, i;

    bincode_extract_pseudoregs_from_instr(instr, regs_arr, &regs_count);

    for (i = 0; i < regs_count; i++) {
        if (*regs_arr[i] == reg) {
            return TRUE;
        }
    }

    return FALSE;
}

BOOL bincode_operand_contains_register(x86_operand *op, int reg)
{
    int *regs_arr[MAX_REGISTERS_PER_INSTR], regs_count, i;

    bincode_extract_pseudoregs_from_operand(op, regs_arr, &regs_count);

    for (i = 0; i < regs_count; i++) {
        if (*regs_arr[i] == reg) {
            return TRUE;
        }
    }

    return FALSE;
}

void bincode_extract_pseudoregs_read_by_instr(x86_instruction *instr, int regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt)
{
    *regs_cnt = 0;

    if (instr->in_op1.op_type == x86op_address) {
        ASSERT(*regs_cnt <= MAX_REGISTERS_PER_INSTR - 2);

        if (instr->in_op1.data.address.base > 0) {
            regs[(*regs_cnt)++] = instr->in_op1.data.address.base;
        }

        if (instr->in_op1.data.address.index > 0) {
            regs[(*regs_cnt)++] = instr->in_op1.data.address.index;
        }
    } else if (IS_CONSTANT_INSTR(instr->in_code) && instr->in_op1.op_type == x86op_int_register) {
        ASSERT(*regs_cnt <= MAX_REGISTERS_PER_INSTR - 1);

        if (instr->in_op1.data.reg > 0) {
            regs[(*regs_cnt)++] = instr->in_op1.data.reg;
        }
    }

    if (instr->in_op2.op_type == x86op_int_register) {
        ASSERT(*regs_cnt <= MAX_REGISTERS_PER_INSTR - 1);

        if (instr->in_op2.data.reg > 0) {
            regs[(*regs_cnt)++] = instr->in_op2.data.reg;
        }
    } else if (instr->in_op2.op_type == x86op_address) {
        ASSERT(*regs_cnt <= MAX_REGISTERS_PER_INSTR - 2);

        if (instr->in_op2.data.address.base > 0) {
            regs[(*regs_cnt)++] = instr->in_op2.data.address.base;
        }

        if (instr->in_op2.data.address.index > 0) {
            regs[(*regs_cnt)++] = instr->in_op2.data.address.index;
        }
    }
}

void bincode_extract_pseudoregs_written_by_instr(x86_instruction *instr, int regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt)
{
    *regs_cnt = 0;

    if (instr->in_op1.op_type == x86op_int_register && !IS_CONSTANT_INSTR(instr->in_code)) {
        ASSERT(*regs_cnt <= MAX_REGISTERS_PER_INSTR - 1);

        if (instr->in_op1.data.reg > 0) {
            regs[(*regs_cnt)++] = instr->in_op1.data.reg;
        }
    }
}



//
// Manipulations with operands.
//

void bincode_create_operand_from_int_constant(x86_operand *op, int constant)
{
    op->op_type             = x86op_int_constant;
    op->data.int_val        = constant;
}

void bincode_create_operand_from_int_register(x86_operand *op, x86_register reg)
{
    op->op_type             = x86op_int_register;
    op->data.reg            = ~reg;
}

void bincode_create_operand_from_int_pseudoreg(x86_operand *op, int reg)
{
    op->op_type             = x86op_int_register;
    op->data.reg            = reg;
}

void bincode_create_operand_from_float_register(x86_operand *op)
{
    op->op_type             = x86op_float_register;
}

void bincode_create_operand_addr_from_reg(x86_operand *op, int reg)
{
    op->op_type             = x86op_address;
    op->data.address.base   = reg;
    op->data.address.index  = 0;
    op->data.address.offset = 0;
}

void bincode_create_operand_addr_from_reg_offset(x86_operand *op, int reg, int offset)
{
    op->op_type             = x86op_address;
    op->data.address.base   = reg;
    op->data.address.index  = 0;
    op->data.address.offset = offset;
}

void bincode_create_operand_addr_from_reg_reg(x86_operand *op, int reg1, int reg2)
{
    op->op_type             = x86op_address;
    op->data.address.base   = reg1;
    op->data.address.index  = reg2;
    op->data.address.scale  = 1;
    op->data.address.offset = 0;
}

void bincode_create_operand_addr_from_reg_reg_scale(x86_operand *op, int reg1, int reg2, int scale)
{
    op->op_type             = x86op_address;
    op->data.address.base   = reg1;
    op->data.address.index  = reg2;
    op->data.address.scale  = scale;
    op->data.address.offset = 0;
}

void bincode_create_operand_addr_from_ebp_offset(x86_operand *op, int offset)
{
    op->op_type             = x86op_address;
    op->data.address.base   = ~x86reg_ebp;
    op->data.address.index  = 0;
    op->data.address.offset = offset;
}

void bincode_create_operand_addr_from_esp_offset(x86_operand *op, int offset)
{
    op->op_type             = x86op_address;
    op->data.address.base   = ~x86reg_esp;
    op->data.address.index  = 0;
    op->data.address.offset = offset;
}

void bincode_create_operand_from_symbol(x86_operand *op, symbol *sym)
{
    op->op_type             = x86op_symbol;
    op->data.sym            = sym;
}

void bincode_create_operand_from_label(x86_operand *op, int label)
{
    op->op_type             = x86op_label;
    op->data.label          = label;
}


//
//  Handling floating-point constants.
//

x86_instruction_code bincode_encode_float_constant(double val)
{
    if (val == 0.0) {
        return x86instr_float_zero;
    } else if (val == 1.0) {
        return x86instr_float_identity;
    } else if (val == 3.14159265358979323846) {
        return x86instr_float_pi;
    } else {
        return x86instr_count;
    }
}


//
//  Handling x86 binary code as double-linked list.
//

x86_instruction *bincode_create_instruction(x86_instruction_code code, x86_operand *op1, x86_operand *op2)
{
    x86_instruction *res    = allocator_alloc(allocator_temporary_pool, sizeof(x86_instruction));

    res->in_code            = code;

    if (op1) {
        res->in_op1         = *op1;
    } else {
        res->in_op1.op_type = x86op_none;
    }

    if (op2) {
        res->in_op2         = *op2;
    } else {
        res->in_op2.op_type = x86op_none;
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
        res->in_prev->in_next       = res;
    } else {
        function->func_binary_code  = res;
    }
}

void bincode_insert_int_reg_reg(function_desc *function, x86_instruction *next, x86_instruction_code code,
                                int dest_reg, int src_reg)
{
    x86_operand op1, op2;

    bincode_create_operand_from_int_pseudoreg(&op1, dest_reg);
    bincode_create_operand_from_int_pseudoreg(&op2, src_reg);
    bincode_insert_instruction(function, next, code, &op1, &op2);
}

void bincode_insert_int_reg_const(function_desc *function, x86_instruction *next, x86_instruction_code code,
                                  int dest_reg, int val)
{
    x86_operand op1, op2;

    bincode_create_operand_from_int_pseudoreg(&op1, dest_reg);
    bincode_create_operand_from_int_constant(&op2, val);
    bincode_insert_instruction(function, next, code, &op1, &op2);
}

void bincode_insert_int_reg_ebp_offset(function_desc *function, x86_instruction *next, x86_instruction_code code,
                                  int dest_reg, int offset)
{
    x86_operand op1, op2;

    bincode_create_operand_from_int_pseudoreg(&op1, dest_reg);
    bincode_create_operand_addr_from_ebp_offset(&op2, offset);
    bincode_insert_instruction(function, next, code, &op1, &op2);
}

void bincode_insert_push_reg(function_desc *function, x86_instruction *next, int reg)
{
    x86_operand op;

    bincode_create_operand_from_int_pseudoreg(&op, reg);
    bincode_insert_instruction(function, next, x86instr_push, &op, NULL);
}

void bincode_insert_pop_reg(function_desc *function, x86_instruction *next, int reg)
{
    x86_operand op;

    bincode_create_operand_from_int_pseudoreg(&op, reg);
    bincode_insert_instruction(function, next, x86instr_pop, &op, NULL);
}

void bincode_insert_fp_esp_offset(function_desc *function, x86_instruction *next, x86_instruction_code code, int ofs)
{
    x86_operand op;

    bincode_create_operand_addr_from_esp_offset(&op, ofs);
    bincode_insert_instruction(function, next, code, &op, NULL);
}

void bincode_erase_instruction(function_desc *function, x86_instruction *instr)
{
    if (instr->in_next) {
        instr->in_next->in_prev     = instr->in_prev;
    }

    if (instr->in_prev) {
        instr->in_prev->in_next     = instr->in_next;
    } else {
        function->func_binary_code  = instr->in_next;
    }
}

