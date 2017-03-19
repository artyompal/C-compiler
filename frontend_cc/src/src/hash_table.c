
#include "common.h"
#include "hash_table.h"


typedef struct hash_table_decl {
    hash_function           hash_func;
    hash_equal_function     equal_func;

    void **                 data;
    unsigned int            size;
    unsigned int            reserved;
} hash_table;

#define INDEX_WRAP(IDX) ((IDX) + 1 < hash->reserved ? (IDX) + 1 : 0)


static void _hash_reset(hash_id hash)
{
    hash->data = allocator_alloc(allocator_global_pool, hash->reserved * sizeof(void *));
    hash_clear(hash);
}


hash_id hash_init(hash_function hash_func, hash_equal_function equal_func)
{
    hash_id hash        = allocator_alloc(allocator_global_pool, sizeof(hash_table));

    hash->hash_func     = hash_func;
    hash->equal_func    = equal_func;

    hash->reserved      = 0x1000;
    _hash_reset(hash);

    return hash;
}

void hash_clear(hash_id hash)
{
    unsigned i;

    for (i = 0; i < hash->reserved; i++) {
        hash->data[i] = NULL;
    }

    hash->size = 0;
}


void *hash_find(hash_id hash, void *value)
{
    unsigned hash_value = hash->hash_func(value) % hash->reserved;

    while (hash->data[hash_value] != NULL) {
        if (hash->equal_func(hash->data[hash_value], value)) {
            return hash->data[hash_value];
        }

        hash_value = INDEX_WRAP(hash_value);
    }

    return NULL;
}

void hash_insert(hash_id hash, void *value)
{
    unsigned hash_value = hash->hash_func(value) % hash->reserved;

    hash->size++;

    // Мы сохраняем таблицу хотя бы наполовину свободной, чтобы уменьшить число коллизий.
    if (hash->size * 2 > hash->reserved) {
        unsigned old_reserved   = hash->reserved;
        void **old_data         = hash->data;
        unsigned i;

        hash->reserved *= 2;
        _hash_reset(hash);

        for (i = 0; i < old_reserved; i++) {
            void *item = old_data[i];

            if (item) {
                hash_insert(hash, item);
            }
        }
    }

    // Так как таблица хотя бы наполовину свободна, место всегда есть. Находим первую незанятую ячейку.
    while (hash->data[hash_value] != NULL) {
        hash_value = INDEX_WRAP(hash_value);
    }

    hash->data[hash_value] = value;
}

void hash_delete(hash_id hash, void *value)
{
    unsigned value_to_erase = hash->hash_func(value) % hash->reserved;
    unsigned value_to_move;

    // Поиск удаляемого значения.
    while (hash->data[value_to_erase] != value) {
        ASSERT(hash->data[value_to_erase] != NULL);
        value_to_erase = INDEX_WRAP(value_to_erase);
    }

    value_to_move = INDEX_WRAP(value_to_erase);

    // Если следующая ячейка должна быть на месте текущей, передвигаем её.
    while (hash->data[value_to_move] &&
            hash->hash_func(hash->data[value_to_move]) % hash->reserved == value_to_erase) {
        hash->data[value_to_erase] = hash->data[value_to_move];

        value_to_erase  = value_to_move;
        value_to_move   = INDEX_WRAP(value_to_move);
    }

    // Удаление.
    hash->size--;
    hash->data[value_to_erase] = NULL;
}

unsigned int hash_get_count(hash_id hash)
{
    return hash->reserved;
}

void ** hash_get_items(hash_id hash)
{
    return hash->data;
}

