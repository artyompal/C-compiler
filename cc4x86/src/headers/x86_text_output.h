
#ifndef X86_TEXT_OUTPUT_H__INCLUDED
#define X86_TEXT_OUTPUT_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


typedef struct function_desc_decl       function_desc;
typedef struct symbol_decl              symbol;
typedef struct x86_instruction_decl     x86_instruction;


void    text_output_begin_unit                  (void);
void    text_output_end_unit                    (void);
void    text_output_begin_data_section          (void);
void    text_output_begin_text_section          (void);
void    text_output_begin_function              (function_desc *function);
void    text_output_end_function                (function_desc *function);

void    text_output_declare_uninitialized_bytes (symbol *sym, int size);
void    text_output_declare_initialized_int     (symbol *sym, long value);
void    text_output_declare_initialized_float   (symbol *sym, double value);
void    text_output_declare_initialized_string  (symbol *sym, const char *value);
void    text_output_declare_ptr_to_relocable    (symbol *ptr_sym, symbol *rel_sym);

void    text_output_push_instruction            (x86_instruction *instr);


#ifdef _DEBUG

void    debug_print_instruction                 (x86_instruction *instr);

#endif // _DEBUG


#else
#error Header x86_text_output.h duplicated.
#endif // X86_TEXT_OUTPUT_H__INCLUDED
