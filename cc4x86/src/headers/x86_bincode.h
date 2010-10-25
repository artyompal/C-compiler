
#ifndef X86_BINCODE_H__INCLUDED
#define X86_BINCODE_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


#include "unit.h"


typedef enum x86_byte_register_decl {
    x86reg_al,
    x86reg_cl,
    x86reg_dl,
    x86reg_bl,
    x86reg_ah,
    x86reg_ch,
    x86reg_dh,
    x86reg_bh,

    x86_byte_reg_count,
} x86_byte_register;

typedef enum x86_word_register_decl {
    x86reg_ax,
    x86reg_cx,
    x86reg_dx,
    x86reg_bx,
    x86reg_sp,
    x86reg_bp,
    x86reg_si,
    x86reg_di,

    x86_word_reg_count,
} x86_word_register;

typedef enum x86_dword_register_decl {
    x86reg_eax,
    x86reg_ecx,
    x86reg_edx,
    x86reg_ebx,
    x86reg_esp,
    x86reg_ebp,
    x86reg_esi,
    x86reg_edi,

    x86_dword_reg_count,
} x86_dword_register;

#define X86_MAX_REG (MAX(MAX(x86_byte_reg_count, x86_word_reg_count), x86_dword_reg_count))

typedef enum x86_operand_location_decl {
    x86loc_none,

    x86loc_register,
    x86loc_address,
    x86loc_int_constant,
    x86loc_symbol,
    x86loc_symbol_offset,
    x86loc_label,
} x86_operand_location;

typedef enum x86_operand_type_decl {
    x86op_none,

    x86op_byte,
    x86op_word,
    x86op_dword,
    x86op_qword,    // x86reg_qword эмулируется кодогенератором
    x86op_float,
    x86op_double,
    x86op_long_double,
    x86op_unused,
} x86_operand_type;

typedef enum x86_register_type_decl {
    // TODO: убрать структуру x86_register_type либо корректно работать с ней

    x86reg_byte     = x86op_byte,
    x86reg_word     = x86op_word,
    x86reg_dword    = x86op_dword,
    x86reg_sse2     = x86op_float,

    x86reg_count,
} x86_register_type;

typedef struct x86_register_decl {
    x86_operand_type        reg_type;
    int                     reg_value;
} x86_register;

typedef struct x86_register_ref_decl {
    x86_operand_type        reg_type;
    int                     *reg_addr;
} x86_register_ref;

typedef struct x86_operand_decl {
    x86_operand_location    op_loc;
    x86_operand_type        op_type;

    union data_decl {
        // x86op_byte - x86op_long_double:
        // 0 - unused, positive value - pseudo-register, negative value - x86 register
        int         reg;

        // x86reg_qword
        struct qword_decl {
            int     low;
            int     high;
        } qword;

        // x86loc_address (base and index are x86reg_dword_register's)
        struct address_decl {
            int     base;
            int     index;
            int     scale;
            int     offset;
        } address;

        // x86loc_int_constant
        int int_val;

        // x86loc_symbol, x86loc_symbol_offset
        symbol *sym;

        // x86loc_label
        int label;
    } data;
} x86_operand;


