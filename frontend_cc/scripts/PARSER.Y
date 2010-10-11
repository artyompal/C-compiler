
%expect 1
%no_lines

%{

#include "common.h"
#include "unit.h"
#include "parser_actions.h"

expression *for_postaction;

%}

%token <sym>    lxm_identifier
%token <type>   lxm_typedef_name
%token <expr>   lxm_constant lxm_string_literal

%token  lxm_arrow       lxm_inc         lxm_dec         lxm_shl
%token  lxm_shr         lxm_le          lxm_ge          lxm_eq
%token  lxm_ne          lxm_bool_and    lxm_bool_or     lxm_ellipsis
%token  lxm_mul_assign  lxm_div_assign  lxm_mod_assign  lxm_add_assign
%token  lxm_sub_assign  lxm_shl_assign  lxm_shr_assign  lxm_and_assign
%token  lxm_xor_assign  lxm_or_assign

%token  lxm_auto        lxm_break       lxm_case        lxm_char
%token  lxm_const       lxm_continue    lxm_default     lxm_do
%token  lxm_double      lxm_else        lxm_enum        lxm_extern
%token  lxm_float       lxm_for         lxm_goto        lxm_if
%token  lxm_int         lxm_long        lxm_register    lxm_return
%token  lxm_short       lxm_signed      lxm_sizeof      lxm_static
%token  lxm_struct      lxm_switch      lxm_typedef     lxm_union
%token  lxm_unsigned    lxm_void        lxm_volatile    lxm_while

%type <expr>        primary_expression postfix_expression unary_expression cast_expression
                    multiplicative_expression additive_expression shift_expression relational_expression
                    equality_expression and_expression exclusive_or_expression inclusive_or_expression
                    logical_and_expression logical_or_expression conditional_expression assignment_expression
                    expression constant_expression
%type <exprlist>    argument_expression_list
%type <spec>        declaration_specifiers specifier_qualifier_list type_qualifier_list
                    storage_class_specifier type_specifier type_qualifier
%type <sym>         init_declarator declarator declarator direct_declarator
%type <symlist>     init_declarator_list
%type <init>        initializer initializer_list
%type <type>        struct_or_union_specifier enum_specifier abstract_declarator
                    pointer direct_abstract_declarator type_name
%type <fields>      struct_declaration_list struct_declaration struct_declarator_list
%type <field>       struct_declarator
%type <paramlist>   parameter_type_list parameter_list
%type <param>       parameter_declaration
%type <expr>        expression_statement

%start translation_unit

%%


/*****************************************************************************
 *                                                                           *
 * Выражения.                                                                *
 *                                                                           *
 *****************************************************************************/

primary_expression
        : lxm_identifier
            { $$ = expr_create_from_identifier($1); }
        | lxm_constant
        | lxm_string_literal
        | '(' expression ')'
            { $$ = $2; }
        ;

postfix_expression
        : primary_expression
        | postfix_expression lxm_inc
            { $$ = expr_create_unary($1, op_post_increment); }
        | postfix_expression lxm_dec
            { $$ = expr_create_unary($1, op_post_decrement); }

        | postfix_expression '[' expression ']'
            { $$ = expr_create_array_indexing($1, $3); }
        | postfix_expression '.' lxm_identifier
            { $$ = expr_create_direct_field_access($1, $3); }
        | postfix_expression lxm_arrow lxm_identifier
            { $$ = expr_create_indirect_field_access($1, $3); }

        | postfix_expression '(' ')'
            { $$ = expr_create_function_call($1, NULL); }
        | postfix_expression '(' argument_expression_list ')'
            { $$ = expr_create_function_call($1, $3); }
        ;

argument_expression_list
        : assignment_expression
            { $$ = expr_create_expression_list($1); }
        | argument_expression_list ',' assignment_expression
            { $$ = expr_add_expression_to_list($1, $3); }
        ;

