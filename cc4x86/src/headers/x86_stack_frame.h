
#ifndef X86_STACK_FRAME_H__INCLUDED
#define X86_STACK_FRAME_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


typedef struct function_desc_decl function_desc;


void        x86_stack_frame_begin_function      (function_desc *function);

// Следующая функция возвращает смещение относительно EBP.
int         x86_stack_frame_alloc_tmp_var       (function_desc *function, int size);


#else
#error Header x86_stack_frame.h duplicated.
#endif // X86_STACK_FRAME_H__INCLUDED
