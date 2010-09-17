
#include "common.h"
#include "x86_codegen.h"
#include "x86_intrinsics.h"


static void _memcpy_via_dword_movs(x86_operand *dst, x86_operand *src, int size_in_dwords)
{
    x86_operand r0, r1, src_ptr, dst_ptr;
    int i;

    if (size_in_dwords == 1) {
        bincode_create_operand_from_int_pseudoreg(&r0, x86_codegen_alloc_pseudoreg());
        unit_push_binary_instruction(x86instr_int_mov, &r0, src);
        unit_push_binary_instruction(x86instr_int_mov, dst, &r0);
    } else {
        bincode_create_operand_from_int_pseudoreg(&r0, x86_codegen_alloc_pseudoreg());
        bincode_create_operand_from_int_pseudoreg(&r1, x86_codegen_alloc_pseudoreg());

        src_ptr = *src;
        dst_ptr = *dst;

        for (i = 0; i < size_in_dwords; i += 2) {
            if (i < size_in_dwords - 1) {
                unit_push_binary_instruction(x86instr_int_mov, &r0, &src_ptr);
                src_ptr.data.address.offset += 4;
                unit_push_binary_instruction(x86instr_int_mov, &r1, &src_ptr);
                src_ptr.data.address.offset += 4;

                unit_push_binary_instruction(x86instr_int_mov, &dst_ptr, &r0);
                dst_ptr.data.address.offset += 4;
                unit_push_binary_instruction(x86instr_int_mov, &dst_ptr, &r1);
                dst_ptr.data.address.offset += 4;
            } else {
                unit_push_binary_instruction(x86instr_int_mov, &r0, &src_ptr);
                unit_push_binary_instruction(x86instr_int_mov, &dst_ptr, &r0);
            }
        }
    }
}

static void _memcpy_via_dword_movs_loop(function_desc *func, x86_operand *dst, x86_operand *src, int size_in_dwords)
{
    x86_operand dst_reg, src_reg, cnt, dst_addr, src_addr, label, tmp;


    bincode_create_operand_from_int_pseudoreg(&src_reg, x86_codegen_alloc_pseudoreg());
    unit_push_binary_instruction(x86instr_lea, &src_reg, src);
    bincode_create_operand_from_int_pseudoreg(&dst_reg, x86_codegen_alloc_pseudoreg());
    unit_push_binary_instruction(x86instr_lea, &dst_reg, dst);

    bincode_create_operand_from_int_pseudoreg(&cnt, x86_codegen_alloc_pseudoreg());
    bincode_create_operand_from_int_constant(&tmp, size_in_dwords);
    unit_push_binary_instruction(x86instr_int_mov, &cnt, &tmp);

    bincode_create_operand_from_label(&label, unit_create_label(func));
    unit_push_unary_instruction(x86instr_label, &label);

    bincode_create_operand_from_int_pseudoreg(&tmp, x86_codegen_alloc_pseudoreg());
    bincode_create_operand_addr_from_reg(&src_addr, src_reg.data.reg);
    unit_push_binary_instruction(x86instr_int_mov, &tmp, &src_addr);
    bincode_create_operand_addr_from_reg(&dst_addr, dst_reg.data.reg);
    unit_push_binary_instruction(x86instr_int_mov, &dst_addr, &tmp);

    unit_push_unary_instruction(x86instr_int_dec, &cnt);

    bincode_create_operand_addr_from_reg_offset(&src_addr, src_reg.data.reg, 4);
    unit_push_binary_instruction(x86instr_lea, &src_reg, &src_addr);
    bincode_create_operand_addr_from_reg_offset(&dst_addr, dst_reg.data.reg, 4);
    unit_push_binary_instruction(x86instr_lea, &dst_reg, &dst_addr);

    unit_push_unary_instruction(x86instr_jne, &label);
}

static void _memcpy_via_byte_movs_loop(x86_operand *dst, x86_operand *src, x86_operand *size)
{
    aux_unimplemented_error("_memcpy_via_byte_movs_loop needs byte registers to be implemented");
}


void x86_intrinsic_static_memcpy(function_desc *func, x86_operand *res, x86_operand *dst, x86_operand *src, int size)
{
    x86_operand sz;

    ASSERT(dst->op_type == x86op_address && src->op_type == x86op_address);

    if (size % 4 == 0) {
        if (size <= 32) {
            _memcpy_via_dword_movs(dst, src, size / 4);
        } else {
            _memcpy_via_dword_movs_loop(func, dst, src, size / 4);
        }
    } else {
        bincode_create_operand_from_int_constant(&sz, size);
        _memcpy_via_byte_movs_loop(dst, src, &sz);
    }

    *res = *dst;
}

void x86_intrinsic_dynamic_memcpy(function_desc *func, x86_operand *res, x86_operand *dst, x86_operand *src,
    x86_operand *size)
{
    _memcpy_via_byte_movs_loop(dst, src, size);
    *res = *dst;
}

