
#include "common.h"
#include "parser.h"
#include "parser_actions.h"


static BOOL is_declaration_section = TRUE;


void parser_enter_declarations_section(void)
{
    is_declaration_section = TRUE;
}

void parser_enter_statements_section(void)
{
    is_declaration_section = FALSE;
}

void parser_assert_declarations_section(void)
{
    if (!is_declaration_section) {
        aux_error("C language forbids variable declaration in the middle of compound statement");
    }
}


decl_specifier parser_add_storage_specifiers(decl_specifier orig_value, decl_specifier added_value)
{
    decl_specifier res = orig_value;

    if (orig_value.spec_typedef || orig_value.spec_extern || orig_value.spec_static || orig_value.spec_auto || orig_value.spec_register) {
        goto invalid_storage_specifier;
    }

    if (added_value.spec_typedef) {
        res.spec_typedef = 1;
    } else if (added_value.spec_extern) {
        res.spec_extern = 1;
    } else if (added_value.spec_static) {
        res.spec_static = 1;
    } else if (added_value.spec_auto) {
        res.spec_auto = 1;
    } else if (added_value.spec_register) {
        res.spec_register = 1;
    }

    return res;

invalid_storage_specifier:
    aux_error("conflicting storage specifiers");
    return orig_value;
}

decl_specifier parser_add_type_specifiers(decl_specifier orig_value, decl_specifier added_value)
{
    decl_specifier res = orig_value;

#define SET(SPEC) orig_value.spec_##SPEC
    // arithmetics types
    if (added_value.spec_void) {
        if (SET(void) || SET(char) || SET(short) || SET(int) || SET(long) || SET(float) || SET(double)
            || SET(signed) || SET(unsigned) || SET(struct_union) || SET(enum) || SET(typedefed_name)) {
                goto type_error;
        } else { res.spec_void = 1; }
    } else if (added_value.spec_char) {
        if (SET(void) || SET(char) || SET(short) || SET(int) || SET(long) || SET(float) || SET(double)
            || SET(struct_union) || SET(enum) || SET(typedefed_name)) {
                goto type_error;
        } else { res.spec_char = 1; }
    } else if (added_value.spec_short) {
        if (SET(void) || SET(char) || SET(short) || SET(long) || SET(float) || SET(double)
            || SET(struct_union) || SET(enum) || SET(typedefed_name)) {
                goto type_error;
        } else { res.spec_short = 1; }
    } else if (added_value.spec_int) {
        if (SET(void) || SET(char) || SET(int) || SET(float) || SET(double)
            || SET(struct_union) || SET(enum) || SET(typedefed_name)) {
                goto type_error;
        } else { res.spec_int = 1; }
    } else if (added_value.spec_long) {
        if (SET(void) || SET(char) || SET(short) || SET(long) || SET(float) || SET(double)
            || SET(struct_union) || SET(enum) || SET(typedefed_name)) {
                goto type_error;
        } else { res.spec_long = 1; }
    } else if (added_value.spec_float) {
        if (SET(void) || SET(char) || SET(short) || SET(int) || SET(long) || SET(float) || SET(double)
            || SET(signed) || SET(unsigned) || SET(struct_union) || SET(enum) || SET(typedefed_name)) {
                goto type_error;
        } else { res.spec_float = 1; }
    } else if (added_value.spec_double) {
        if (SET(void) || SET(char) || SET(short) || SET(int) || SET(float) || SET(double)
            || SET(signed) || SET(unsigned) || SET(struct_union) || SET(enum) || SET(typedefed_name)) {
                goto type_error;
        } else { res.spec_double = 1; }
    }
    else if (added_value.spec_signed) {
        if (SET(void) || SET(float) || SET(double) || SET(signed) || SET(unsigned)
            || SET(struct_union) || SET(enum) || SET(typedefed_name)) { goto type_error; }
        else { res.spec_signed = 1; }
    } else if (added_value.spec_unsigned) {
        if (SET(void) || SET(float) || SET(double) || SET(signed) || SET(unsigned)
            || SET(struct_union) || SET(enum) || SET(typedefed_name)) { goto type_error; }
        else { res.spec_unsigned = 1; }
    }

    // compound types
    else if (added_value.spec_struct_union) {
        if (SET(void) || SET(char) || SET(short) || SET(int) || SET(long) || SET(float) || SET(double)
            || SET(signed) || SET(unsigned) || SET(struct_union) || SET(enum) || SET(typedefed_name)) {
                goto type_error;
        } else { res.spec_struct_union = 1, res.spec_compound_type = added_value.spec_compound_type; }
    } else if (added_value.spec_enum) {
        if (SET(void) || SET(char) || SET(short) || SET(int) || SET(long) || SET(float) || SET(double)
            || SET(signed) || SET(unsigned) || SET(struct_union) || SET(enum) || SET(typedefed_name)) {
                goto type_error;
        } else { res.spec_enum = 1, res.spec_compound_type = added_value.spec_compound_type; }
    } else if (added_value.spec_typedefed_name) {
        if (SET(void) || SET(char) || SET(short) || SET(int) || SET(long) || SET(float) || SET(double)
            || SET(signed) || SET(unsigned) || SET(struct_union) || SET(enum) || SET(typedefed_name)) {
                goto type_error;
        } else { res.spec_typedefed_name = 1, res.spec_compound_type = added_value.spec_compound_type; }
    }

    // qualifiers
    else if (added_value.spec_const) {
        if (SET(const)) { goto qualifier_error; }
        else { res.spec_const = 1; }
    } else if (added_value.spec_volatile) {
        if (SET(volatile)) { goto qualifier_error; }
        else { res.spec_volatile = 1; }
    }

    // storage specifiers
    else if (added_value.spec_typedef) {
        if (SET(typedef) || SET(extern) || SET(static) || SET(auto) || SET(register)) { goto storage_error; }
        else { res.spec_typedef = 1; }
    } else if (added_value.spec_extern) {
        if (SET(typedef) || SET(extern) || SET(static) || SET(auto) || SET(register)) { goto storage_error; }
        else { res.spec_extern = 1; }
    } else if (added_value.spec_static) {
        if (SET(typedef) || SET(extern) || SET(static) || SET(auto) || SET(register)) { goto storage_error; }
        else { res.spec_static = 1; }
    } else if (added_value.spec_auto) {
        if (SET(typedef) || SET(extern) || SET(static) || SET(auto) || SET(register)) { goto storage_error; }
        else { res.spec_auto = 1; }
    } else if (added_value.spec_register) {
        if (SET(typedef) || SET(extern) || SET(static) || SET(auto) || SET(register)) { goto storage_error; }
        else { res.spec_register = 1; }
    }
#undef SET

    return res;

type_error:
    aux_error("invalid type specifiers combination");
    return orig_value;

qualifier_error:
    aux_error("invalid const/volatile qualifiers combination");
    return orig_value;

storage_error:
    aux_error("invalid typedef/storage specifiers combination");
    return orig_value;
}

