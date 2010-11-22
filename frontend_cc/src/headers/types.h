
#ifndef TYPES_H__INCLUDED
#define TYPES_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


typedef struct expression_decl      expression;
typedef struct symbol_decl          symbol;
typedef struct parameter_list_decl  parameter_list;
typedef struct symbol_list_decl     symbol_list;


typedef enum data_type_code_decl {
    // arithmetic types
    code_type_void,
    code_type_char,
    code_type_unsigned_char,
    code_type_short,
    code_type_unsigned_short,
    code_type_int,
    code_type_unsigned_int,
    code_type_long,
    code_type_unsigned_long,
    code_type_long_long,
    code_type_unsigned_long_long,
    code_type_enum,
    code_type_float,
    code_type_double,
    code_type_long_double,

    // complex types
    code_type_pointer,
    code_type_sized_array,
    code_type_unsized_array,
    code_type_structure,
    code_type_union,
    code_type_function,
    code_type_incomplete_structure,
    code_type_incomplete_union,
    code_type_incomplete_enum,

    code_type_count,
    code_type_count_of_arithmetic = code_type_pointer,
} data_type_code;


typedef struct data_type_decl data_type;
typedef struct structure_union_field_decl structure_union_field;

typedef struct structure_union_field_decl {
    symbol *                field_sym;          // NULL - filler
    int                     field_width;        // -1 -- unspecified
    int                     field_offset;
    structure_union_field * field_next;
} struct_union_field;

typedef struct fields_list_decl {
    struct_union_field *    fields_first;
    struct_union_field *    fields_last;
} fields_list;

typedef struct data_type_decl {
    data_type_code          type_code;

    union {
        // code_type_pointer
        struct ptr_decl {
            data_type *     item_type;
            BOOL            is_const;
            BOOL            is_volatile;
        } ptr;

        // code_type_sized_array, code_type_unsized_array
        struct array_decl {
            data_type *     item_type;
            int             size;         // only valid for code_type_sized_array
        } array;

        // code_type_structure, code_type_union
        struct struct_decl {
            symbol *        sym;
            fields_list     list;
        } struct_union;

        // code_type_enum, code_type_incomplete_structure, code_type_incomplete_union, code_type_incomplete_enum,
        struct enum_decl {
            symbol *        sym;
        } enum_or_incomplete;

        // code_type_function
        struct function_decl {
            data_type *     result_type;
            parameter_list *parameters_list;
        } function;
    } data;
} data_type;



typedef struct decl_specifier_decl {
    data_type *     spec_compound_type;

    unsigned int    spec_void:1;
    unsigned int    spec_char:1;
    unsigned int    spec_short:1;
    unsigned int    spec_int:1;
    unsigned int    spec_long:1;
    unsigned int    spec_float:1;
    unsigned int    spec_double:1;
    unsigned int    spec_signed:1;
    unsigned int    spec_unsigned:1;

    unsigned int    spec_struct_union:1;
    unsigned int    spec_enum:1;
    unsigned int    spec_typedefed_name:1;

    unsigned int    spec_const:1;
    unsigned int    spec_volatile:1;

    unsigned int    spec_typedef:1;
    unsigned int    spec_extern:1;
    unsigned int    spec_static:1;
    unsigned int    spec_auto:1;
    unsigned int    spec_register:1;
} decl_specifier;


#define TYPE_IS_INTEGRAL(TYPE) \
    ((TYPE)->type_code >= code_type_char && (TYPE)->type_code <= code_type_enum)
#define TYPE_IS_FLOATING(TYPE) \
    ((TYPE)->type_code >= code_type_float && (TYPE)->type_code <= code_type_long_double)
#define TYPE_IS_ARITHMETIC(TYPE) \
    ((TYPE)->type_code >= code_type_char && (TYPE)->type_code <= code_type_long_double)
#define TYPE_IS_POINTER(TYPE) \
    ((TYPE)->type_code == code_type_pointer || (TYPE)->type_code == code_type_unsized_array)
#define TYPE_IS_INTEGRAL_OR_POINTER(TYPE) \
    (TYPE_IS_INTEGRAL(TYPE) || TYPE_IS_POINTER(TYPE))
#define TYPE_IS_ARRAY(TYPE) \
    ((TYPE)->type_code == code_type_sized_array || (TYPE)->type_code == code_type_unsized_array)
#define TYPE_IS_VOID(TYPE) \
    ((TYPE)->type_code == code_type_void)
