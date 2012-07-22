
#ifndef COMMON_H__INCLUDED
#define COMMON_H__INCLUDED

#define AUX_USE_PRAGMA_ONCE 1

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


#include <ctype.h>
#include <malloc.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>


#if defined(_MSC_VER)

// TODO: �������� ��� �������, ����� ��� ����������� C ����� �������������� � �������
#pragma warning(disable:4702)   // unreachable code

// ���� ������������ ������������� ������ � ���� ���������� ���������.
#pragma warning(disable:4100)   // 'parameters_total_size' : unreferenced formal parameter

#pragma warning(disable:4244)   // conversion from 'int' to 'BOOL', possible loss of data
#pragma warning(disable:4127)   // conditional expression is constant
#pragma warning(disable:4996)   // 'strcpy' was declared deprecated
#pragma warning(disable:4711)   // function '_alloc_fragment' selected for automatic inline expansion

#endif // _MSC_VER


#define MIN(A, B) ((A) < (B) ? (A) : (B))
#define MAX(A, B) ((A) > (B) ? (A) : (B))

typedef char BOOL;

#define TRUE 1
#define FALSE 0

#define MAX_PATH 260


#include "allocator.h"
#include "hash_table.h"


void aux_error(const char *text, ...);
void aux_warning(const char *text, ...);
__declspec(noreturn) void aux_fatal_error(const char *text, ...);
void yyerror(const char *txt);


__declspec(noreturn) void aux_assertion_failed(const char *file, int line, const char *cond);
__declspec(noreturn) void aux_unimplemented_error(const char *text);

// ������� �� ����� ����� ����-��������
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


extern BOOL option_no_codegen;
extern BOOL option_no_regalloc;
extern BOOL option_no_basic_opt;
extern BOOL option_enable_optimization;
extern BOOL option_sse2;
extern BOOL option_no_inline;
extern BOOL option_xml_dump;
extern int  option_max_inline_insn;

extern char option_output_filename[];


#define IS_POT(X) (((X) & ((X)-1)) == 0 && (X)>0)

static int log2(int x)
{
    int res = 0;
    while (x >>= 1) res++;
    return res;
}


#else
#error Header common.h duplicated.
#endif // COMMON_H__INCLUDED
