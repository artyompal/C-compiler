
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
    double      value;
    symbol *    sym;
} float_symbol;

static hash_id float_table;


static unsigned int float_hash(float_symbol *key)
{
    return (*(unsigned int *)&key->value) ^ 0x5C5C5C5C;
}

static int float_equal(float_symbol *key1, float_symbol *key2)
{
    return (key1->value == key2->value);
}


void x86data_init(void)
{
    float_table = hash_init((hash_function) float_hash, (hash_equal_function) float_equal);
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

symbol *x86data_insert_float_constant(double constant)
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
    text_output_declare_initialized_float(sym, constant);
    return sym;
}

void x86data_declare_uninitialized_bytes(symbol *sym, int size)
{
    _ensure_data_section();
    text_output_declare_uninitialized_bytes(sym, size);
}

void x86data_declare_initialized_int(symbol *sym, long value)
{
    _ensure_data_section();
    text_output_declare_initialized_int(sym, value);
}

void x86data_declare_initialized_float(symbol *sym, double value)
{
    _ensure_data_section();
    text_output_declare_initialized_float(sym, value);
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