unary_expression
        : postfix_expression
        | lxm_inc unary_expression
            { $$ = expr_create_unary($2, op_increment); }
        | lxm_dec unary_expression
            { $$ = expr_create_unary($2, op_decrement); }

        | lxm_sizeof unary_expression
            { $$ = expr_create_sizeof($2); }
        | lxm_sizeof '(' type_name ')'
            { $$ = expr_create_sizeof_type($3); }

        | '&' cast_expression
            { $$ = expr_get_address($2); }
        | '*' cast_expression
            { $$ = expr_dereference($2); }

        | '+' cast_expression
            { $$ = $2; }
        | '-' cast_expression
            { $$ = expr_create_unary($2, op_neg); }
        | '~' cast_expression
            { $$ = expr_create_unary($2, op_bitnot); }
        | '!' cast_expression
            { $$ = expr_create_unary($2, op_not); }
        ;

cast_expression
        : unary_expression
        | '(' type_name ')' cast_expression
            { $$ = expr_create_type_cast($4, $2); }
        ;

multiplicative_expression
        : cast_expression
        | multiplicative_expression '*' cast_expression
            { $$ = expr_create_binary($1, $3, op_mul); }
        | multiplicative_expression '/' cast_expression
            { $$ = expr_create_binary($1, $3, op_div); }
        | multiplicative_expression '%' cast_expression
            { $$ = expr_create_binary($1, $3, op_mod); }
        ;

additive_expression
        : multiplicative_expression
        | additive_expression '+' multiplicative_expression
            { $$ = expr_create_binary($1, $3, op_add); }
        | additive_expression '-' multiplicative_expression
            { $$ = expr_create_binary($1, $3, op_sub); }
        ;

shift_expression
        : additive_expression
        | shift_expression lxm_shl additive_expression
            { $$ = expr_create_binary($1, $3, op_shl); }
        | shift_expression lxm_shr additive_expression
            { $$ = expr_create_binary($1, $3, op_shr); }
        ;

relational_expression
        : shift_expression
        | relational_expression '<' shift_expression
            { $$ = expr_create_binary($1, $3, op_less_then); }
        | relational_expression '>' shift_expression
            { $$ = expr_create_binary($1, $3, op_greater_then); }
        | relational_expression lxm_le shift_expression
            { $$ = expr_create_binary($1, $3, op_less_equal); }
        | relational_expression lxm_ge shift_expression
            { $$ = expr_create_binary($1, $3, op_greater_equal); }
        ;

equality_expression
        : relational_expression
        | equality_expression lxm_eq relational_expression
            { $$ = expr_create_binary($1, $3, op_equal); }
        | equality_expression lxm_ne relational_expression
            { $$ = expr_create_binary($1, $3, op_non_equal); }
        ;

and_expression
        : equality_expression
        | and_expression '&' equality_expression
            { $$ = expr_create_binary($1, $3, op_and); }
        ;

exclusive_or_expression
        : and_expression
        | exclusive_or_expression '^' and_expression
            { $$ = expr_create_binary($1, $3, op_xor); }
        ;

inclusive_or_expression
        : exclusive_or_expression
        | inclusive_or_expression '|' exclusive_or_expression
            { $$ = expr_create_binary($1, $3, op_or); }
        ;

logical_and_expression
        : inclusive_or_expression
        | logical_and_expression lxm_bool_and inclusive_or_expression
            { $$ = expr_create_binary($1, $3, op_logical_and); }
        ;

logical_or_expression
        : logical_and_expression
        | logical_or_expression lxm_bool_or logical_and_expression
            { $$ = expr_create_binary($1, $3, op_logical_or); }
        ;

conditional_expression
        : logical_or_expression
        | logical_or_expression '?' expression ':' conditional_expression
            { $$ = expr_create_ternary($1, $3, $5); }
        ;

