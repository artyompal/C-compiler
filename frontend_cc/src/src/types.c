
#include "common.h"
#include "parser.h"


static data_type _arithmetic_types[code_type_count_of_arithmetic] = {
    { code_type_void, },
    { code_type_char, },
    { code_type_unsigned_char, },
    { code_type_short, },
    { code_type_unsigned_short, },
    { code_type_int, },
    { code_type_unsigned_int, },
    { code_type_long, },
    { code_type_unsigned_long, },
    { code_type_long_long, },
    { code_type_unsigned_long_long, },
    { code_type_enum, },
    { code_type_float, },
    { code_type_double, },
    { code_type_long_double, },
};


static data_type **_type_find_terminal(data_type **type)
{
    if (!*type) {
        return type;
    }

    switch ((*type)->type_code) {
    case code_type_pointer:
        return _type_find_terminal(&((*type)->data.ptr.item_type));

    case code_type_sized_array:
        return _type_find_terminal(&((*type)->data.array.item_type));

    case code_type_unsized_array:
        return _type_find_terminal(&((*type)->data.array.item_type));

    case code_type_function:
        return _type_find_terminal(&((*type)->data.function.result_type));

    case code_type_void:
    case code_type_char:
    case code_type_unsigned_char:
    case code_type_short:
    case code_type_unsigned_short:
    case code_type_int:
    case code_type_unsigned_int:
    case code_type_long:
    case code_type_unsigned_long:
    case code_type_float:
    case code_type_double:
    case code_type_long_double:
        return type;

    case code_type_structure:
    case code_type_union:
    case code_type_incomplete_structure:
    case code_type_incomplete_union:
    default:
        aux_unimplemented_error("unsupported type for overriding declaration specifiers");
    }
}


data_type *type_create_arithmetic(data_type_code code)
{
    ASSERT(code < code_type_count_of_arithmetic);
    return &_arithmetic_types[code];
}


static data_type *_type_create(data_type_code type_code)
{
    data_type *res;

    res             = allocator_alloc(allocator_persistent_pool, sizeof(data_type));
    res->type_code  = type_code;

    return res;
}

data_type *type_create_string()
{
    data_type *res  = _type_create(code_type_unsized_array);
    res->data.array.item_type = type_create_arithmetic(code_type_char);
    return res;
}


//
//  онструктор рекуррентно-заданных типов данных.
//

static data_type *_type_add_sized_array_node(data_type **type, expression *size)
{
    data_type *res;
    data_type **terminal_type;

    terminal_type               = _type_find_terminal(type);

    res                         = _type_create(code_type_sized_array);
    res->data.array.item_type   = *terminal_type;

    if (!size) {
        res->data.array.size        = 1;
    } else {
        if (size->expr_code != code_expr_int_constant || size->data.int_const <= 0) {
            aux_error("array size must be non-negative integer constant");
            res->data.array.size    = 1;
        } else {
            res->data.array.size    = size->data.int_const;
        }
    }

    *terminal_type              = res;
    return *type;
}

static data_type *_type_add_unsized_array_node(data_type **type)
{
    data_type *res;
    data_type **terminal_type;

    terminal_type               = _type_find_terminal(type);

    res                         = _type_create(code_type_unsized_array);
    res->data.array.item_type   = *terminal_type;

    *terminal_type              = res;
    return *type;
}

static data_type *_type_add_function_node(data_type **type, parameter_list *params)
{
    data_type *res;
    data_type **terminal_type;

    terminal_type                       = _type_find_terminal(type);

    res                                 = _type_create(code_type_function);
    res->data.function.result_type      = *terminal_type;

    if (!params) {
        params = allocator_alloc(allocator_persistent_pool, sizeof(parameter_list));
        params->param_first = params->param_last = NULL;
    }

    res->data.function.parameters_list  = params;
    *terminal_type                      = res;

    return *type;
}


symbol *type_add_sized_array_node(symbol *sym, expression *size)
{
    if (!sym) {
        return NULL;
    } else {
        _type_add_sized_array_node(&sym->sym_type, size);
        return sym;
    }
}

symbol *type_add_unsized_array_node(symbol *sym)
{
    if (!sym) {
        return NULL;
    } else {
        _type_add_unsized_array_node(&sym->sym_type);
        return sym;
    }
}

symbol *type_add_function_node(symbol *sym, parameter_list *params)
{
    if (!sym) {
        return NULL;
    } else {
        _type_add_function_node(&sym->sym_type, params);
        return sym;
    }
}


data_type *type_add_abstract_sized_array_node(data_type *type, expression *size)
{
    return _type_add_sized_array_node(&type, size);
}

