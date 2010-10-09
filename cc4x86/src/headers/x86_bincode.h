
#ifndef X86_BINCODE_H__INCLUDED
#define X86_BINCODE_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


#include "unit.h"


typedef enum x86_register_decl {
    x86reg_eax,
    x86reg_ecx,
    x86reg_edx,
    x86reg_ebx,
    x86reg_esp,
    x86reg_ebp,
    x86reg_esi,
    x86reg_edi,

    x86reg_count,
} x86_register;

typedef enum x86_operand_type_decl {
    x86op_none,

    x86op_int_register,
    x86op_float_register,
    x86op_address,
    x86op_int_constant,
    x86op_symbol,
    x86op_symbol_offset,
    x86op_label,
} x86_operand_type;

typedef struct x86_operand_decl {
    x86_operand_type op_type;

    union data_decl {
        // x86op_int_register
        // for codegen: 0 - unused, positive value - pseudo-register, negative value - x86 register
        // for output: positive value - x86 register, non-positive value - unused.
        int reg;

        // x86op_int_pseudo_variable
        int var;

        // x86op_address (base and index are x86op_int_register's)
        struct address_decl {
            int     base;
            int     index;
            int     scale;
            int     offset;
        } address;

        // x86op_int_constant
        int int_val;

        // x86op_symbol, x86op_symbol_offset
        symbol *sym;

        // x86op_label
        int label;
    } data;
} x86_operand;


typedef enum x86_instruction_code_decl {
    // function-calling instructions:
    x86instr_call,
    x86instr_call_int,
    x86instr_call_float,
    x86instr_ret,
    x86instr_push,
    x86instr_pop,

    // jump instructions:
    x86instr_jmp,
    x86instr_je,
    x86instr_jne,
    x86instr_jle,
    x86instr_jl,
    x86instr_jge,
    x86instr_jg,
    x86instr_jbe,
    x86instr_jb,
    x86instr_jae,
    x86instr_ja,

    // integer instructions:
    x86instr_int_inc,
    x86instr_int_dec,
    x86instr_int_neg,
    x86instr_int_not,

    x86instr_int_mov,
    x86instr_int_add,
    x86instr_int_sub,
    x86instr_int_imul,
    x86instr_int_idiv,
    x86instr_int_sal,
    x86instr_int_sar,
    x86instr_int_and,
    x86instr_int_xor,
    x86instr_int_or,

    x86instr_int_sete,
    x86instr_int_setne,
    x86instr_int_setle,
    x86instr_int_setl,
    x86instr_int_setge,
    x86instr_int_setg,
    x86instr_int_setbe,
    x86instr_int_setb,
    x86instr_int_setae,
    x86instr_int_seta,

    // floating-point instructions:
    x86instr_float_ld,
    x86instr_float_ld_int,
    x86instr_float_st,
    x86instr_float_stp,
    x86instr_float_stp_int,
    x86instr_float_stp_double,
    x86instr_float_add,
    x86instr_float_sub,
    x86instr_float_mul,
    x86instr_float_div,
    x86instr_float_subr,
    x86instr_float_divr,

    x86instr_float_identity,
    x86instr_float_zero,
    x86instr_float_log2_10,
    x86instr_float_log2_e,
    x86instr_float_pi,
    x86instr_float_lg_2,
    x86instr_float_ln_2,

    // internally-generated instructions:
    x86instr_cdq,
    x86instr_movzx_al,
    x86instr_int_cmp,
    x86instr_lea,
    x86instr_int_test,
    x86instr_float_cmp,
    x86instr_cld,
    x86instr_rep_movsb,
    x86instr_rep_movsd,
    x86instr_imul_const,
    x86instr_int_xchg,

    // pseudo-instructions:
    x86instr_label,
    x86instr_push_all,
    x86instr_pop_all,
    x86instr_create_stack_frame,
    x86instr_destroy_stack_frame,

    x86instr_count,
} x86_instruction_code;

typedef struct x86_instruction_decl {
    x86_instruction_code        in_code;
    x86_operand                 in_op1;
    x86_operand                 in_op2;
    int                         in_op3;
    struct x86_instruction_decl *in_next;
    struct x86_instruction_decl *in_prev;
} x86_instruction;


#define IS_CALL_INSTR(INSTR)            ((INSTR) >= x86instr_call && (INSTR) <= x86instr_call_float)
#define IS_INT_INSTR(INSTR)             ((INSTR) >= x86instr_int_inc && (INSTR) <= x86instr_int_seta)
#define IS_SET_INSTR(INSTR)             ((INSTR) >= x86instr_int_sete && (INSTR) <= x86instr_int_seta)
#define IS_FLOAT_INSTR(INSTR)           ((INSTR) >= x86instr_float_ld && (INSTR) <= x86instr_float_ln_2)
#define IS_JMP_INSTR(INSTR)             ((INSTR) >= x86instr_jmp && (INSTR) <= x86instr_ja)
#define IS_CONSTANT_INSTR(INSTR)        ((INSTR) == x86instr_int_cmp || (INSTR) == x86instr_int_test)