typedef enum x86_instruction_code_decl {
    // function-calling instructions:
    x86instr_call,              // 1st argument is address, 2nd is result type
    x86instr_ret,

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

    // FPU instructions:
    x86instr_fpu_ld,
    x86instr_fpu_ld_int,
    x86instr_fpu_st,
    x86instr_fpu_stp,
    x86instr_fpu_stp_int,
    x86instr_fpu_add,
    x86instr_fpu_sub,
    x86instr_fpu_mul,
    x86instr_fpu_div,
    x86instr_fpu_subr,
    x86instr_fpu_divr,

    x86instr_fpu_identity,
    x86instr_fpu_zero,
    x86instr_fpu_log2_10,
    x86instr_fpu_log2_e,
    x86instr_fpu_pi,
    x86instr_fpu_lg_2,
    x86instr_fpu_ln_2,

    x86instr_fpu_int2float,
    x86instr_fpu_float2int,

    // SSE2 instructions:
    x86instr_sse_mov,
    x86instr_sse_load_int,
    x86instr_sse_store_int,
    x86instr_sse_add,
    x86instr_sse_sub,
    x86instr_sse_mul,
    x86instr_sse_div,

    // internally-generated instructions.
    // arithmetic:
    x86instr_cdq,
    x86instr_fpu_cmp,
    x86instr_cld,
    x86instr_rep_movsb,
    x86instr_rep_movsd,
    x86instr_imul_const,
    x86instr_int_xchg,
    x86instr_lea,
    x86instr_movsx,
    x86instr_movzx,

    // stack handling:
    x86instr_push,
    x86instr_pop,
    x86instr_push_arg,          // parameter can be argument of any type
    x86instr_restore_stack,     // parameter is summary parameters size

    // read-only instructions:
    x86instr_int_cmp,
    x86instr_int_test,

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
#define IS_FLOAT_INSTR(INSTR)           ((INSTR) >= x86instr_fpu_ld && (INSTR) <= x86instr_fpu_ln_2)
#define IS_JMP_INSTR(INSTR)             ((INSTR) >= x86instr_jmp && (INSTR) <= x86instr_ja)
#define IS_CONSTANT_INSTR(INSTR)        ((INSTR) == x86instr_int_cmp || (INSTR) == x86instr_int_test)
#define IS_INT_MUTABLE_INSTR(INSTR)     (IS_INT_INSTR(INSTR) || (INSTR) >= x86instr_int_cmp && (INSTR) <= x86instr_int_xchg)

#define IS_FLOAT_UNARY_ARITHM_INSTR(INSTR)  ((INSTR) >= x86instr_fpu_identity && (INSTR) <= x86instr_fpu_ln_2)
#define IS_FLOAT_BINARY_ARITHM_INSTR(INSTR) ((INSTR) >= x86instr_fpu_add && (INSTR) <= x86instr_fpu_divr)

#define MAX_REGISTERS_PER_INSTR         (3)

#define OP_IS_INT(OP)                   ((OP).op_type >= x86op_byte && (OP).op_type <= x86op_qword)
#define OP_IS_DWORD(OP)                 ((OP).op_type == x86op_dword)
#define OP_IS_FLOAT(OP)                 ((OP).op_type >= x86op_float && (OP).op_type <= x86op_long_double)
#define OP_IS_REGISTER(OP)              ((OP).op_loc == x86loc_register)
#define OP_IS_ADDRESS(OP)               ((OP).op_loc == x86loc_address)
#define OP_IS_REGISTER_OR_ADDRESS(OP)   ((OP).op_loc == x86loc_register || (OP).op_loc == x86loc_address)
#define OP_IS_REAL_REG(OP)              (OP_IS_REGISTER(OP) && (OP).data.reg < 0)
#define OP_IS_REAL_DWORD_REG(OP)        (OP_IS_DWORD(OP) && OP_IS_REGISTER(OP) && (OP).data.reg < 0)
#define OP_IS_THIS_REAL_REG(OP, T, REG) (OP_IS_REGISTER(OP) && (OP).op_type == (T) && (OP).data.reg == ~(REG))
#define OP_IS_PSEUDO_REG(OP)            (OP_IS_REGISTER(OP) && (OP).data.reg > 0)
#define OP_IS_PSEUDO_DWORD_REG(OP)      (OP_IS_DWORD(OP) && OP_IS_REGISTER(OP) && (OP).data.reg > 0)
#define OP_IS_THIS_PSEUDO_REG(OP,T,REG) (OP_IS_REGISTER(OP) && (OP).op_type == (T) && (OP).data.reg == (REG))
#define OP_IS_CONSTANT(OP)              ((OP).op_loc == x86loc_int_constant)
#define OP_IS_ADDRESS(OP)               ((OP).op_loc == x86loc_address)
#define OP_IS_SPEC_EBP_OFFSET(OP, OFS)  ((OP).op_loc == x86loc_address && (OP).data.address.base == ~x86reg_ebp \
                                            && (OP).data.address.index == 0 && (OP).data.address.offset == (OFS))


