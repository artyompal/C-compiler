
#ifndef X86_OPTIMIZER_H__INCLUDED
#define X86_OPTIMIZER_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


typedef struct function_desc_decl   function_desc;
typedef enum x86_operand_type_decl  x86_operand_type;
typedef struct x86_address_decl     x86_address;
typedef struct x86_variable_decl    x86_variable;


BOOL    x86_local_optimization_pass         (function_desc *function, BOOL after_caching);
void    x86_optimize_after_register_coloring(function_desc *function);

void    x86_caching_init                    ();
void    x86_caching_reset                   ();
BOOL    x86_caching_pass                    (function_desc *function);
void    x86_caching_setup_reg_info          (function_desc *function, x86_pseudoreg_info *pseudoregs_map, x86_operand_type type);
int     x86_caching_find_aliasing_variables (function_desc *function, x86_operand_type type, x86_address *addr,
                                             x86_variable **var_arr, int var_max_count);


#else
#error Header x86_optimizer.h duplicated.
#endif // X86_OPTIMIZER_H__INCLUDED
