
#ifndef X86_CODEGEN_H__INCLUDED
#define X86_CODEGEN_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


#include "x86_bincode.h"


int     x86_codegen_alloc_pseudoreg     (void);
void    x86_codegen_do_function         (function_desc *function);


#else
#error Header x86_codegen.h duplicated.
#endif // X86_CODEGEN_H__INCLUDED
