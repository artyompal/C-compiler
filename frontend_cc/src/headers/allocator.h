
#ifndef ALLOCATOR_H__INCLUDED
#define ALLOCATOR_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


// All allocated addresses must be aligned at 4 bytes.

typedef enum allocator_pool_decl {
    allocator_temporary_pool,
    allocator_persistent_pool,
} allocator_pool;


void    allocator_init              (void);
void    allocator_term              (void);

void *  allocator_alloc             (allocator_pool pool, int size);
void    allocator_free              (allocator_pool pool, void *ptr, int size);

char *  allocator_make_string       (allocator_pool pool, const char *str, int len);

void    allocator_reset_temporary   (void);
void    allocator_reset_all         (void);


#else
#error Header allocator.h duplicated.
#endif // ALLOCATOR_H__INCLUDED