assignment_expression
        : conditional_expression
        | unary_expression '=' assignment_expression
            { $$ = expr_create_binary($1, $3, op_assign); }
        | unary_expression lxm_add_assign assignment_expression
            { $$ = expr_create_binary($1, $3, op_add_assign); }
        | unary_expression lxm_sub_assign assignment_expression
            { $$ = expr_create_binary($1, $3, op_sub_assign); }
        | unary_expression lxm_mul_assign assignment_expression
            { $$ = expr_create_binary($1, $3, op_mul_assign); }
        | unary_expression lxm_div_assign assignment_expression
            { $$ = expr_create_binary($1, $3, op_div_assign); }
        | unary_expression lxm_mod_assign assignment_expression
            { $$ = expr_create_binary($1, $3, op_mod_assign); }
        | unary_expression lxm_shl_assign assignment_expression
            { $$ = expr_create_binary($1, $3, op_shl_assign); }
        | unary_expression lxm_shr_assign assignment_expression
            { $$ = expr_create_binary($1, $3, op_shr_assign); }
        | unary_expression lxm_and_assign assignment_expression
            { $$ = expr_create_binary($1, $3, op_and_assign); }
        | unary_expression lxm_xor_assign assignment_expression
            { $$ = expr_create_binary($1, $3, op_xor_assign); }
        | unary_expression lxm_or_assign assignment_expression
            { $$ = expr_create_binary($1, $3, op_or_assign); }
        ;

expression
        : assignment_expression
        | expression ',' assignment_expression
            { unit_push_expression($1); $$ = $3; }
        ;

constant_expression
        : conditional_expression
        ;


/*****************************************************************************
 *                                                                           *
 * Описания объявлений.                                                      *
 *                                                                           *
 *****************************************************************************/

declaration
        : declaration_specifiers ';'
            { unit_handle_variable_declarations($1, NULL); }
        | declaration_specifiers init_declarator_list ';'
            { unit_handle_variable_declarations($1, $2); }
        | declaration_specifiers error ';'
            { aux_error("invalid variable or type declaration"); yyerrok; }
        ;

declaration_specifiers
        : storage_class_specifier
        | declaration_specifiers storage_class_specifier
            { $$ = parser_add_storage_specifiers($1, $2); }
        | type_specifier
        | declaration_specifiers type_specifier
            { $$ = parser_add_type_specifiers($1, $2); }
        | type_qualifier
        | declaration_specifiers type_qualifier
            { $$ = parser_add_qualifiers($1, $2); }
        ;

storage_class_specifier
        : lxm_typedef
            { $$.spec_typedef = 1; }
        | lxm_extern
            { $$.spec_extern = 1; }
        | lxm_static
            { $$.spec_static = 1; }
        | lxm_auto
            { $$.spec_auto = 1; }
        | lxm_register
            { $$.spec_register = 1; }
        ;

type_specifier
        : lxm_void
            { $$.spec_void = 1; }
        | lxm_char
            { $$.spec_char = 1; }
        | lxm_short
            { $$.spec_short = 1; }
        | lxm_int
            { $$.spec_int = 1; }
        | lxm_long
            { $$.spec_long = 1; }
        | lxm_float
            { $$.spec_float = 1; }
        | lxm_double
            { $$.spec_double = 1; }
        | lxm_signed
            { $$.spec_signed = 1; }
        | lxm_unsigned
            { $$.spec_unsigned = 1; }
        | struct_or_union_specifier
            { $$.spec_struct_union = 1; $$.spec_compound_type = $1; }
        | enum_specifier
            { $$.spec_enum = 1; $$.spec_compound_type = $1; }
        | lxm_typedef_name
            { $$.spec_typedefed_name = 1; $$.spec_compound_type = $1; }
        ;

struct_or_union_specifier
        : lxm_struct lxm_identifier '{' struct_declaration_list '}'
            { $$ = type_create_complete_structure($2, $4); }
        | lxm_union lxm_identifier '{' struct_declaration_list '}'
            { $$ = type_create_complete_union($2, $4); }
        | lxm_struct '{' struct_declaration_list '}'
            { $$ = type_create_complete_structure(NULL, $3); }
        | lxm_union '{' struct_declaration_list '}'
            { $$ = type_create_complete_union(NULL, $3); }
        | lxm_struct lxm_identifier
            { $$ = type_create_incomplete_structure($2); }
        | lxm_union lxm_identifier
            { $$ = type_create_incomplete_union($2); }
        ;

struct_declaration_list
        : struct_declaration
        | struct_declaration_list struct_declaration
            { $$ = type_add_fields_to_list($1, $2); }
        ;

