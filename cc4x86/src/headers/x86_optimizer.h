
#ifndef X86_OPTIMIZER_H__INCLUDED
#define X86_OPTIMIZER_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


typedef struct function_desc_decl function_desc;
typedef enum x86_operand_type_decl x86_operand_type;


BOOL    x86_local_optimization_pass         (function_desc *function, BOOL after_regvars);
void    x86_optimize_after_register_coloring(function_desc *function);

void    x86_caching_init                    ();
void    x86_caching_reset                   ();
BOOL    x86_caching_pass                    (function_desc *function);
void    x86_caching_setup_reg_info          (function_desc *function, x86_pseudoreg_info *pseudoregs_map, x86_operand_type type);

//void    x86_regvars_init                    ();
//void    x86_regvars_create                  (function_desc *function);
//void    x86_regvars_setup_offset            (function_desc *function, x86_pseudoreg_info *info, x86_operand_type type);


#else
#error Header x86_optimizer.h duplicated.
#endif // X86_OPTIMIZER_H__INCLUDED
