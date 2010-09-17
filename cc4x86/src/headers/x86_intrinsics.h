
#ifndef X86_INSTRINSICS_H__INCLUDED
#define X86_INSTRINSICS_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


typedef struct x86_operand_decl x86_operand;

void x86_intrinsic_static_memcpy    (function_desc *func, x86_operand *res, x86_operand *dst, x86_operand *src, int size);
void x86_intrinsic_dynamic_memcpy   (function_desc *func, x86_operand *res, x86_operand *dst, x86_operand *src, x86_operand *size);


#else
#error Header x86_instrinsics.h duplicated.
#endif // X86_INSTRINSICS_H__INCLUDED
