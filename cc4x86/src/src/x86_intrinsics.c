
#include "common.h"
#include "x86_codegen.h"
#include "x86_intrinsics.h"


static void _memcpy_via_dword_mov(x86_operand *dst, x86_operand *src, int size_in_dwords)
{
    x86_operand r0, r1, src_ptr, dst_ptr;
    int i;

    if (size_in_dwords == 1) {
        bincode_create_operand_and_alloc_pseudoreg(&r0, x86op_dword);
        unit_push_binary_instruction(x86insn_int_mov, &r0, src);
        unit_push_binary_instruction(x86insn_int_mov, dst, &r0);
    } else {
        bincode_create_operand_and_alloc_pseudoreg(&r0, x86op_dword);
        bincode_create_operand_and_alloc_pseudoreg(&r1, x86op_dword);

        src->op_type = x86op_dword;
        dst->op_type = x86op_dword;

        src_ptr = *src;
        dst_ptr = *dst;

        for (i = 0; i < size_in_dwords; i += 2) {
            if (i < size_in_dwords - 1) {
                unit_push_binary_instruction(x86insn_int_mov, &r0, &src_ptr);
                src_ptr.data.address.offset += 4;
                unit_push_binary_instruction(x86insn_int_mov, &r1, &src_ptr);
                src_ptr.data.address.offset += 4;

                unit_push_binary_instruction(x86insn_int_mov, &dst_ptr, &r0);
                dst_ptr.data.address.offset += 4;
                unit_push_binary_instruction(x86insn_int_mov, &dst_ptr, &r1);
                dst_ptr.data.address.offset += 4;
            } else {
                unit_push_binary_instruction(x86insn_int_mov, &r0, &src_ptr);
                unit_push_binary_instruction(x86insn_int_mov, &dst_ptr, &r0);
            }
        }
    }
}

static void _load_address(x86_operand *reg, x86_operand *addr)
{
    x86_operand tmp;

    if (addr->data.address.base > 0 && addr->data.address.index == 0 && addr->data.address.offset == 0) {
        bincode_create_operand_and_alloc_pseudoreg(reg, x86op_dword);
        bincode_create_operand_from_pseudoreg(&tmp, x86op_dword, addr->data.address.base);
        unit_push_binary_instruction(x86insn_int_mov, reg, &tmp);
    } else {
        bincode_create_operand_and_alloc_pseudoreg(reg, x86op_dword);
        unit_push_binary_instruction(x86insn_lea, reg, addr);
    }
}

static void _static_memcpy(x86_operand *dst, x86_operand *src, int size)
{
//  mov eax, ecx
//  shr ecx, 02
//  repz movsd
//  mov ecx, eax
//  and ecx, 3
//  repz movsb

    x86_operand edi, esi, ecx, num;

    // lea edi, ...
    _load_address(&edi, dst);

    // lea esi, ...
    _load_address(&esi, src);

    // mov ecx, size
    bincode_create_operand_and_alloc_pseudoreg(&ecx, x86op_dword);
    bincode_create_operand_from_int_constant(&num, x86op_dword, size / 4);
    unit_push_binary_instruction(x86insn_int_mov, &ecx, &num);

    // rep movsd
    unit_push_binary_instruction(x86insn_rep_movsd, &edi, &esi);

    if (size % 4 != 0) {
        // mov ecx, size
        bincode_create_operand_and_alloc_pseudoreg(&ecx, x86op_dword);
        bincode_create_operand_from_int_constant(&num, x86op_dword, size % 4);
        unit_push_binary_instruction(x86insn_int_mov, &ecx, &num);

        // rep movsb
        unit_push_binary_instruction(x86insn_rep_movsb, &edi, &esi);
    }
}


void x86_intrinsic_static_memcpy(x86_operand *res, x86_operand *dst, x86_operand *src, int size)
{
    ASSERT(dst->op_loc == x86loc_address && src->op_loc == x86loc_address);

    if (size % 4 == 0 && size <= 8) {
        _memcpy_via_dword_mov(dst, src, size / 4);
    } else {
        _static_memcpy(dst, src, size);
    }

    *res = *dst;
}

void x86_intrinsic_dynamic_memcpy(x86_operand *res, x86_operand *dst, x86_operand *src, x86_operand *size)
{
//  Подразумеваем, что CLD делать не надо.

//  mov eax, ecx
//  shr ecx, 2
//  rep movsd
//  mov ecx, eax
//  and ecx, 3
//  rep movsb

    x86_operand edi, esi, ecx, eax, num;
    ASSERT(dst->op_loc == x86loc_address && src->op_loc == x86loc_address);

    // lea edi, ...
    _load_address(&edi, dst);

    // lea esi, ...
    _load_address(&esi, src);

    // mov ecx, size
    bincode_create_operand_and_alloc_pseudoreg(&ecx, x86op_dword);
    unit_push_binary_instruction(x86insn_int_mov, &ecx, size);

    // mov eax, size
    bincode_create_operand_and_alloc_pseudoreg(&eax, x86op_dword);
    unit_push_binary_instruction(x86insn_int_mov, &eax, &ecx);

    // shr ecx, 2
    bincode_create_operand_from_int_constant(&num, x86op_dword, 2);
    unit_push_binary_instruction(x86insn_int_shr, &ecx, &num);

    // rep movsd
    unit_push_binary_instruction(x86insn_rep_movsd, &edi, &esi);

    // mov ecx, eax
    unit_push_binary_instruction(x86insn_int_mov, &ecx, &eax);

    // and ecx, 3
    bincode_create_operand_from_int_constant(&num, x86op_dword, 3);
    unit_push_binary_instruction(x86insn_int_and, &ecx, &num);

    // rep movsb
    unit_push_binary_instruction(x86insn_rep_movsb, &edi, &esi);

    *res = *dst;
}