#define IS_FLOAT_STP_INSTR(INSTR)           ((INSTR) >= x86instr_float_stp && (INSTR) <= x86instr_float_stp_double)
#define IS_FLOAT_UNARY_ARITHM_INSTR(INSTR)  ((INSTR) >= x86instr_float_identity && (INSTR) <= x86instr_float_ln_2)
#define IS_FLOAT_BINARY_ARITHM_INSTR(INSTR) ((INSTR) >= x86instr_float_add && (INSTR) <= x86instr_float_divr)

#define MAX_REGISTERS_PER_INSTR (3)

#define OP_IS_REAL_REG(OP)              ((OP).op_type == x86op_int_register && (OP).data.reg < 0)
#define OP_IS_THIS_REAL_REG(OP, REG)    ((OP).op_type == x86op_int_register && (OP).data.reg == ~(REG))
#define OP_IS_PSEUDO_REG(OP)            ((OP).op_type == x86op_int_register && (OP).data.reg > 0)
#define OP_IS_THIS_PSEUDO_REG(OP, REG)  ((OP).op_type == x86op_int_register && (OP).data.reg == (REG))
#define OP_IS_CONSTANT(OP)              ((OP).op_type == x86op_int_constant)
#define OP_IS_ADDRESS(OP)               ((OP).op_type == x86op_address)
#define OP_IS_SPEC_EBP_OFFSET(OP, OFS)  ((OP).op_type == x86op_address && (OP).data.address.base == ~x86reg_ebp \
    && (OP).data.address.index == 0 && (OP).data.address.offset == (OFS))


void    bincode_extract_pseudoregs_from_operand         (x86_operand *op, int *regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt);
void    bincode_extract_pseudoregs_from_instr           (x86_instruction *instr, int *regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt);
void    bincode_extract_pseudoregs_from_instr_wo_dupes  (x86_instruction *instr, int regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt);
void    bincode_extract_real_registers_from_instr       (x86_instruction *instr, int regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt);
BOOL    bincode_instr_contains_register                 (x86_instruction *instr, int reg);
BOOL    bincode_operand_contains_register               (x86_operand *op, int reg);
void    bincode_extract_pseudoregs_read_by_instr        (x86_instruction *instr, int regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt);
void    bincode_extract_pseudoregs_written_by_instr     (x86_instruction *instr, int regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt);

void    bincode_create_operand_from_int_constant        (x86_operand *op, int constant);
void    bincode_create_operand_from_int_register        (x86_operand *op, x86_register reg);
void    bincode_create_operand_from_int_pseudoreg       (x86_operand *op, int reg);
void    bincode_create_operand_from_float_register      (x86_operand *op);
void    bincode_create_operand_addr_from_reg            (x86_operand *op, int reg);
void    bincode_create_operand_addr_from_reg_offset     (x86_operand *op, int reg, int offset);
void    bincode_create_operand_addr_from_reg_reg        (x86_operand *op, int reg1, int reg2);
void    bincode_create_operand_addr_from_reg_reg_scale  (x86_operand *op, int reg1, int reg2, int scale);
void    bincode_create_operand_addr_from_ebp_offset     (x86_operand *op, int offset);
void    bincode_create_operand_addr_from_esp_offset     (x86_operand *op, int offset);
void    bincode_create_operand_from_symbol              (x86_operand *op, symbol *sym);
void    bincode_create_operand_from_label               (x86_operand *op, int label);

x86_instruction_code    bincode_encode_float_constant   (double constant);
x86_instruction *       bincode_create_instruction      (x86_instruction_code code, x86_operand *op1, x86_operand *op2);

void    bincode_insert_instruction                      (function_desc *function, x86_instruction *pos,
                                                         x86_instruction_code code, x86_operand *op1, x86_operand *op2);
void    bincode_insert_int_reg_reg                      (function_desc *function, x86_instruction *next,
                                                         x86_instruction_code code, int dest_reg, int src_reg);
void    bincode_insert_int_reg_const                    (function_desc *function, x86_instruction *next,
                                                         x86_instruction_code code, int dest_reg, int val);
void    bincode_insert_int_reg_ebp_offset               (function_desc *function, x86_instruction *next,
                                                         x86_instruction_code code, int dest_reg, int offset);
void    bincode_insert_push_reg                         (function_desc *function, x86_instruction *next, int reg);
void    bincode_insert_pop_reg                          (function_desc *function, x86_instruction *next, int reg);
void    bincode_insert_fp_esp_offset                    (function_desc *function, x86_instruction *next,
                                                         x86_instruction_code code, int ofs);
void    bincode_erase_instruction                       (function_desc *function, x86_instruction *instr);


#else
#error Header x86_bincode.h duplicated.
#endif // X86_BINCODE_H__INCLUDED