type_qualifier
        : lxm_const
            { $$.spec_const = 1; }
        | lxm_volatile
            { $$.spec_volatile = 1; }
        ;

specifier_qualifier_list
        : type_specifier
        | specifier_qualifier_list type_specifier
            { $$ = parser_add_type_specifiers($1, $2); }
        | type_qualifier
        | specifier_qualifier_list type_qualifier
            { $$ = parser_add_qualifiers($1, $2); }
        ;

struct_declaration
        : specifier_qualifier_list struct_declarator_list ';'
            { type_apply_decl_specifiers_to_fields($1, $2); $$ = $2; }
        | error ';'
            { aux_error("invalid declaration of structure/union member"); yyerrok; $$ = NULL; }
        ;

struct_declarator_list
        : struct_declarator
            { $$ = type_create_fields_list($1); }
        | struct_declarator_list ',' struct_declarator
            { $$ = type_add_field_to_list($1, $3); }
        ;

struct_declarator
        : declarator
            { $$ = type_create_field($1, NULL); }
        | ':' constant_expression
            { $$ = type_create_field(NULL, $2); }
        | declarator ':' constant_expression
            { $$ = type_create_field($1, $3); }
        ;

init_declarator_list
        : init_declarator
            { $$ = symbol_create_list($1); }
        | init_declarator_list ',' init_declarator
            { $$ = symbol_push_back($1, $3); }
        ;

init_declarator
        : declarator
            { $$ = parser_attach_initializer($1, NULL); }
        | declarator '=' initializer
            { $$ = parser_attach_initializer($1, $3); }
        ;

enum_specifier
        : lxm_enum '{' enumerator_list '}'
            { $$ = type_declare_enumeration(NULL); }
        | lxm_enum lxm_identifier '{' enumerator_list '}'
            { $$ = type_declare_enumeration($2); }
        | lxm_enum lxm_identifier
            { $$ = type_declare_incomplete_enumeration($2); }
        ;

enumerator_list
        : enumerator
        | enumerator_list ',' enumerator
        ;

enumerator
        : lxm_identifier
            { type_declare_enum_item($1, NULL); }
        | lxm_identifier '=' constant_expression
            { type_declare_enum_item($1, $3); }
        ;

declarator
        : pointer direct_declarator
            { $$ = type_add_pointers_to_symbol_type($1, $2); }
        | direct_declarator
        ;

direct_declarator
        : lxm_identifier
            { $$ = symbol_create_variable($1); }
        | '(' declarator ')'
            { $$ = $2; }
        | direct_declarator '[' constant_expression ']'
            { $$ = type_add_sized_array_node($1, $3); }
        | direct_declarator '[' error ']'
            {
                aux_error("invalid expression when array size expected"); yyerrok;
                $$ = type_add_sized_array_node($1, NULL);
            }
        | direct_declarator '[' ']'
            { $$ = type_add_unsized_array_node($1); }
        | direct_declarator '(' parameter_type_list ')'
            { $$ = type_add_function_node($1, $3); }
        | direct_declarator '(' error ')'
            {
                aux_error("invalid parameters list in function type"); yyerrok;
                $$ = type_add_function_node($1, NULL);
            }
        | direct_declarator '(' ')'
            { $$ = type_add_function_node($1, NULL); }
        ;

pointer
        : '*'
            { $$ = type_create_pointer(); }
        | '*' type_qualifier_list
            { $$ = type_create_pointer_with_spec($2); }
        | '*' pointer
            { $$ = type_create_pointer_to_type($2); }
        | '*' type_qualifier_list pointer
            { $$ = type_create_pointer_with_spec_to_type($2, $3); }
        ;

type_qualifier_list
        : type_qualifier
        | type_qualifier_list type_qualifier
            { $$ = parser_add_qualifiers($1, $2); }
        ;

parameter_type_list
        : parameter_list
        | parameter_list ',' lxm_ellipsis
            { $$ = parser_push_ellipsis($1); }
        ;

parameter_list
        : parameter_declaration
            { $$ = parser_create_parameter_list($1); }
        | parameter_list ',' parameter_declaration
            { $$ = parser_push_parameter($1, $3); }

