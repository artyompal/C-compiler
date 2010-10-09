
#ifndef EXPRESSIONS_H__INCLUDED
#define EXPRESSIONS_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


typedef struct data_type_decl data_type;
typedef struct symbol_decl symbol;


typedef enum arithmetic_opcode_decl {
    // binary arithmetic operations
    op_add,
    op_sub,
    op_mul,
    op_div,
    op_mod,
    op_shl,
    op_shr,
    op_and,
    op_xor,
    op_or,

    // binary comparison operations
    op_less_then,
    op_less_equal,
    op_greater_then,
    op_greater_equal,
    op_equal,
    op_non_equal,
    op_logical_and,
    op_logical_or,
    op_logical_and_in_jump,
    op_logical_or_in_jump,

    // binary assignment operations
    op_assign,
    op_add_assign,
    op_sub_assign,
    op_mul_assign,
    op_div_assign,
    op_mod_assign,
    op_shl_assign,
    op_shr_assign,
    op_and_assign,
    op_xor_assign,
    op_or_assign,

    // unary operations
    op_neg,
    op_bitnot,
    op_not,
    op_increment,
    op_decrement,
    op_post_increment,
    op_post_decrement,
    op_dereference,
    op_get_address,

    // internal unary operations
    op_convert_int2float,
    op_convert_float2int,
    op_notnot,
} arithmetic_opcode;

typedef enum expression_code_decl {
    code_expr_int_constant,
    code_expr_float_constant,
    code_expr_symbol,
    code_expr_function_call,
    code_expr_jump,
    code_expr_return,
    code_expr_arithmetic,
    code_expr_label,
    code_expr_count,
} expression_code;


typedef struct expression_decl expression;

typedef struct expression_list_decl {
    expression      *expr_first;
    expression      *expr_last;
} expression_list;

typedef struct expr_jump_decl {
    int             destination;
    expression      *condition;
    BOOL            invert_cond;
} expr_jump;

typedef struct arithm_decl {
    arithmetic_opcode   opcode;
    expression          *operand1;
    expression          *operand2;
    int                 step;           // for increment/decrement
} expr_arithm;

typedef struct expression_decl {
    expression_code expr_code;          // see above
    data_type *     expr_type;          // pointer to the root of types tree
    BOOL            expr_lvalue;        // means that expression type is really a pointer to that type
    int             expr_source_line;   // line numbers support
    expression      *expr_next;         // linked list for comma expressions and function arguments
    expression      *expr_parent;       // used for operands of arithmetic expressions to maintain tree structure
    int             expr_complexity;    // used by code generator

    union {
        // code_expr_int_constant
        long                int_const;

        // code_expr_float_constant
        struct float_const_decl {
            double          val;
            symbol          *sym;
        } float_const;

        // code_expr_symbol
        symbol              *sym;

        // code_expr_function_call
        struct function_call_decl {
            expression      *address;
            expression_list *args;
            int             ellipsis_position;
        } function_call;

        // expression_list  comma_list;

        // code_expr_jump
        expr_jump           jump;

        // code_expr_return
        expression          *ret_value;

        // code_expr_arithmetic
        expr_arithm         arithm;

        // code_expr_label
        int                 label;
    } data;
} expression;


#define IS_INT_CONSTANT_EXPR(EXPR)  ((EXPR)->expr_code == code_expr_int_constant)
#define IS_FLOAT_CONSTANT_EXPR(EXPR)((EXPR)->expr_code == code_expr_float_constant)

#define IS_UNARY_OP(OP)             ((OP) >= op_neg)
#define IS_BINARY_OP(OP)            ((OP) >= 0 && (OP) < op_neg)
#define IS_COMPARE_OP(OP)           ((OP) >= op_less_then && (OP) <= op_non_equal)
#define IS_ASSIGN_OP(OP)            ((OP) >= op_assign && (OP) < op_neg)
#define IS_INCREMENT_DECREMENT(OP)  ((OP) >= op_increment && (OP) <= op_post_decrement)
#define IS_SELF_MOD_OP(OP)          (IS_ASSIGN_OP(OP) || IS_INCREMENT_DECREMENT(OP))
#define IS_POST_OPERATION(OP)       ((OP) == op_post_increment || (OP) == op_post_decrement)
#define IS_DIVISION_OP(OP)          ((OP) == op_div || (OP) == op_div_assign)
#define IS_MODULO_OP(OP)            ((OP) == op_mod || (OP) == op_mod_assign)
#define IS_INTERNAL(OP)             ((OP) >= op_convert_int2float && (OP) <= op_notnot)


char const *    expr_print_opcode_to_user       (arithmetic_opcode code);
char const *    expr_print_opcode_to_debug      (arithmetic_opcode code);


expression *    expr_create_unary               (expression *e, arithmetic_opcode opcode);
expression *    expr_create_binary              (expression *e1, expression *e2, arithmetic_opcode opcode);
expression *    expr_create_ternary             (expression *e1, expression *e2, expression *e3);
expression *    expr_create_from_identifier     (symbol *sym);
expression *    expr_create_from_integer        (long val, data_type *type);
expression *    expr_create_from_float          (double val, data_type *type);

expression *    expr_create_jump                (int destination, expression *condition, BOOL invert_condition);
expression *    expr_create_return              (expression *result);

expression *    expr_create_array_indexing      (expression *e1, expression *e2);
expression *    expr_create_direct_field_access (expression *e, symbol *sym);
expression *    expr_create_indirect_field_access(expression *expr, symbol *sym);
expression *    expr_create_function_call       (expression *address, expression_list *args);
expression_list *expr_create_expression_list    (expression *expr);
expression_list *expr_add_expression_to_list    (expression_list *list, expression *e);
expression *    expr_create_sizeof              (expression *expr);
expression *    expr_create_sizeof_type         (data_type *type);

expression *    expr_get_address                (expression *expr);
expression *    expr_dereference                (expression *expr);
expression *    expr_create_type_cast           (expression *expr, data_type *type);
expression **   expr_list2array                 (expression *first_in_list, int *dst_length);
expression *    expr_create_label               (int label);


#define EXPR_IT_APPLY_FILTER    1
#define EXPR_IT_CHILDREN_FIRST  2
#define EXPR_IT_DONT_ADVANCE    4
#define EXPR_IT_ROOT_ONLY       8

void            expr_iterate_through_subexpressions(expression *root, expression_code filter, int flags,
                                                    void (*callback)(expression *, void *), void *arg);


#else
#error Header expressions.h duplicated.
#endif // EXPRESSIONS_H__INCLUDED
