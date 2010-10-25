
#include "common.h"
#include "x86_bincode.h"
#include "x86_codegen.h"
#include "x86_regalloc.h"


//
// Вспомогательные функции, используемые различными алгоритмами оптимизации:
// анализируют, какие регистры используются данной функцией или данным операндом.
//

static void _extract_pseudoregs_from_operand(x86_operand *op, x86_register_type type, x86_register_ref regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt)
{
    if (OP_IS_REGISTER(*op)) {
        ASSERT(*regs_cnt <= MAX_REGISTERS_PER_INSTR - 1);

        if (op->data.reg > 0 && op->op_type == type) {
            regs[*regs_cnt].reg_type    = op->op_type;
            regs[*regs_cnt].reg_addr    = &op->data.reg;
            ++*regs_cnt;
        }
    } else if (OP_IS_ADDRESS(*op) && type == x86reg_dword) {
        ASSERT(*regs_cnt <= MAX_REGISTERS_PER_INSTR - 2);

        if (op->data.address.base > 0) {
            regs[*regs_cnt].reg_type    = x86reg_dword;
            regs[*regs_cnt].reg_addr    = &op->data.address.base;
            ++*regs_cnt;
        }

        if (op->data.address.index > 0) {
            regs[*regs_cnt].reg_type    = x86reg_dword;
            regs[*regs_cnt].reg_addr    = &op->data.address.index;
            ++*regs_cnt;
        }
    }
}

void bincode_extract_pseudoregs_from_operand(x86_operand *op, x86_register_type type, x86_register_ref regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt)
{
    *regs_cnt = 0;
    _extract_pseudoregs_from_operand(op, type, regs, regs_cnt);
}

void bincode_extract_pseudoregs_from_instr(x86_instruction *instr, x86_register_type type, x86_register_ref regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt)
{
    *regs_cnt = 0;

    _extract_pseudoregs_from_operand(&instr->in_op1, type, regs, regs_cnt);

    if (instr->in_code != x86instr_call)
        _extract_pseudoregs_from_operand(&instr->in_op2, type, regs, regs_cnt);
}

void bincode_extract_pseudoregs_from_instr_wo_dupes(x86_instruction *instr, x86_register_type type, x86_register regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt)
{
    x86_register_ref tmp_regs[MAX_REGISTERS_PER_INSTR];
    int tmp_regs_cnt, i, j, cnt;

    bincode_extract_pseudoregs_from_instr(instr, type, tmp_regs, &tmp_regs_cnt);
    cnt = 0;

    for (i = 0; i < tmp_regs_cnt; i++) {
        for (j = 0; j < cnt; j++) {
            if (*tmp_regs[i].reg_addr == regs[j].reg_value) {
                goto next;
            }
        }

        regs[cnt].reg_type  = tmp_regs[i].reg_type;
        regs[cnt].reg_value = *tmp_regs[i].reg_addr;
        cnt++;

        next:
        ;
    }

    *regs_cnt = cnt;
}

void bincode_extract_real_registers_from_instr(x86_instruction *instr, x86_register_type type, x86_register regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt)
{
    *regs_cnt = 0;

    if (OP_IS_REAL_REG(instr->in_op1) &&
        (instr->in_op1.op_type != x86reg_dword || instr->in_op1.data.reg != ~x86reg_esp) &&
        instr->in_op1.op_type == type) {
            regs[*regs_cnt].reg_type    = instr->in_op1.op_type;
            regs[*regs_cnt].reg_value   = ~instr->in_op1.data.reg;
            ++*regs_cnt;
        }

    if (OP_IS_REAL_REG(instr->in_op2) && instr->in_code != x86instr_call &&
        (instr->in_op2.op_type != x86reg_dword || instr->in_op2.data.reg != ~x86reg_esp) &&
        instr->in_op2.op_type == type) {
            regs[*regs_cnt].reg_type    = instr->in_op2.op_type;
            regs[*regs_cnt].reg_value   = ~instr->in_op2.data.reg;
            ++*regs_cnt;
        }

    if (instr->in_code == x86instr_cdq && type != x86reg_dword) {
        regs[*regs_cnt].reg_value   = x86reg_dword;
        regs[*regs_cnt].reg_value   = x86reg_edx;
        ++*regs_cnt;
    } else if (IS_SET_INSTR(instr->in_code) && type != x86reg_dword) {
        regs[*regs_cnt].reg_value   = x86reg_dword;
        regs[*regs_cnt].reg_value   = x86reg_eax;
        ++*regs_cnt;
    }
}

