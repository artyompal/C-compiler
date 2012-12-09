
#include "common.h"
#include "hash_table.h"
#include "x86_bincode.h"


static hash_id _address_table;


static unsigned int _address_hash(x86_address *addr)
{
    unsigned res = addr->base ^ addr->index ^ addr->scale;

    if (addr->index != -1) {
        res ^= addr->scale;
    }

    return res;
}

static int _address_compare(x86_address *key1, x86_address *key2)
{
    return (key1->base == key2->base && key1->index == key2->index && key1->offset == key2->offset
        && (key1->index == -1 || key1->scale == key2->scale));
}


void _cache_every_address(function_desc *function, x86_operand_type type)
{
}


void x86_caching_init()
{
    _address_table = hash_init((hash_function) _address_hash, (hash_equal_function) _address_compare);
}

void x86_caching_term()
{
    hash_term(_address_table);
}

void x86_caching_pass(function_desc *function)
{
    _cache_every_address(function, x86op_dword);
    _cache_every_address(function, x86op_float);
}

