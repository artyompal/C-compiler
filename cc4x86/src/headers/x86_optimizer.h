
#ifndef X86_OPTIMIZER_H__INCLUDED
#define X86_OPTIMIZER_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


typedef struct function_desc_decl function_desc;
typedef enum x86_operand_type_decl x86_operand_type;


void    x86_optimization_after_codegen              (function_desc *function);
void    x86_optimization_after_inlining             (function_desc *function);

void    x86_init_register_variables                 ();
void    x86_create_register_variables               (function_desc *function);
void    x86_setup_offset_for_register_variables     (function_desc *function, x86_operand_type type);


#else
#error Header x86_optimizer.h duplicated.
#endif // X86_OPTIMIZER_H__INCLUDED