#define TYPE_IS_FUNCTION(TYPE) \
    ((TYPE)->type_code == code_type_function)
#define TYPE_IS_NONFUNC_POINTER(TYPE) \
    (TYPE_IS_POINTER(TYPE) && !TYPE_IS_FUNCTION((TYPE)->data.ptr.item_type))
#define TYPE_IS_STRUCTURE_UNION(TYPE) \
    ((TYPE)->type_code == code_type_structure || (TYPE)->type_code == code_type_union)
#define TYPE_IS_POINTER_TO_FUNCTION(TYPE) \
    (TYPE_IS_POINTER(TYPE) && TYPE_IS_FUNCTION((TYPE)->data.ptr.item_type))

#define TYPE_IS_X86_BYTE(TYPE) \
    ((TYPE)->type_code == code_type_char || (TYPE)->type_code == code_type_unsigned_char)
#define TYPE_IS_X86_WORD(TYPE) \
    ((TYPE)->type_code == code_type_short || (TYPE)->type_code == code_type_unsigned_short)
#define TYPE_IS_X86_DWORD(TYPE) \
    ((TYPE)->type_code == code_type_int || (TYPE)->type_code == code_type_unsigned_int \
        || (TYPE)->type_code == code_type_long || (TYPE)->type_code == code_type_unsigned_long \
        || (TYPE)->type_code == code_type_enum || (TYPE)->type_code == code_type_pointer)
#define TYPE_IS_X86_QWORD(TYPE) \
    ((TYPE)->type_code == code_type_long_long || (TYPE)->type_code == code_type_unsigned_long_long)
#define TYPE_IS_FLOATING(TYPE) \
    ((TYPE)->type_code >= code_type_float && (TYPE)->type_code <= code_type_long_double)



data_type *         type_create_arithmetic              (data_type_code code);
data_type *         type_create_string                  ();

symbol *            type_add_sized_array_node           (symbol *sym, expression *size);
symbol *            type_add_unsized_array_node         (symbol *sym);
symbol *            type_add_function_node              (symbol *sym, parameter_list *params);

data_type *         type_add_abstract_sized_array_node  (data_type *element, expression *size);
data_type *         type_add_abstract_unsized_array_node(data_type *element);
data_type *         type_add_abstract_function_node     (data_type *result, parameter_list *params);

struct_union_field *type_create_field                   (symbol *sym, expression *width);
fields_list *       type_create_fields_list             (struct_union_field *new_field);
fields_list *       type_add_field_to_list              (fields_list *fields, struct_union_field *new_field);
fields_list *       type_add_fields_to_list             (fields_list *fields1, fields_list *fields2);

data_type *         type_create_complete_structure      (symbol *sym, fields_list *fields);
data_type *         type_create_incomplete_structure    (symbol *sym);
data_type *         type_create_complete_union          (symbol *sym, fields_list *fields);
data_type *         type_create_incomplete_union        (symbol *sym);

void                type_apply_decl_specifiers_to_type  (decl_specifier decl_spec, data_type **type);
void                type_apply_decl_specifiers_to_vars  (decl_specifier decl_spec, symbol_list *symbols);
void                type_apply_decl_specifiers_to_params(decl_specifier decl_spec, parameter_list *params_list);
void                type_apply_decl_specifiers_to_fields(decl_specifier decl_spec, fields_list *fields);

int                 type_calculate_sizeof               (data_type *type);
int                 type_calculate_offsetof             (data_type *type, symbol *field, data_type **field_type);

BOOL                type_are_same                       (data_type *type1, data_type *type2);

data_type *         type_create_pointer_node            (data_type *pointee);

data_type *         type_create_from_spec               (decl_specifier decl_spec);
data_type *         type_create_from_spec_and_decl      (decl_specifier decl_spec, data_type *type);
data_type *         type_add_pointers_to_type           (data_type *pointers, data_type *item);
symbol *            type_add_pointers_to_symbol_type    (data_type *pointers, symbol *sym);
data_type *         type_create_pointer                 (void);
data_type *         type_create_pointer_with_spec       (decl_specifier decl_spec);
data_type *         type_create_pointer_to_type         (data_type *type);
data_type *         type_create_pointer_with_spec_to_type(decl_specifier decl_spec, data_type *type);

data_type *         type_declare_enumeration            (symbol *sym);
data_type *         type_declare_incomplete_enumeration (symbol *sym);
void                type_declare_enum_item              (symbol *sym, expression *value);


#else
#error Header types.h duplicated.
#endif // TYPES_H__INCLUDED
