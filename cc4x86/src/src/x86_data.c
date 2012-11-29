
#include "common.h"
#include "hash_table.h"
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
static hash_id float_table, double_table, xmmword_table;


static unsigned int float_hash(symbol *key)
{
    return key->sym_value.val_int;
}

static int float_equal(symbol *key1, symbol *key2)
{
    return (key1->sym_value.val_int == key2->sym_value.val_int);
}


static unsigned int double_hash(symbol *key)
{
    return key->sym_value.val_longlong;
}

static int double_equal(symbol *key1, symbol *key2)
{
    return (key1->sym_value.val_longlong == key2->sym_value.val_longlong);
}


static unsigned int xmmword_hash(symbol *key)
{
    return (key->sym_value.val_float4.i[0] ^ key->sym_value.val_float4.i[1] ^ key->sym_value.val_float4.i[2] ^ key->sym_value.val_float4.i[3]);
}

static int xmmword_equal(symbol *key1, symbol *key2)
{
    return (key1->sym_value.val_float4.i[0] == key2->sym_value.val_float4.i[0] &&
            key1->sym_value.val_float4.i[1] == key2->sym_value.val_float4.i[1] &&
            key1->sym_value.val_float4.i[2] == key2->sym_value.val_float4.i[2] &&
            key1->sym_value.val_float4.i[3] == key2->sym_value.val_float4.i[3]);
}


void x86data_init(void)
{
    float_table     = hash_init((hash_function) float_hash, (hash_equal_function) float_equal);
    double_table    = hash_init((hash_function) double_hash, (hash_equal_function) double_equal);
    xmmword_table   = hash_init((hash_function) xmmword_hash, (hash_equal_function) xmmword_equal);
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
    symbol *key = allocator_alloc(allocator_global_pool, sizeof(symbol));
    symbol *found;

    key->sym_value.val_int = constant;
    found = hash_find(float_table, key);

    if (found) {
        allocator_free(allocator_global_pool, key, sizeof(symbol));
        return found;
    }

    key = symbol_create_unnamed("float", code_sym_variable, type_create_arithmetic(code_type_float));
    key->sym_value.val_int = constant;
    hash_insert(float_table, key);

    _ensure_data_section();
    text_output_declare_initialized_dword(key, constant);
    return key;
}

symbol *x86data_insert_double_constant(long long constant)
{
    symbol *key = allocator_alloc(allocator_global_pool, sizeof(symbol));
    symbol *found;

    key->sym_value.val_longlong = constant;
    found = hash_find(double_table, key);

    if (found) {
        allocator_free(allocator_global_pool, key, sizeof(symbol));
        return found;
    }

    key = symbol_create_unnamed("double", code_sym_variable, type_create_arithmetic(code_type_double));
    key->sym_value.val_longlong = constant;
    hash_insert(double_table, key);

    _ensure_data_section();
    text_output_declare_initialized_qword(key, constant);
    return key;
}

symbol *x86data_insert_float4_constant(long c1, long c2, long c3, long c4)
{
    symbol *key = allocator_alloc(allocator_global_pool, sizeof(symbol));
    symbol *found;

    key->sym_value.val_float4.i[0] = c1;
    key->sym_value.val_float4.i[1] = c2;
    key->sym_value.val_float4.i[2] = c3;
    key->sym_value.val_float4.i[3] = c4;

    found = hash_find(xmmword_table, key);

    if (found) {
        allocator_free(allocator_global_pool, key, sizeof(symbol));
        return found;
    }

    key = symbol_create_unnamed("float4", code_sym_variable, type_create_arithmetic(code_type_float));

    key->sym_value.val_float4.i[0] = c1;
    key->sym_value.val_float4.i[1] = c2;
    key->sym_value.val_float4.i[2] = c3;
    key->sym_value.val_float4.i[3] = c4;

    hash_insert(xmmword_table, key);

    _ensure_data_section();
    text_output_declare_initialized_xmmword(key, c1, c2, c3, c4);
    return key;
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

void x86data_declare_initialized_qword(symbol *sym, long long value)
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

