
#ifndef X86_DATA_H__INCLUDED
#define X86_DATA_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


void        x86data_init                        (void);
void        x86data_enter_text_section          (void);
symbol *    x86data_insert_float_constant       (double constant);
void        x86data_declare_uninitialized_bytes (symbol *sym, int size);
void        x86data_declare_initialized_int     (symbol *sym, long value);
void        x86data_declare_initialized_float   (symbol *sym, double value);
void        x86data_declare_initialized_string  (symbol *sym, const char *value, int length);


#else
#error Header x86_data.h duplicated.
#endif // X86_DATA_H__INCLUDED
