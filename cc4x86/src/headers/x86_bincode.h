
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

#define X86_MAX_REG (8)

typedef enum x86_operand_location_decl {
    x86loc_none,

    x86loc_register,        // операнд - регистр
    x86loc_address,         // операнд - адрес с абсолютным смещением
    x86loc_int_constant,    // операнд - абсолютная константа
    x86loc_symbol,          // операнд - адрес с относительным смещением
    x86loc_symbol_offset,   // операнд - относительная константа
    x86loc_label,           // операнд - метка
} x86_operand_location;

typedef enum x86_operand_type_decl {
    x86op_none,

    x86op_byte,
    x86op_word,
    x86op_dword,
    x86op_qword,    // не является аппаратным типом на x86, эмулируется кодогенератором
    x86op_float,
    x86op_double,   // для регистров FPU эквивалентно float
    x86op_unused,
} x86_operand_type;

#define X86_REGISTER_TYPES_COUNT ((int)x86op_float+1)

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
        // x86op_byte - x86op_double:
        // 0 - не используется, >0 - псевдо-регистр, <0 - реальный регистр
        int         reg;

        // x86reg_qword
        struct qword_decl {
            int     low;
            int     high;
        } qword;

        // x86loc_address (base и index являются 32-битными регистрами x86reg_dword_register)
        struct address_decl {
            int     base;
            int     index;
            int     scale;
            int     offset;
        } address;

        // x86loc_int_constant
        int int_val;

        // x86loc_symbol, x86loc_symbol_offset
        struct op_symbol_decl {
            symbol *name;
            int     offset;
        } sym;

        // x86loc_label
        int label;
    } data;
} x86_operand;


typedef enum x86_instruction_code_decl {
    // ветвление:
    x86insn_jmp,
    x86insn_je,
    x86insn_jne,
    x86insn_jle,
    x86insn_jl,
    x86insn_jge,
    x86insn_jg,
    x86insn_jbe,
    x86insn_jb,
    x86insn_jae,
    x86insn_ja,

    // целочисленная арифметика:
    x86insn_int_inc,
    x86insn_int_dec,
    x86insn_int_neg,
    x86insn_int_not,

    x86insn_int_mov,
    x86insn_int_add,
    x86insn_int_sub,
    x86insn_int_imul,
    x86insn_int_idiv,           // первый параметр - псевдорегистр для EAX, второй - делитель
    x86insn_int_mul,            // первый параметр - псевдорегистр для EAX, второй - множитель
    x86insn_int_div,            // первый параметр - псевдорегистр для EAX, второй - делитель
    x86insn_int_sal,
    x86insn_int_sar,
    x86insn_int_shl,
    x86insn_int_shr,
    x86insn_int_and,
    x86insn_int_xor,
    x86insn_int_or,

    x86insn_int_sete,
    x86insn_int_setne,
    x86insn_int_setle,
    x86insn_int_setl,
    x86insn_int_setge,
    x86insn_int_setg,
    x86insn_int_setbe,
    x86insn_int_setb,
    x86insn_int_setae,
    x86insn_int_seta,

    // FPU арифметика:
    x86insn_fpu_ld,
    x86insn_fpu_ld_int,
    x86insn_fpu_st,
    x86insn_fpu_stp,
    x86insn_fpu_stp_int,
    x86insn_fpu_add,
    x86insn_fpu_sub,
    x86insn_fpu_mul,
    x86insn_fpu_div,
    x86insn_fpu_subr,
    x86insn_fpu_divr,

    x86insn_fpu_identity,
    x86insn_fpu_zero,
    x86insn_fpu_log2_10,
    x86insn_fpu_log2_e,
    x86insn_fpu_pi,
    x86insn_fpu_lg_2,
    x86insn_fpu_ln_2,

    x86insn_fpu_int2float,
    x86insn_fpu_float2int,

    // SSE2 арифметика:
    x86insn_sse_load_int,
    x86insn_sse_store_int,

    x86insn_sse_movss,
    x86insn_sse_addss,
    x86insn_sse_subss,
    x86insn_sse_mulss,
    x86insn_sse_divss,

    x86insn_sse_movsd,
    x86insn_sse_addsd,
    x86insn_sse_subsd,
    x86insn_sse_mulsd,
    x86insn_sse_divsd,

    // Инструкции для внутреннего пользования.
    // арифметические модифицирующие:
    x86insn_imul_const,
    x86insn_int_xchg,
    x86insn_lea,
    x86insn_movsx,
    x86insn_movzx,

    // управление стеком:
    x86insn_push,
    x86insn_pop,
    x86insn_call,               // 1ый параметр - адрес, 2ой - тип результата
    x86insn_ret,

    // целочисленные read-only:
    x86insn_int_cmp,
    x86insn_int_test,

    // псевдо-инструкции:
    x86insn_cdq,                // параметр - псевдорегистр для EDX
    x86insn_xor_edx_edx,        // параметр - псевдорегистр для EDX
    x86insn_fpu_cmp,
    x86insn_cld,
    x86insn_rep_movsb,
    x86insn_rep_movsd,
    x86insn_push_arg,           // 1ый параметр может быть любого типа (эмулируется); 2ой параметр - размер
    x86insn_restore_stack,      // параметр - суммарный размер всех операндов
    x86insn_set_retval,         // параметр - возвращаемое значение (любого размера)
    x86insn_read_retval,        // параметр - псевдорегистр, куда нужно сохранить результат
    x86insn_label,
    x86insn_push_all,
    x86insn_pop_all,
    x86insn_create_stack_frame,
    x86insn_destroy_stack_frame,
    x86insn_comment,

    x86insn_count,
} x86_instruction_code;

