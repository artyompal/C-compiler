
#ifndef X86_REGALLOC_H__INCLUDED
#define X86_REGALLOC_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


typedef struct function_desc_decl function_desc;


typedef enum x86_register_status_decl {
    register_unallocated,
    register_allocated,
    register_swapped,
} x86_register_status;

typedef struct x86_pseudoreg_info_decl {
    x86_instruction *       reg_first_write;
    x86_instruction *       reg_last_read;
    x86_register_status     reg_status;
    int                     reg_location;   // 0 - X86_TMP_REGISTERS_COUNT-1 for real register, tmp. variable id for swapped
    BOOL                    reg_changes_value:1;
} x86_pseudoreg_info;


#define X86_TMP_REGISTERS_COUNT     (6)


void    x86_analyze_registers_usage (function_desc *function);
void    x86_allocate_registers      (function_desc *function);


#else
#error Header x86_regalloc.h duplicated.
#endif // X86_REGALLOC_H__INCLUDED