void    bincode_extract_pseudoregs_from_operand         (x86_operand *op, x86_register_type type, x86_register_ref regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt);
void    bincode_extract_pseudoregs_from_instr           (x86_instruction *instr, x86_register_type type, x86_register_ref regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt);
void    bincode_extract_pseudoregs_from_instr_wo_dupes  (x86_instruction *instr, x86_register_type type, x86_register regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt);
void    bincode_extract_real_registers_from_instr       (x86_instruction *instr, x86_register_type type, x86_register regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt);
BOOL    bincode_instr_contains_register                 (x86_instruction *instr, x86_register_type type, int reg);
BOOL    bincode_operand_contains_register               (x86_operand *op, x86_register_type type, int reg);
void    bincode_extract_pseudoregs_read_by_instr        (x86_instruction *instr, x86_register regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt);
void    bincode_extract_pseudoregs_written_by_instr     (x86_instruction *instr, x86_register regs[MAX_REGISTERS_PER_INSTR], int *regs_cnt);

void    bincode_create_operand_from_int_constant        (x86_operand *op, x86_operand_type type, int constant);
void    bincode_create_operand_from_register            (x86_operand *op, x86_operand_type type, int reg);
void    bincode_create_operand_from_pseudoreg           (x86_operand *op, x86_operand_type type, int reg);
void    bincode_create_operand_and_alloc_pseudoreg      (x86_operand *op, x86_operand_type type);
void    bincode_create_operand_addr_from_reg            (x86_operand *op, x86_operand_type type, int reg);
void    bincode_create_operand_addr_from_reg_offset     (x86_operand *op, x86_operand_type type, int reg, int offset);
void    bincode_create_operand_addr_from_reg_reg        (x86_operand *op, x86_operand_type type, int reg1, int reg2);
void    bincode_create_operand_addr_from_reg_reg_scale  (x86_operand *op, x86_operand_type type, int reg1, int reg2, int scale);
void    bincode_create_operand_addr_from_ebp_offset     (x86_operand *op, x86_operand_type type, int offset);
void    bincode_create_operand_addr_from_esp_offset     (x86_operand *op, x86_operand_type type, int offset);
void    bincode_create_operand_from_symbol              (x86_operand *op, symbol *sym);
void    bincode_create_operand_from_label               (x86_operand *op, int label);

x86_instruction_code    bincode_encode_float_constant   (double constant);
x86_instruction *       bincode_create_instruction      (x86_instruction_code code, x86_operand *op1, x86_operand *op2);

x86_operand_type        bincode_encode_type             (data_type *type);

void    bincode_insert_instruction                      (function_desc *function, x86_instruction *pos,
                                                            x86_instruction_code code, x86_operand *op1, x86_operand *op2);
void    bincode_insert_unary_instruction                (function_desc *function, x86_instruction *pos,
                                                            x86_instruction_code code, x86_operand *op);
void    bincode_insert_int_reg_reg                      (function_desc *function, x86_instruction *next,
                                                            x86_instruction_code code, x86_operand_type type, int dest_reg, int src_reg);
void    bincode_insert_int_reg_const                    (function_desc *function, x86_instruction *next,
                                                            x86_instruction_code code, x86_operand_type type, int dest_reg, int val);
void    bincode_insert_int_reg_ebp_offset               (function_desc *function, x86_instruction *next,
                                                            x86_instruction_code code, x86_operand_type type, int dest_reg, int offset);
void    bincode_insert_int_ebp_offset_reg               (function_desc *function, x86_instruction *next,
                                                            x86_instruction_code code, x86_operand_type type, int offset, int dest_reg);
void    bincode_insert_push_reg                         (function_desc *function, x86_instruction *next, x86_operand_type type, int reg);
void    bincode_insert_pop_reg                          (function_desc *function, x86_instruction *next, x86_operand_type type, int reg);
void    bincode_insert_fp_esp_offset                    (function_desc *function, x86_instruction *next,
                                                            x86_instruction_code code, x86_operand_type type, int ofs);

void    bincode_erase_instruction                       (function_desc *function, x86_instruction *instr);


#else
#error Header x86_bincode.h duplicated.
#endif // X86_BINCODE_H__INCLUDED