parameter_declaration
        : declaration_specifiers declarator
            { $$ = parser_create_named_parameter($1, $2); }
        | declaration_specifiers abstract_declarator
            { $$ = parser_create_unnamed_parameter($1, $2); }
        | declaration_specifiers
            { $$ = parser_create_unnamed_parameter($1, NULL); }
        ;

type_name
        : specifier_qualifier_list
            { $$ = type_create_from_spec($1); }
        | specifier_qualifier_list abstract_declarator
            { $$ = type_create_from_spec_and_decl($1, $2); }
        ;

abstract_declarator
        : pointer
        | direct_abstract_declarator
        | pointer direct_abstract_declarator
            { $$ = type_add_pointers_to_type($1, $2); }
        ;

direct_abstract_declarator
        : '(' abstract_declarator ')'
            { $$ = $2; }
        | '[' ']'
            { $$ = type_add_abstract_unsized_array_node(NULL); }
        | '[' constant_expression ']'
            { $$ = type_add_abstract_sized_array_node(NULL, $2); }
        | '[' error ']'
            {
                aux_error("invalid expression when array size expected"); yyerrok;
                $$ = type_add_abstract_sized_array_node(NULL, NULL);
            }
        | direct_abstract_declarator '[' ']'
            { $$ = type_add_abstract_unsized_array_node(NULL); }
        | direct_abstract_declarator '[' constant_expression ']'
            { $$ = type_add_abstract_sized_array_node(NULL, $3); }
        | direct_abstract_declarator '[' error ']'
            {
                aux_error("invalid expression when array size expected"); yyerrok;
                $$ = type_add_abstract_sized_array_node(NULL, NULL);
            }
        | '(' ')'
            { $$ = type_add_abstract_function_node(NULL, NULL); }
        | '(' parameter_type_list ')'
            { $$ = type_add_abstract_function_node(NULL, $2); }
        | '(' error ')'
            {
                aux_error("invalid parameters list in function type"); yyerrok;
                $$ = type_add_abstract_function_node(NULL, NULL);
            }
        | direct_abstract_declarator '(' ')'
            { $$ = type_add_abstract_function_node($1, NULL); }
        | direct_abstract_declarator '(' parameter_type_list ')'
            { $$ = type_add_abstract_function_node($1, $3); }
        | direct_abstract_declarator '(' error ')'
            { $$ = type_add_abstract_function_node($1, NULL); }
        ;

initializer
        : assignment_expression
            { $$ = parser_create_simple_initializer($1); }
        | '{' initializer_list '}'
            { $$ = parser_create_complex_initializer($2); }
        | '{' initializer_list ',' '}'
            { $$ = parser_create_complex_initializer($2); }
        ;

initializer_list
        : initializer
        | initializer_list ',' initializer
            { $$ = parser_add_initializer($1, $3); }
        ;


/*****************************************************************************
 *                                                                           *
 * Описания инструкций.                                                      *
 *                                                                           *
 *****************************************************************************/

declaration_or_statement
        : declaration
            { parser_assert_declarations_section(); }
        | statement
            { parser_enter_statements_section(); }
        | error ';'
            { aux_error("invalid statement or declaration"); yyerrok; }
        ;

declaration_or_statement_list
        : declaration_or_statement
        | declaration_or_statement_list declaration_or_statement
        ;

compound_statement_rest
        : '}'
        | declaration_or_statement_list '}'
        | declaration_or_statement_list error '}'
            { aux_error("invalid statement or declaration"); yyerrok; }
        ;

compound_statement
        : '{' { parser_enter_declarations_section(); } compound_statement_rest
        ;

expression_statement
        : ';'
            { $$ = NULL; }
        | expression ';'
        ;

if_statement
        : lxm_if '(' expression ')'
            {
                $<label>$ = unit_create_label_and_push_jump($3, TRUE);
            }
        ;

for_statement
        : lxm_for '(' expression_statement
            {
                unit_push_expression($3);
                $<label>$ = unit_push_label();
            }
        ;

