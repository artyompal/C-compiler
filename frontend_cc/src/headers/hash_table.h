
#ifndef HASH_TABLE_H__INCLUDED
#define HASH_TABLE_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


typedef struct hash_table_decl *hash_id;

typedef unsigned int (*hash_function)(void *key);
typedef BOOL (*hash_equal_function)(void *key1, void *key2);


hash_id         hash_init       (hash_function hash_func, hash_equal_function equal_func);
void            hash_clear      (hash_id hash);
void *          hash_find       (hash_id hash, void *value);
void            hash_insert     (hash_id hash, void *value);
void            hash_delete     (hash_id hash, void *value);
unsigned int    hash_get_count  (hash_id hash);
void **         hash_get_items  (hash_id hash);


#else
#error Header hash_table.h duplicated.
#endif // HASH_TABLE_H__INCLUDED