data_type *type_add_abstract_unsized_array_node(data_type *type)
{
    return _type_add_unsized_array_node(&type);
}

data_type *type_add_abstract_function_node(data_type *type, parameter_list *params)
{
    return _type_add_function_node(&type, params);
}


struct_union_field *type_create_field(symbol *sym, expression *width)
{
    struct_union_field *res = allocator_alloc(allocator_persistent_pool, sizeof(struct_union_field));

    sym                 = symbol_remove_from_table(sym, FALSE);
    sym->sym_code       = code_sym_field;

    res->field_sym      = sym;
    res->field_offset   = 0;
    res->field_next     = NULL;

    if (!width) {
        res->field_width = -1;
    } else {
        res->field_width = width->data.int_const;

        if (width->expr_code != code_expr_int_constant || res->field_width < 0) {
            aux_error("bitfield width must be non-negative integer constant");
            res->field_width = -1;
        }
    }

    return res;
}

fields_list *type_create_fields_list(struct_union_field *field)
{
    fields_list *res = allocator_alloc(allocator_persistent_pool, sizeof(struct_union_field));
    res->fields_first = res->fields_last = field;
    return res;
}

fields_list *type_add_field_to_list(fields_list *fields, struct_union_field *new_field)
{
    fields->fields_last->field_next = new_field;
    fields->fields_last = new_field;

    return fields;
}

fields_list *type_add_fields_to_list(fields_list *fields1, fields_list *fields2)
{
    fields1->fields_last->field_next = fields2->fields_first;
    fields1->fields_last = fields2->fields_last;

    allocator_free(allocator_persistent_pool, fields2, sizeof(fields_list));
    return fields1;
}


data_type *type_create_complete_structure(symbol *sym, fields_list *fields)
{
    data_type *res;
    struct_union_field *field, *prev;

    res                         = _type_create(code_type_structure);

    if (!sym) {
        sym = symbol_create_unnamed("struct", code_sym_type, res);
    }

    res->data.struct_union.sym  = sym;
    res->data.struct_union.list = *fields;

    sym->sym_code               = code_sym_type;
    sym->sym_type               = res;

    // вычисл€ем смещение каждого пол€ структуры
    field = fields->fields_first->field_next;

    for (prev = fields->fields_first; field; prev = field, field = field->field_next) {
        field->field_offset = prev->field_offset + type_calculate_sizeof(prev->field_sym->sym_type);
    }

    return sym->sym_type;
}

data_type *type_create_complete_union(symbol *sym, fields_list *fields)
{
    data_type *res;

    res                         = _type_create(code_type_union);

    if (!sym) {
        sym = symbol_create_unnamed("union", code_sym_type, res);
    }

    res->data.struct_union.sym  = sym;
    res->data.struct_union.list = *fields;

    sym->sym_code               = code_sym_type;
    sym->sym_type               = res;

    return sym->sym_type;
}

data_type *type_create_incomplete_structure(symbol *sym)
{
    if (!sym) { return NULL; }

    sym->sym_code   = code_sym_type;
    sym->sym_type   = _type_create(code_type_incomplete_structure);

    return sym->sym_type;
}

data_type *type_create_incomplete_union(symbol *sym)
{
    if (!sym) { return NULL; }

    sym->sym_code   = code_sym_type;
    sym->sym_type   = _type_create(code_type_incomplete_union);

    return sym->sym_type;
}


void type_apply_decl_specifiers_to_type(decl_specifier decl_spec, data_type **type)
{
    data_type **terminal_type = _type_find_terminal(type);
    *terminal_type = type_create_from_spec(decl_spec);
}

void type_apply_decl_specifiers_to_vars(decl_specifier decl_spec, symbol_list *symbols)
{
    symbol *sym;

    if (!symbols) { return; }

    for (sym = symbols->list_first; sym; sym = sym->sym_next) {
        if (decl_spec.spec_typedef) {
            symbol_transform_to_typedef(sym);
        }

        type_apply_decl_specifiers_to_type(decl_spec, &sym->sym_type);
    }
}

void type_apply_decl_specifiers_to_params(decl_specifier decl_spec, parameter_list *params_list)
{
    parameter *param;

    for (param = params_list->param_first; param; param = param->param_next) {
        type_apply_decl_specifiers_to_type(decl_spec, &param->param_type);
    }
}

void type_apply_decl_specifiers_to_fields(decl_specifier decl_spec, fields_list *fields)
{
    struct_union_field *field;

    for (field = fields->fields_first; field; field = field->field_next) {
        type_apply_decl_specifiers_to_type(decl_spec, &field->field_sym->sym_type);
    }
}


