
#ifndef COMMON_H__INCLUDED
#define COMMON_H__INCLUDED

#define AUX_USE_PRAGMA_ONCE 1

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include <windows.h>


#if defined(_MSC_VER)

// TODO: remove it when all C constructions will be supported in parser code.
#pragma warning(disable:4702)   // unreachable code

// TODO: pack structures, deal with alignment
#pragma warning(disable:4820)   // 'expression_decl' : '3' bytes padding added after data member 'expr_lvalue'

// TODO: periodically check with this warning enabled
#pragma warning(disable:4100)   // 'parameters_total_size' : unreferenced formal parameter

#pragma warning(disable:4127)   // conditional expression is constant
#pragma warning(disable:4996)   // 'strcpy' was declared deprecated
#pragma warning(disable:4711)   // function '_alloc_fragment' selected for automatic inline expansion

#pragma warning(disable:4204)   // nonstandard extension used : non-constant aggregate initializer)

#endif // _MSC_VER


#define MIN(A, B) ((A) < (B) ? (A) : (B))
#define MAX(A, B) ((A) > (B) ? (A) : (B))


#include "allocator.h"
#include "hash_table.h"


void aux_error(const char *text, ...);
void aux_warning(const char *text, ...);
__declspec(noreturn) void aux_fatal_error(const char *text, ...);
void yyerror(const char *txt);


__declspec(noreturn) void aux_assertion_failed(const char *file, int line, const char *cond);
__declspec(noreturn) void aux_unimplemented_error(const char *text);

#ifdef _DEBUG
#define ASSERT(COND) \
    if (!(COND)) { aux_assertion_failed(__FILE__, __LINE__, #COND); }
#define UNIMPLEMENTED_ASSERT(EXPR) \
    if (!(EXPR)) { aux_fatal_error("feature is not implemented yet: '%s'\n%s:%d", #EXPR, __FILE__, __LINE__); }
#else
#define ASSERT(COND) \
    if (!(COND)) { aux_assertion_failed(__FILE__, __LINE__, NULL); }
#define UNIMPLEMENTED_ASSERT(EXPR) \
    if (!(EXPR)) { aux_fatal_error("feature is not implemented yet: '%s'\n", #EXPR); }
#endif


void            aux_set_current_line        (int line);
void            aux_increment_current_line  (void);
int             aux_get_current_line        (void);
void            aux_set_current_file        (const char *file);
const char *    aux_get_current_file        (void);

void            aux_reset_errors_count      (void);
int             aux_get_errors_count        (void);
int             aux_get_warnings_count      (void);

void            aux_replace_file_extension  (char *dst, const char *path, const char *extension);
void            aux_extract_file_name       (char *dst, const char *path);


#define AUX_ARRAY_LENGTH(ARRAY) (sizeof(ARRAY) / sizeof(ARRAY[0]))


#ifdef _DEBUG

#define AUX_CONCATENATE(A, B) A##B
#define AUX_ADD_CURRENT_LINE(A) AUX_CONCATENATE(A, __LINE__)

#define AUX_CASSERT(COND) extern int AUX_ADD_CURRENT_LINE(_cassert_var)[!!(COND)];

#if 0
#define LOG(ARGS) printf ARGS
#else
#define LOG(ARGS)
#endif

#else

#define AUX_CASSERT(COND)
#define LOG(ARGS)

#endif


extern BOOL option_debug_disable_codegen;
extern BOOL option_debug_disable_regalloc;
extern BOOL option_debug_disable_basic_opt;
extern BOOL option_enable_optimization;

extern char option_output_filename[];


#ifdef _DEBUG

typedef struct x86_instruction_decl x86_instruction;
void debug_print_instruction(x86_instruction *instr);

#endif // _DEBUG


#else
#error Header common.h duplicated.
#endif // COMMON_H__INCLUDED
