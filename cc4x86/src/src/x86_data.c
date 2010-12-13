
#include "common.h"
#include "symbol_table.h"
#include "types.h"
#include "x86_data.h"
#include "x86_text_output.h"


typedef enum section_type_decl {
    section_unknown,
    section_data,
    section_text,
} section_type;

static section_type _current_section = section_unknown;


typedef struct float_symbol_decl {
    long        value;
    symbol *    sym;
} float_symbol;

typedef struct double_symbol_decl {
    __int64     value;
    symbol *    sym;
} double_symbol;

static hash_id float_table, double_table;


static unsigned int float_hash(float_symbol *key)
{
    return key->value;
}

static int float_equal(float_symbol *key1, float_symbol *key2)
{
    return (key1->value == key2->value);
}


static unsigned int double_hash(double_symbol *key)
{
    return key->value;
}

static int double_equal(double_symbol *key1, double_symbol *key2)
{
    return (key1->value == key2->value);
}


void x86data_init(void)
{
    float_table     = hash_init((hash_function) float_hash, (hash_equal_function) float_equal);
    double_table    = hash_init((hash_function) double_hash, (hash_equal_function) double_equal);
}


static void _ensure_data_section(void)
{
    if (_current_section != section_data) {
        text_output_begin_data_section();
        _current_section = section_data;
    }
}

void x86data_enter_text_section(void)
{
    if (_current_section != section_text) {
        text_output_begin_text_section();
        _current_section = section_text;
    }
}

symbol *x86data_insert_float_constant(long constant)
{
    float_symbol *key = allocator_alloc(allocator_global_pool, sizeof(float_symbol));
    float_symbol *found;
    symbol *sym;

    key->value  = constant;
    found       = hash_find(float_table, key);

    if (found) {
        allocator_free(allocator_global_pool, key, sizeof(float_symbol));
        return found->sym;
    }

    sym         = symbol_create_unnamed("float", code_sym_variable, type_create_arithmetic(code_type_float));
    key->sym    = sym;
    hash_insert(float_table, key);

    _ensure_data_section();
    text_output_declare_initialized_dword(sym, constant);
    return sym;
}

symbol *x86data_insert_double_constant(__int64 constant)
{
    float_symbol *key = allocator_alloc(allocator_global_pool, sizeof(float_symbol));
    float_symbol *found;
    symbol *sym;

    key->value  = constant;
    found       = hash_find(double_table, key);

    if (found) {
        allocator_free(allocator_global_pool, key, sizeof(float_symbol));
        return found->sym;
    }

    sym         = symbol_create_unnamed("double", code_sym_variable, type_create_arithmetic(code_type_double));
    key->sym    = sym;
    hash_insert(double_table, key);

    _ensure_data_section();
    text_output_declare_initialized_qword(sym, constant);
    return sym;
}

void x86data_declare_uninitialized_bytes(symbol *sym, int size)
{
    _ensure_data_section();
    text_output_declare_uninitialized_bytes(sym, size);
}

void x86data_declare_initialized_dword(symbol *sym, long value)
{
    _ensure_data_section();
    text_output_declare_initialized_dword(sym, value);
}

void x86data_declare_initialized_qword(symbol *sym, __int64 value)
{
    _ensure_data_section();
    text_output_declare_initialized_qword(sym, value);
}

void x86data_declare_initialized_string(symbol *sym, const char *value)
{
    _ensure_data_section();
    text_output_declare_initialized_string(sym, value);
}

void x86data_declare_ptr_to_initialized_string(symbol *sym, const char *value)
{
    symbol *rel_sym;

    _ensure_data_section();
    rel_sym = symbol_create_unnamed("string", code_sym_variable, sym->sym_type);
    text_output_declare_initialized_string(rel_sym, value);
    text_output_declare_ptr_to_relocable(sym, rel_sym);
}