typedef struct x86_instruction_decl {
    x86_instruction_code        in_code;
    x86_operand                 in_op1;
    x86_operand                 in_op2;
    int                         in_op3;
    struct x86_instruction_decl *in_next;
    struct x86_instruction_decl *in_prev;
} x86_instruction;


#define IS_INT_INSN(INSN)               ((INSN) >= x86insn_int_inc && (INSN) <= x86insn_int_seta \
                                            || (INSN) >= x86insn_imul_const && (INSN) <= x86insn_pop)
#define IS_SET_INSN(INSN)               ((INSN) >= x86insn_int_sete && (INSN) <= x86insn_int_seta)
#define IS_FLOAT_INSN(INSN)             ((INSN) >= x86insn_fpu_ld && (INSN) <= x86insn_fpu_ln_2)
#define IS_JMP_INSN(INSN)               ((INSN) >= x86insn_jmp && (INSN) <= x86insn_ja)
#define IS_CONSTANT_INSN(INSN)          ((INSN) == x86insn_int_cmp || (INSN) == x86insn_int_test)
#define IS_INT_MODIFYING_INSN(INSN)     ((INSN) >= x86insn_int_inc && (INSN) <= x86insn_int_seta \
                                            || (INSN) >= x86insn_imul_const && (INSN) <= x86insn_movzx \
                                            || (INSN) == x86insn_pop)
#define IS_SHIFT_INSN(INSN)             ((INSN) >= x86insn_int_sal && (INSN) <= x86insn_int_shr)

#define IS_FLOAT_UNARY_ARITHM_INSN(INSN)  ((INSN) >= x86insn_fpu_identity && (INSN) <= x86insn_fpu_ln_2)
#define IS_FLOAT_BINARY_ARITHM_INSN(INSN) ((INSN) >= x86insn_fpu_add && (INSN) <= x86insn_fpu_divr)

#define MAX_REGISTERS_PER_INSN          (3)

#define OP_IS_INT(OP)                   ((OP).op_type >= x86op_byte && (OP).op_type <= x86op_qword)
#define OP_IS_DWORD(OP)                 ((OP).op_type == x86op_dword)
#define OP_IS_FLOAT(OP)                 ((OP).op_type >= x86op_float && (OP).op_type <= x86op_double)
#define OP_IS_REGISTER(OP)              ((OP).op_loc == x86loc_register)
#define OP_IS_ADDRESS(OP)               ((OP).op_loc == x86loc_address)
#define OP_IS_ADDRESS_OR_SYMBOL(OP)     ((OP).op_loc == x86loc_address || (OP).op_loc == x86loc_symbol)
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


void    bincode_extract_pseudoregs_from_operand         (x86_operand *op, x86_operand_type type, x86_register_ref regs[MAX_REGISTERS_PER_INSN], int *regs_cnt);
void    bincode_extract_pseudoregs_from_insn            (x86_instruction *insn, x86_operand_type type, x86_register_ref regs[MAX_REGISTERS_PER_INSN], int *regs_cnt);
void    bincode_extract_pseudoregs_from_insn_wo_dupes   (x86_instruction *insn, x86_operand_type type, x86_register regs[MAX_REGISTERS_PER_INSN], int *regs_cnt);
void    bincode_extract_real_registers_from_insn        (x86_instruction *insn, x86_operand_type type, x86_register regs[MAX_REGISTERS_PER_INSN], int *regs_cnt);
BOOL    bincode_insn_contains_register                  (x86_instruction *insn, x86_operand_type type, int reg);
BOOL    bincode_operand_contains_register               (x86_operand *op, x86_operand_type type, int reg);
void    bincode_extract_pseudoregs_read_by_insn         (x86_instruction *insn, x86_register regs[MAX_REGISTERS_PER_INSN], int *regs_cnt);
void    bincode_extract_pseudoregs_written_by_insn      (x86_instruction *insn, x86_register regs[MAX_REGISTERS_PER_INSN], int *regs_cnt);

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

// Все следующие функции вставляют инструкцию перед заданной.
void    bincode_insert_instruction                      (function_desc *function, x86_instruction *pos,
                                                            x86_instruction_code code, x86_operand *op1, x86_operand *op2);
void    bincode_insert_unary_instruction                (function_desc *function, x86_instruction *pos,
                                                            x86_instruction_code code, x86_operand *op);
void    bincode_insert_int_reg_reg                      (function_desc *function, x86_instruction *pos,
                                                            x86_instruction_code code, x86_operand_type type, int dest_reg, int src_reg);
void    bincode_insert_int_reg_const                    (function_desc *function, x86_instruction *pos,
                                                            x86_instruction_code code, x86_operand_type type, int dest_reg, int val);
void    bincode_insert_int_reg_ebp_offset               (function_desc *function, x86_instruction *pos,
                                                            x86_instruction_code code, x86_operand_type type, int dest_reg, int offset);
void    bincode_insert_int_ebp_offset_reg               (function_desc *function, x86_instruction *pos,
                                                            x86_instruction_code code, x86_operand_type type, int offset, int dest_reg);
void    bincode_insert_push_reg                         (function_desc *function, x86_instruction *pos, x86_operand_type type, int reg);
void    bincode_insert_pop_reg                          (function_desc *function, x86_instruction *pos, x86_operand_type type, int reg);
void    bincode_insert_fp_esp_offset                    (function_desc *function, x86_instruction *pos,
                                                            x86_instruction_code code, x86_operand_type type, int ofs);
void    bincode_insert_comment                          (function_desc *function, x86_instruction *pos, const char *s1, const char *s2);

void    bincode_erase_instruction                       (function_desc *function, x86_instruction *insn);


#else
#error Header x86_bincode.h duplicated.
#endif // X86_BINCODE_H__INCLUDED