BOOL bincode_instr_contains_register(x86_instruction *instr, x86_register_type type, int reg)
{
    x86_register_ref regs_arr[MAX_REGISTERS_PER_INSTR];
    int regs_count, i;

    bincode_extract_pseudoregs_from_instr(instr, type, regs_arr, &regs_count);

    for (i = 0; i < regs_count; i++) {
        if (regs_arr[i].reg_type == type && *regs_arr[i].reg_addr == reg) {
            return TRUE;
        }
    }

    return FALSE;
}

BOOL bincode_operand_contains_register(x86_operand *op, x86_register_type type, int reg)
{
    x86_register_ref regs_arr[MAX_REGISTERS_PER_INSTR];
    int regs_count, i;

    bincode_extract_pseudoregs_from_operand(op, type, regs_arr, &regs_count);

    for (i = 0; i < regs_count; i++) {
        if (regs_arr[i].reg_type == type && *regs_arr[i].reg_addr == reg) {
            return TRUE;
        }
    }

    return FALSE;
}

void bincode_extract_pseudoregs_read_by_instr(x86_instruction *instr, x86_register regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt)
{
    *regs_cnt = 0;

    if (OP_IS_ADDRESS(instr->in_op1)) {
        ASSERT(*regs_cnt <= MAX_REGISTERS_PER_INSTR - 2);

        if (instr->in_op1.data.address.base > 0) {
            regs[*regs_cnt].reg_type    = x86reg_dword;
            regs[*regs_cnt].reg_value   = instr->in_op1.data.address.base;
            ++*regs_cnt;
        }

        if (instr->in_op1.data.address.index > 0) {
            regs[*regs_cnt].reg_type    = x86reg_dword;
            regs[*regs_cnt].reg_value   = instr->in_op1.data.address.index;
            ++*regs_cnt;
        }
    } else if (IS_CONSTANT_INSTR(instr->in_code) && OP_IS_REGISTER(instr->in_op1)) {
        ASSERT(*regs_cnt <= MAX_REGISTERS_PER_INSTR - 1);

        if (instr->in_op1.data.reg > 0) {
            regs[*regs_cnt].reg_type    = instr->in_op1.op_type;
            regs[*regs_cnt].reg_value   = instr->in_op1.data.reg;
            ++*regs_cnt;
        }
    }

    if (OP_IS_REGISTER(instr->in_op2)) {
        ASSERT(*regs_cnt <= MAX_REGISTERS_PER_INSTR - 1);

        if (instr->in_op2.data.reg > 0) {
            regs[*regs_cnt].reg_type    = instr->in_op2.op_type;
            regs[*regs_cnt].reg_value   = instr->in_op2.data.reg;
            ++*regs_cnt;
        }
    } else if (OP_IS_ADDRESS(instr->in_op2)) {
        ASSERT(*regs_cnt <= MAX_REGISTERS_PER_INSTR - 2);

        if (instr->in_op2.data.address.base > 0) {
            regs[*regs_cnt].reg_type    = x86reg_dword;
            regs[*regs_cnt].reg_value   = instr->in_op2.data.address.base;
            ++*regs_cnt;
        }

        if (instr->in_op2.data.address.index > 0) {
            regs[*regs_cnt].reg_type    = x86reg_dword;
            regs[*regs_cnt].reg_value   = instr->in_op2.data.address.index;
            ++*regs_cnt;
        }
    }
}

void bincode_extract_pseudoregs_written_by_instr(x86_instruction *instr, x86_register regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt)
{
    *regs_cnt = 0;

    if (OP_IS_REGISTER(instr->in_op1) && !IS_CONSTANT_INSTR(instr->in_code)) {
        ASSERT(*regs_cnt <= MAX_REGISTERS_PER_INSTR - 1);

        if (instr->in_op1.data.reg > 0) {
            regs[*regs_cnt].reg_type    = instr->in_op1.op_type;
            regs[*regs_cnt].reg_value   = instr->in_op1.data.reg;
            ++*regs_cnt;
        }
    }
}


