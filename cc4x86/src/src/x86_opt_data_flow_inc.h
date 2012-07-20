

typedef struct basic_block_decl {           // структура базового блока:
    x86_instruction     *block_leader;      // первая инструкция блока, чаще всего метка
    int                 block_length;       // число инструкций в блоке
//    int                 block_base_index;   // номер первой инструкции блока
    x86_instruction     *block_last_insn;   // кешированный указатель на последнюю инструкцию
} basic_block;

typedef struct basic_blocks_vector_decl {   // вектор базовых блоков:
    basic_block         *blocks_base;       // адрес начала
    int                 blocks_count;       // число элементов
} basic_blocks_vector;

typedef struct set_decl {                   // множество в битовом представлении:
    unsigned            *set_base;          // адрес начала
    int                 set_count;          // число элементов в множестве, т.е. число битов в массиве
} set;

typedef struct set_vector_decl {            // вектор множеств:
    set                 *vec_base;          // адрес начала
    int                 vec_count;          // количество множеств
} set_vector;

typedef struct insn_vector_decl {           // вектор инструкций:
    x86_instruction     **insn_base;        // адрес начала
    int                 insn_count;         // количество инструкций
} insn_vector;


#define SET_SIZE_IN_BYTES(X)	((((X)+7)/8+3)&~3)
#define SET_SIZE_IN_DWORDS(X)	((((X)+7)/8+3)/4)

#define BIT_TEST(SET, BIT)		((SET).set_base[(BIT)/32] & (1 << (BIT)%32))
#define BIT_RAISE(SET, BIT)		((SET).set_base[(BIT)/32] |= (1 << (BIT)%32))
#define BIT_CLEAR(SET, BIT)		((SET).set_base[(BIT)/32] &= (1 << ~(BIT)%32))

#define SET_ALLOCA(S, N)        do { (S).set_base = alloca(SET_SIZE_IN_BYTES(N)); (S).set_count = (N); } while (0)


//
// Примитивы для работы над множествами.
static void set_alloc(set *s, int count)
{
    s->set_base     = allocator_alloc(allocator_per_function_pool, SET_SIZE_IN_BYTES(count));
    s->set_count    = count;
}

static void set_clear_to_zeros(set *s)
{
    int i;

    for (i = 0; i < SET_SIZE_IN_DWORDS(s->set_count); i++)
        s->set_base[i] = 0;
}

static void set_clear_to_ones(set *s)
{
    int i;

    for (i = 0; i < SET_SIZE_IN_DWORDS(s->set_count); i++)
        s->set_base[i] = 0xffffffff;

    if (s->set_count % 32 != 0)
        s->set_base[s->set_count/32] &= (1 << (s->set_count % 32)) - 1;
}

static void set_swap(set *a, set *b)
{
    set tmp;

    tmp = *a, *a = *b, *b = tmp;
}

static void set_assign(set *a, set *b)
{
    int i;

    ASSERT(a->set_count == b->set_count);

    for (i = 0; i < SET_SIZE_IN_DWORDS(a->set_count); i++) {
        a->set_base[i] = b->set_base[i];
    }
}

static void set_unite(set *a, set *b)
{
    int i;

    ASSERT(a->set_count == b->set_count);

    for (i = 0; i < SET_SIZE_IN_DWORDS(a->set_count); i++) {
        a->set_base[i] |= b->set_base[i];
    }
}

static void set_intersect(set *a, set *b)
{
    int i;

    ASSERT(a->set_count == b->set_count);

    for (i = 0; i < SET_SIZE_IN_DWORDS(a->set_count); i++) {
        a->set_base[i] &= b->set_base[i];
    }
}

static void set_subtract(set *a, set *b)
{
    int i;

    ASSERT(a->set_count == b->set_count);

    for (i = 0; i < SET_SIZE_IN_DWORDS(a->set_count); i++) {
        a->set_base[i] &= ~b->set_base[i];
    }
}

static BOOL set_equal(set *a, set *b)
{
    int i;

    ASSERT(a->set_count == b->set_count);

    for (i = 0; i < SET_SIZE_IN_DWORDS(a->set_count); i++) {
        if (a->set_base[i] != b->set_base[i]) return FALSE;
    }

    return TRUE;
}


static void setvec_resize(set_vector *setvec, int vec_size, int set_size)
{
    int i;

    setvec->vec_count   = vec_size;
    setvec->vec_base    = allocator_alloc(allocator_per_function_pool, vec_size * sizeof(set));

    for (i = 0; i < vec_size; i++)
        set_alloc(&setvec->vec_base[i], set_size);
}

