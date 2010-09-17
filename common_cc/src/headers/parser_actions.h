
#ifndef PARSER_ACTIONS_H__INCLUDED
#define PARSER_ACTIONS_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


void                parser_enter_declarations_section   (void);
void                parser_enter_statements_section     (void);
void                parser_assert_declarations_section  (void);

decl_specifier      parser_add_storage_specifiers       (decl_specifier decl_spec, decl_specifier added_value);
decl_specifier      parser_add_type_specifiers          (decl_specifier decl_spec, decl_specifier added_value);
decl_specifier      parser_add_qualifiers               (decl_specifier decl_spec, decl_specifier added_value);

initializer *       parser_create_simple_initializer    (expression *expr);
initializer *       parser_create_complex_initializer   (initializer *child);
initializer *       parser_add_initializer              (initializer *node, initializer *next);
symbol *            parser_attach_initializer           (symbol *sym, initializer *value);

parameter *         parser_create_named_parameter       (decl_specifier spec, symbol *sym);
parameter *         parser_create_unnamed_parameter     (decl_specifier spec, data_type *type);

parameter_list *    parser_create_parameter_list        (parameter *param);
parameter_list *    parser_push_parameter               (parameter_list *param_list, parameter *param);
parameter_list *    parser_push_ellipsis                (parameter_list *param_list);


#else
#error Header parser_actions.h duplicated.
#endif // PARSER_ACTIONS_H__INCLUDED
