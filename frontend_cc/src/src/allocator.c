
#include <malloc.h>
#include "common.h"


typedef struct fragment_desc_decl {
    struct fragment_desc_decl *next;
    char            data[1];
} fragment_desc;

typedef struct {
    fragment_desc   *first_fragment;
    fragment_desc   *last_fragment;
    int             fragment_sz;
    int             top;
} pool_desc;


static pool_desc _global_allocator, _per_function_allocator;


static __declspec(noreturn) void _out_of_memory(void)
{
    aux_fatal_error("out of memory");
}

static void _init_pool(pool_desc *pool, int _fragment_sz)
{
    pool->fragment_sz = _fragment_sz - sizeof(fragment_desc *);
    pool->top         = 0;

    pool->first_fragment = pool->last_fragment = (fragment_desc *) _aligned_malloc(_fragment_sz, 4);

    if (!pool->first_fragment) {
        _out_of_memory();
    }

    memset(pool->last_fragment->data, 0xCD, pool->fragment_sz);
    pool->first_fragment->next = NULL;
}

static void _term_pool(pool_desc *pool)
{
    fragment_desc *current, *next;

    for (current = pool->first_fragment; current; current = next) {
        next = current->next;
        _aligned_free(current);
    }
}

static pool_desc *_select_pool(allocator_pool pool)
{
    if (pool == allocator_per_function_pool) {
        return &_per_function_allocator;
    } else if (pool == allocator_global_pool) {
        return &_global_allocator;
    } else {
        ASSERT(FALSE);
    }
}


void allocator_init(void)
{
    _init_pool(&_global_allocator, 0x10000);
    _init_pool(&_per_function_allocator, 0x10000);
}

void allocator_term(void)
{
    _term_pool(&_per_function_allocator);
    _term_pool(&_global_allocator);
}


static void _alloc_fragment(pool_desc *pool)
{
    fragment_desc *new_frag;

    if (pool->last_fragment->next) {
        pool->last_fragment     = pool->last_fragment->next;
        pool->top               = 0;
    }

    new_frag = (fragment_desc *) _aligned_malloc(pool->fragment_sz + sizeof(fragment_desc *), 4);

    if (!new_frag) {
        _out_of_memory();
    }

    memset(new_frag->data, 0xCD, pool->fragment_sz);

    pool->top                   = 0;
    pool->last_fragment->next   = new_frag;
    pool->last_fragment         = new_frag;
    new_frag->next              = NULL;
}


void *allocator_alloc(allocator_pool pool, int size)
{
    pool_desc *p = _select_pool(pool);
    char *res;

    size = (size + 3) &~ 3;

    if (p->top + size > p->fragment_sz) {
        _alloc_fragment(p);
    }

    res = (p->last_fragment->data + p->top);
    p->top += size;

    return (char *) res;
}

void allocator_free(allocator_pool pool, void *ptr, int size)
{
    pool_desc *p = _select_pool(pool);
    char *next_top, *cur_top;

    size        = (size + 3) &~ 3;

    if (size > p->top) {
        return;
    }

    next_top    = (char*) ptr + size;
    cur_top     = p->last_fragment->data + p->top;

    ASSERT(next_top <= cur_top);

    if (next_top == cur_top) {
        p->top -= size;
        memset(p->last_fragment->data + p->top, 0xBB, size);
    }
}

char *allocator_make_string(allocator_pool pool, const char *str, int len)
{
    char *res = allocator_alloc(pool, len + 1);
    memcpy(res, str, len);
    res[len] = '\0';
    return res;
}


static void _reset_allocator(pool_desc *pool)
{
    fragment_desc *current;

    for (current = pool->first_fragment; current; current = current->next) {
        memset(current->data, 0xDD, pool->fragment_sz);
    }

    pool->last_fragment = pool->first_fragment;
    pool->top           = 0;
}

void allocator_finish_function(void)
{
    _reset_allocator(&_per_function_allocator);
}

void allocator_reset_all(void)
{
    _reset_allocator(&_per_function_allocator);
    _reset_allocator(&_global_allocator);
}

