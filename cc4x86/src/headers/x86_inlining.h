
#ifndef X86_INLINING
#define X86_INLINING

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


void        x86_inlining_analyze_function       (function_desc *function);
void        x86_inlining_process_function       (function_desc *function);


#else
#error Header x86_inlining.h duplicated.
#endif // X86_STACK_FRAME