int type_calculate_sizeof(data_type *type)
{
    switch (type->type_code) {
    case code_type_void:
        aux_error("requested sizeof(void): invalid sizeof or pointer indexing");
        return 4;

    case code_type_char:
        return 1;
    case code_type_unsigned_char:
        return 1;
    case code_type_short:
        return 2;
    case code_type_unsigned_short:
        return 2;
    case code_type_int:
        return 4;
    case code_type_unsigned_int:
        return 4;
    case code_type_long:
        return 4;
    case code_type_unsigned_long:
        return 4;
    case code_type_float:
        return 4;
    case code_type_double:
        return 8;
    case code_type_long_double:
        return 8;

    case code_type_pointer:
        return 4;
    case code_type_sized_array:
        return type_calculate_sizeof(type->data.array.item_type) * type->data.array.size;
    case code_type_unsized_array:
        aux_error("requested sizeof of array with unspecified size");
        return 4;

    case code_type_structure:
        {
            struct_union_field *field = type->data.struct_union.list.fields_first;
            int size = 0;

            for (; field; field = field->field_next) {
                size += type_calculate_sizeof(field->field_sym->sym_type);
            }

            return size;
        }
        break;
    case code_type_union:
        {
            struct_union_field *field = type->data.struct_union.list.fields_first;
            int size = 0;

            for (; field; field = field->field_next) {
                int cur_sz = type_calculate_sizeof(field->field_sym->sym_type);
                size = MAX(size, cur_sz);
            }

            return size;
        }
        break;

    case code_type_enum:
        return 4;

    case code_type_incomplete_structure:
        aux_error("requested sizeof(incomplete structure): invalid sizeof or pointer indexing");
        return 4;
    case code_type_incomplete_union:
        aux_error("requested sizeof(incomplete union): invalid sizeof or pointer indexing");
        return 4;

    default:
        ASSERT(FALSE);
    }
}

int type_calculate_offsetof(data_type *type, symbol *field_name, data_type **field_type)
{
    struct_union_field *field;

    ASSERT(type->type_code == code_type_union || type->type_code == code_type_structure);

    for (field = type->data.struct_union.list.fields_first; field; field = field->field_next) {
        if (!strcmp(field->field_sym->sym_name, field_name->sym_name)) {
            *field_type = field->field_sym->sym_type;
            return field->field_offset;
        }
    }

    aux_error("no field '%s' found in structure '%s'", field_name->sym_name, type->data.struct_union.sym->sym_name);
    return -1;
}


BOOL type_are_same(data_type *type1, data_type *type2)
{
    if (type1->type_code != type2->type_code) {
        return FALSE;
    }

    switch (type1->type_code) {
    case code_type_void:
    case code_type_char:
    case code_type_unsigned_char:
    case code_type_short:
    case code_type_unsigned_short:
    case code_type_int:
    case code_type_unsigned_int:
    case code_type_long:
    case code_type_unsigned_long:
    case code_type_float:
    case code_type_double:
    case code_type_long_double:
        return TRUE;

    case code_type_pointer:
        return (type1->data.ptr.is_const == type2->data.ptr.is_const &&
            type1->data.ptr.is_volatile == type2->data.ptr.is_volatile &&
            type_are_same(type1->data.ptr.item_type, type2->data.ptr.item_type));

    case code_type_sized_array:
    case code_type_unsized_array:
        return type_are_same(type1->data.array.item_type, type2->data.array.item_type);

    case code_type_structure:
    case code_type_union:
        return !strcmp(type1->data.struct_union.sym->sym_name, type2->data.struct_union.sym->sym_name);

    case code_type_function:
        {
            parameter *param1 = type1->data.function.parameters_list->param_first;
            parameter *param2 = type2->data.function.parameters_list->param_first;

            for (;;) {
                if (!param1) {
                    return !param2;
                } else if (!param2) {
                    return FALSE;
                } else if ((param1->param_code == code_ellipsis_parameter) ^ (param2->param_code == code_ellipsis_parameter)) {
                    return FALSE;
                } else if (param1->param_code == code_ellipsis_parameter) {
                    return (param2->param_code == code_ellipsis_parameter);
                } else if (!type_are_same(param1->param_type, param2->param_type)) {
                    return FALSE;
                }

                param1 = param1->param_next, param2 = param2->param_next;
            }
        }

    case code_type_enum:
    case code_type_incomplete_structure:
    case code_type_incomplete_union:
        return !strcmp(type1->data.enum_or_incomplete.sym->sym_name, type2->data.enum_or_incomplete.sym->sym_name);

    default:
        ASSERT(FALSE);
    }
}

