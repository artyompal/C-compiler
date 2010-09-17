
#ifndef PARSER_H__INCLUDED
#define PARSER_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


#include <stdio.h>

#include "expressions.h"
#include "symbol_table.h"
#include "types.h"


typedef struct expression_decl expression;


//  initializers: initializer is either a single value or a list of values.

typedef enum initializer_code_decl {
    code_terminal_initializer,
    code_compound_initializer,
} initializer_code;

typedef struct initializer_decl initializer;

typedef struct initializer_decl {
    initializer_code    init_code;
    initializer *       init_next;

    union {
        // code_terminal_initializer
        expression *    value;

        // code_compound_initializer
        initializer *   list;
    } init_data;
} initializer;


//  functions parameter

typedef enum parameter_code_decl {
    code_symbol_parameter,
    code_type_parameter,
    code_ellipsis_parameter,
} parameter_code;

typedef struct parameter_decl parameter;

typedef struct parameter_decl {
    parameter_code  param_code;
    parameter *     param_next;
    data_type *     param_type;     // only for code_symbol_parameter and code_type_parameter
    symbol *        param_sym;      // only for code_symbol_parameter
} parameter;

typedef struct parameter_list_decl {
    parameter *     param_first;
    parameter *     param_last;
} parameter_list;


// YYSTYPE - fit-all parser structure

typedef union YYSTYPE_decl {
    symbol *                sym;
    symbol_list *           symlist;
    data_type *             type;
    decl_specifier          spec;
    struct_union_field *    field;
    fields_list *           fields;
    initializer *           init;
    parameter *             param;
    parameter_list *        paramlist;
    expression *            expr;
    expression_list *       exprlist;
    int                     label;
} YYSTYPE;


#ifndef _DEBUG
#define YYDEBUG 0
#else // _DEBUG
#define YYDEBUG 1
#define YYERROR_VERBOSE
#endif // _DEBUG


#if YYDEBUG
extern int yydebug;
#endif


extern FILE* yyin;

int yyparse(void);
int yylex(void);


#else
#error Header parser.h duplicated.
#endif // PARSER_H__INCLUDED
