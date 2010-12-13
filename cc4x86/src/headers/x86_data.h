
#ifndef X86_DATA_H__INCLUDED
#define X86_DATA_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


void        x86data_init                                (void);
void        x86data_enter_text_section                  (void);
symbol *    x86data_insert_float_constant               (long constant);
symbol *    x86data_insert_double_constant              (__int64 constant);
void        x86data_declare_uninitialized_bytes         (symbol *sym, int size);
void        x86data_declare_initialized_dword           (symbol *sym, long value);
void        x86data_declare_initialized_qword           (symbol *sym, __int64 value);
void        x86data_declare_initialized_string          (symbol *sym, const char *value);
void        x86data_declare_ptr_to_initialized_string   (symbol *sym, const char *value);


#else
#error Header x86_data.h duplicated.
#endif // X86_DATA_H__INCLUDED