data_type *type_create_pointer_node(data_type *pointee)
{
    data_type *res              = _type_create(code_type_pointer);

    res->data.ptr.item_type     = pointee;
    res->data.ptr.is_const      = FALSE;
    res->data.ptr.is_volatile   = FALSE;

    return res;
}


data_type *type_create_from_spec(decl_specifier decl_spec)
{
    data_type *res = NULL;

    if (decl_spec.spec_void) {
        res = type_create_arithmetic(code_type_void);
    } else if (decl_spec.spec_char) {
        if (decl_spec.spec_unsigned) {
            res = type_create_arithmetic(code_type_unsigned_char);
        } else {
            res = type_create_arithmetic(code_type_char);
        }
    } else if (decl_spec.spec_short) {
        if (decl_spec.spec_unsigned) {
            res = type_create_arithmetic(code_type_unsigned_short);
        } else {
            res = type_create_arithmetic(code_type_short);
        }
    } else if (decl_spec.spec_double) {
        if (decl_spec.spec_long) {
            res = type_create_arithmetic(code_type_long_double);
        } else {
            res = type_create_arithmetic(code_type_double);
        }
    } else if (decl_spec.spec_long) {
        if (decl_spec.spec_unsigned) {
            res = type_create_arithmetic(code_type_unsigned_long);
        } else {
            res = type_create_arithmetic(code_type_long);
        }
    } else if (decl_spec.spec_unsigned) {
        res = type_create_arithmetic(code_type_unsigned_int);
    } else if (decl_spec.spec_int) {
        res = type_create_arithmetic(code_type_int);
    } else if (decl_spec.spec_float) {
        res = type_create_arithmetic(code_type_float);
    } else if (decl_spec.spec_struct_union || decl_spec.spec_typedefed_name) {
        res = decl_spec.spec_compound_type;
    } else {
        UNIMPLEMENTED_ASSERT("unsupported type specifiers");
    }

    return res;
}

data_type *type_create_from_spec_and_decl(decl_specifier decl_spec, data_type *type)
{
    type_apply_decl_specifiers_to_type(decl_spec, &type);
    return type;
}

data_type *type_add_pointers_to_type(data_type *pointers, data_type *item)
{
    data_type **item_term_type, **ptrs_term_type;

    item_term_type      = _type_find_terminal(&item);
    ptrs_term_type      = _type_find_terminal(&pointers);

    *ptrs_term_type     = *item_term_type;
    *item_term_type     = pointers;

    return item;
}

symbol *type_add_pointers_to_symbol_type(data_type *pointers, symbol *sym)
{
    data_type **sym_term_type, **ptrs_term_type;

    if (!sym) return NULL;

    sym_term_type       = _type_find_terminal(&sym->sym_type);
    ptrs_term_type      = _type_find_terminal(&pointers);

    *ptrs_term_type     = *sym_term_type;
    *sym_term_type      = pointers;

    return sym;
}

data_type *type_create_pointer(void)
{
    return type_create_pointer_node(NULL);
}

data_type *type_create_pointer_with_spec(decl_specifier decl_spec)
{
    data_type *ptr              = type_create_pointer_node(NULL);

    ptr->data.ptr.is_const      = decl_spec.spec_const;
    ptr->data.ptr.is_volatile   = decl_spec.spec_volatile;

    return ptr;
}

data_type *type_create_pointer_to_type(data_type *type)
{
    return type_create_pointer_node(type);
}

data_type *type_create_pointer_with_spec_to_type(decl_specifier decl_spec, data_type *type)
{
    data_type *ptr              = type_create_pointer_node(type);

    ptr->data.ptr.is_const      = decl_spec.spec_const;
    ptr->data.ptr.is_volatile   = decl_spec.spec_volatile;

    return ptr;
}


static int last_enum_item = 0;

data_type *type_declare_enumeration(symbol *sym)
{
    data_type *res = _type_create(code_type_enum);

    if (!sym) {
        sym = symbol_create_unnamed("enum", code_sym_type, res);
    }

    res->data.enum_or_incomplete.sym = sym;
    sym->sym_code   = code_sym_type;

    last_enum_item  = 0;

    return res;
}

data_type *type_declare_incomplete_enumeration(symbol *sym)
{
    data_type *res  = _type_create(code_type_incomplete_enum);

    res->data.enum_or_incomplete.sym = sym;
    sym->sym_code   = code_sym_type;

    return res;
}

void type_declare_enum_item(symbol *sym, expression *value)
{
    sym->sym_code   = code_sym_type;

    if (!value)
        sym->sym_value = last_enum_item++;
    else if (value->expr_code == code_expr_int_constant) {
        sym->sym_value = value->data.int_const;
    } else {
        aux_error("enumeration item must be an integer constant");
        sym->sym_value = last_enum_item++;
    }
}

