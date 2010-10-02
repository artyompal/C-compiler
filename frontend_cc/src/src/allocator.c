
#include <malloc.h>
#include "common.h"


typedef struct {
    char    *fragment;
    int     fragment_sz;
    int     top;
} pool_desc;


static pool_desc _persistent_allocator, _temporary_allocator;


static __declspec(noreturn) void _out_of_memory(void)
{
    aux_fatal_error("out of memory");
}

static void _init_pool(pool_desc *pool, int _fragment_sz)
{
    pool->fragment_sz = _fragment_sz;
    pool->top         = 0;

    pool->fragment = (char*) _aligned_malloc(_fragment_sz, 4);
    if (!pool->fragment) {
        _out_of_memory();
    }
}

static void _term_pool(pool_desc *pool)
{
    _aligned_free(pool->fragment);
}

static pool_desc *_select_pool(allocator_pool pool)
{
    if (pool == allocator_temporary_pool) {
        return &_temporary_allocator;
    } else if (pool == allocator_persistent_pool) {
        return &_persistent_allocator;
    } else {
        ASSERT(FALSE);
    }
}


void allocator_init(void)
{
    _init_pool(&_persistent_allocator, 0x10000);
    _init_pool(&_temporary_allocator, 0x10000);
}

void allocator_term(void)
{
    _term_pool(&_temporary_allocator);
    _term_pool(&_persistent_allocator);
}


// TODO: linked chain of fixed size allocator blocks.

static void _alloc_fragment(pool_desc *p)
{
    p->top      = 0;
    p->fragment = (char*) _aligned_malloc(p->fragment_sz, 4);
    // TODO: VirtualAlloc instead of _aligned_malloc.

    if (!p->fragment) {
        _out_of_memory();
    }
}


void *allocator_alloc(allocator_pool pool, int size)
{
    pool_desc *p = _select_pool(pool);
    void *res;

    size = (size + 3) &~ 3;

    if (p->top + size > p->fragment_sz) {
        _alloc_fragment(p);
    }

    res = (void*)(p->fragment + p->top);
    p->top += size;
    return res;
}

void allocator_free(allocator_pool pool, void *ptr, int size)
{
    pool_desc *p = _select_pool(pool);
    char *next_top, *cur_top;

    size        = (size + 3) &~ 3;
    next_top    = (char*) ptr + size;
    cur_top     = p->fragment + p->top;

    ASSERT(next_top <= cur_top);  // it's impossible to the top to be below pointer

    if (next_top == cur_top) {
        p->top -= size;
    }
}

char *allocator_make_string(allocator_pool pool, const char *str, int len)
{
    char *res = allocator_alloc(pool, len + 1);
    memcpy(res, str, len);
    res[len] = '\0';
    return res;
}


static void _reset_allocator(pool_desc *unused)
{
    // TODO: implement _reset_allocator()
}

void allocator_reset_temporary(void)
{
    _reset_allocator(&_temporary_allocator);
}

void allocator_reset_all(void)
{
    _reset_allocator(&_temporary_allocator);
    _reset_allocator(&_persistent_allocator);
}

