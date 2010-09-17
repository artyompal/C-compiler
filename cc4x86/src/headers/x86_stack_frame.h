
#ifndef X86_STACK_FRAME
#define X86_STACK_FRAME

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


typedef struct function_desc_decl function_desc;


void        x86_stack_frame_begin_function      (function_desc *function);
void        x86_stack_frame_end_function        (function_desc *function);

//  These functions return stack offset regarding the EBP register.
int         x86_stack_frame_get_float2int_tmp   (void);
int         x86_stack_frame_alloc_tmp_var       (int size);


#else
#error Header x86_stack_frame.h duplicated.
#endif // X86_STACK_FRAME