statement
        : lxm_identifier ':'
            { unit_push_named_label($1); }
          statement
        | lxm_case constant_expression ':'
            { unit_push_case_label($2); }
          statement
        | lxm_default ':'
            { unit_push_default_stmt(); }
          statement
        | lxm_switch '(' expression ')'
            { unit_open_switch_stmt($3); }
          statement
            { unit_close_switch_stmt(); }
        | lxm_goto lxm_identifier ';'
            { unit_push_jump_to_named_label($2); }
        | lxm_continue ';'
            { unit_push_continue(); }
        | lxm_break ';'
            { unit_push_break(); }

        | expression_statement
            { unit_push_expression($1); }
        | compound_statement

        | if_statement statement
            {
                unit_place_label($<label>1);
            }
        | if_statement statement lxm_else
            {
                $<label>$ = unit_create_label_and_push_jump(NULL, FALSE);
                unit_place_label($<label>1);
            }
            statement
            {
                unit_place_label($<label>4);
            }
        | lxm_while '(' expression ')'
            {
                $<label>$ = unit_push_label();          // place continue label
            }
            // two different actions aren't a mistake! we push two label tokens here.
            {
                int break_label = unit_create_label_and_push_jump($3, TRUE);    // create break label and conditional jump
                $<label>$ = break_label;
                unit_push_continue_break_targets($<label>5, break_label);
            }
            statement
            {
                unit_push_jump($<label>5, NULL, FALSE); // do continue
                unit_place_label($<label>6);            // place break label
                unit_pop_continue_break_targets();
            }
        | lxm_do
            {
                $<label>$ = unit_push_label();          // place restart label
            }
            // three actions, three tokens
            {
                $<label>$ = unit_create_label();        // create continue label;
            }
            {
                int break_label = unit_create_label();  // create break label
                $<label>$ = break_label;
                unit_push_continue_break_targets($<label>3, break_label);
            }
            statement lxm_while '(' expression ')' ';'
            {
                unit_place_label($<label>3);            // place continue label
                unit_push_jump($<label>2, $8, FALSE);   // create conditional jump
                unit_place_label($<label>4);            // place break label
                unit_pop_continue_break_targets();
            }
        | for_statement expression_statement
            {
                int continue_label = unit_push_label();                         // place continue label
                int break_label = unit_create_label_and_push_jump($2, TRUE);    // create break label
                $<label>$ = break_label;
                unit_push_continue_break_targets(continue_label, break_label);
            }
            ')' statement
            {
                unit_push_jump($<label>1, NULL, TRUE);
                unit_place_label($<label>3);                                    // place break label
            }
        | for_statement expression_statement
            {
                $<label>$ = unit_push_label();                                  // push continue label
            }
            {
                $<label>$ = unit_create_label_and_push_jump($2, TRUE);          // create break label and conditional jump
                for_postaction = unit_get_last_expression();                    // remember lastest expression
            }
            expression ')'
            {
                unit_push_expression($5);                                       // push the rest of post-action
                $<expr>$ = unit_extract_slice(for_postaction->expr_next);       // extract post-action code
                unit_push_continue_break_targets($<label>3, $<label>4);
            }
            statement
            {
                unit_pop_continue_break_targets();
                unit_insert_slice($<expr>7);
                unit_push_jump($<label>3, NULL, TRUE);                          // place jump to continue
                unit_place_label($<label>4);                                    // place break label
            }

        | lxm_return ';'
            { unit_push_return(NULL); }
        | lxm_return expression ';'
            { unit_push_return($2); }
        ;


/*****************************************************************************
 *                                                                           *
 * Базовые элементы.                                                         *
 *                                                                           *
 *****************************************************************************/

translation_unit
        : external_declaration
        | translation_unit external_declaration
        ;

external_declaration
        : function_definition
        | declaration
        ;

function_definition
/* we don't support K&R-style functions, only ANSI-style. */
        : declaration_specifiers declarator { unit_handle_function_prototype(&$1, $2); } compound_statement
            { unit_handle_function_body($2); unit_after_global_declaration(); }
        | declarator { unit_handle_function_prototype(NULL, $1); } compound_statement
            { unit_handle_function_body($1); unit_after_global_declaration(); }
        ;

%%
