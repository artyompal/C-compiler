
#ifndef ALLOCATOR_H__INCLUDED
#define ALLOCATOR_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


// Все выделяемые указатели выравнены на 4 байта.

typedef enum allocator_pool_decl {
    allocator_per_function_pool,    // пул на функцию: временная информация кодогенератора
    allocator_global_pool,          // глобальный пул: символы, типы, сгенерированный код
} allocator_pool;


void    allocator_init              (void);
void    allocator_finish_function   (void);
void    allocator_term              (void);

void *  allocator_alloc             (allocator_pool pool, int size);
void    allocator_free              (allocator_pool pool, void *ptr, int size);

char *  allocator_make_string       (allocator_pool pool, const char *str, int len);


#else
#error Header allocator.h duplicated.
#endif // ALLOCATOR_H__INCLUDED