//
// Создание различных операндов инструкций.
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
    op->data.sym            = sym;
}

void bincode_create_operand_from_label(x86_operand *op, int label)
{
    op->op_loc              = x86loc_label;
    op->op_type             = x86op_none;
    op->data.label          = label;
}


//
// Обработка вещественных констант.
//

x86_instruction_code bincode_encode_float_constant(double val)
{
    if (val == 0.0) {
        return x86instr_fpu_zero;
    } else if (val == 1.0) {
        return x86instr_fpu_identity;
    } else if (val == 3.14159265358979323846) {
        return x86instr_fpu_pi;
    } else {
        return x86instr_count;
    }
}


//
// Обслуживание бинарного кода, представленного двусвязным списком.
//

x86_instruction *bincode_create_instruction(x86_instruction_code code, x86_operand *op1, x86_operand *op2)
{
    x86_instruction *res    = allocator_alloc(allocator_temporary_pool, sizeof(x86_instruction));

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

void bincode_insert_int_reg_reg(function_desc *function, x86_instruction *next, x86_instruction_code code,
                                x86_operand_type type, int dest_reg, int src_reg)
{
    x86_operand op1, op2;

    bincode_create_operand_from_pseudoreg(&op1, type, dest_reg);
    bincode_create_operand_from_pseudoreg(&op2, type, src_reg);
    bincode_insert_instruction(function, next, code, &op1, &op2);
}

void bincode_insert_int_reg_const(function_desc *function, x86_instruction *next, x86_instruction_code code,
                                  x86_operand_type type, int dest_reg, int val)
{
    x86_operand op1, op2;

    bincode_create_operand_from_pseudoreg(&op1, type, dest_reg);
    bincode_create_operand_from_int_constant(&op2, type, val);
    bincode_insert_instruction(function, next, code, &op1, &op2);
}

void bincode_insert_int_reg_ebp_offset(function_desc *function, x86_instruction *next, x86_instruction_code code,
                                       x86_operand_type type, int dest_reg, int offset)
{
    x86_operand op1, op2;

    bincode_create_operand_from_pseudoreg(&op1, x86_encode_register_type(type), dest_reg);
    bincode_create_operand_addr_from_ebp_offset(&op2, type, offset);
    bincode_insert_instruction(function, next, code, &op1, &op2);
}

void bincode_insert_int_ebp_offset_reg(function_desc *function, x86_instruction *next, x86_instruction_code code,
                                       x86_operand_type type, int offset, int dest_reg)
{
    x86_operand op1, op2;

    bincode_create_operand_addr_from_ebp_offset(&op1, type, offset);
    bincode_create_operand_from_pseudoreg(&op2, x86_encode_register_type(type), dest_reg);
    bincode_insert_instruction(function, next, code, &op1, &op2);
}

void bincode_insert_push_reg(function_desc *function, x86_instruction *next, x86_operand_type type, int reg)
{
    x86_operand op;

    bincode_create_operand_from_pseudoreg(&op, type, reg);
    bincode_insert_instruction(function, next, x86instr_push, &op, NULL);
}

void bincode_insert_pop_reg(function_desc *function, x86_instruction *next, x86_operand_type type, int reg)
{
    x86_operand op;

    bincode_create_operand_from_pseudoreg(&op, type, reg);
    bincode_insert_instruction(function, next, x86instr_pop, &op, NULL);
}

void bincode_insert_fp_esp_offset(function_desc *function, x86_instruction *next, x86_instruction_code code, x86_operand_type type, int ofs)
{
    x86_operand op;

    bincode_create_operand_addr_from_esp_offset(&op, type, ofs);
    bincode_insert_instruction(function, next, code, &op, NULL);
}

void bincode_erase_instruction(function_desc *function, x86_instruction *instr)
{
    if (instr->in_next) {
        instr->in_next->in_prev         = instr->in_prev;
    } else {
        function->func_binary_code_end  = instr->in_prev;
    }

    if (instr->in_prev) {
        instr->in_prev->in_next         = instr->in_next;
    } else {
        function->func_binary_code      = instr->in_next;
    }
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
        return x86op_double;
    case code_type_long_double:
        return x86op_long_double;

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

