
#ifndef X86_OPTIMIZER_H__INCLUDED
#define X86_OPTIMIZER_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


typedef struct function_desc_decl function_desc;


void    x86_optimization_after_codegen              (function_desc *function);
void    x86_create_register_variables               (function_desc *function);
void    x86_optimization_after_regvar_allocation    (function_desc *function);


#else
#error Header x86_optimizer.h duplicated.
#endif // X86_OPTIMIZER_H__INCLUDED