decl_specifier parser_add_qualifiers(decl_specifier orig_value, decl_specifier added_value)
{
    decl_specifier res = orig_value;

    if (added_value.spec_const) {
        if (orig_value.spec_const) {
            aux_error("duplicating qualifiers: 'const'");
        } else {
            res.spec_const = 1;
        }
    }

    if (added_value.spec_volatile) {
        if (orig_value.spec_volatile) {
            aux_error("duplicating qualifiers: 'volatile'");
        } else {
            res.spec_volatile = 1;
        }
    }

    return res;
}


initializer *parser_create_simple_initializer(expression *expr)
{
    initializer *res;

    if (!expr) { return NULL; }

    res                     = allocator_alloc(allocator_temporary_pool, sizeof(initializer));
    res->init_code          = code_terminal_initializer;
    res->init_next          = NULL;
    res->init_data.value    = expr;

    return res;
}

initializer *parser_create_complex_initializer(initializer *child)
{
    initializer *res;

    if (!child) { return NULL; }

    res                 = allocator_alloc(allocator_temporary_pool, sizeof(initializer));
    res->init_code      = code_compound_initializer;
    res->init_next      = NULL;
    res->init_data.list = child;

    return res;
}

initializer *parser_add_initializer(initializer *node, initializer *next)
{
    if (!node || !next) { return NULL; }

    node->init_next = next;
    return next;
}

symbol *parser_attach_initializer(symbol *sym, initializer *value)
{
    if (!sym) { return NULL; }

    // TODO: semantic check: type correspondence, type promotion and casting.
    sym->sym_init = value;
    return sym;
}


parameter *parser_create_named_parameter(decl_specifier spec, symbol *sym)
{
    parameter *res;

    if (!sym) { return NULL; }

    res = allocator_alloc(allocator_temporary_pool, sizeof(parameter));
    type_apply_decl_specifiers_to_type(spec, &sym->sym_type);

    res->param_code     = code_symbol_parameter;
    res->param_next     = NULL;
    res->param_type     = sym->sym_type;
    res->param_sym      = sym;

    sym->sym_is_local   = TRUE;

    return res;
}

parameter *parser_create_unnamed_parameter(decl_specifier spec, data_type *type)
{
    parameter *res;

    if (!type) { return NULL; }

    res                 = allocator_alloc(allocator_temporary_pool, sizeof(parameter));

    res->param_code     = code_type_parameter;
    res->param_next     = NULL;
    res->param_type     = type;

    type_apply_decl_specifiers_to_type(spec, &res->param_type);
    return res;
}


parameter_list *parser_create_parameter_list(parameter *param)
{
    parameter_list *res;

    if (!param) { return NULL; }

    res = allocator_alloc(allocator_temporary_pool, sizeof(parameter_list));

    if (param->param_type->type_code == code_type_void) {
        res->param_first = res->param_last = NULL;
    } else {
        res->param_first  = param;
        res->param_last   = param;
    }

    return res;
}

parameter_list *parser_push_parameter(parameter_list *param_list, parameter *param)
{
    if (!param_list || !param) { return NULL; }

    if (!param_list->param_last || param_list->param_last->param_code == code_ellipsis_parameter) {
        aux_error("unexpected function formal parameter (already seen void or ellipsis)");
        return param_list;
    }

    param_list->param_last->param_next = param;
    param_list->param_last = param;

    return param_list;
}

parameter_list *parser_push_ellipsis(parameter_list *param_list)
{
    parameter *res;

    if (!param_list) { return NULL; }

    res             = allocator_alloc(allocator_temporary_pool, sizeof(parameter));
    res->param_code = code_ellipsis_parameter;
    res->param_next = NULL;
    res->param_type = NULL;

    param_list->param_last->param_next = res;
    param_list->param_last = res;

    return param_list;
}

