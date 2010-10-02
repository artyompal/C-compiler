
#include "common.h"
#include "symbol_table.h"


static hash_id symbol_table;


// TODO: find better hash function?
static unsigned int _symbol_hash(symbol *key)
{
    unsigned int res = 0;
    const char *name = key->sym_name;

    while (*name) {
        res = res * 33 + *name++;
    }

    return res;
}

static int _symbol_equal(symbol *key1, symbol *key2)
{
    return !strcmp(key1->sym_name, key2->sym_name);
}


void symbol_init_table(void)
{
    symbol_table = hash_init((hash_function) _symbol_hash, (hash_equal_function) _symbol_equal);
}


// string for _symbol_lookup must be allocated via allocator_persistent_pool and must be on the top
static symbol *_symbol_lookup(const char *str)
{
    symbol *sym     = allocator_alloc(allocator_persistent_pool, sizeof(symbol));
    symbol *found;

    memset(sym, 0, sizeof(symbol));
    sym->sym_name   = str;
    sym->sym_code   = sym_unknown;

    found = hash_find(symbol_table, sym);
    if (found) {
        symbol_free(sym, FALSE);
        return found;
    } else {
        return sym;
    }
}

symbol *symbol_lookup(const char *str, int len)
{
    char *copy = allocator_alloc(allocator_persistent_pool, len + 1);
    memcpy(copy, str, len);
    copy[len] = '\0';
    return _symbol_lookup(copy);
}


symbol *symbol_unhide(symbol *sym)
{
    char *unhidden_name;
    symbol *unhidden;

    if (sym->sym_name[0] != '@') {
        return NULL;
    }

    unhidden_name = allocator_alloc(allocator_persistent_pool, strlen(sym->sym_name));
    strcpy(unhidden_name, sym->sym_name + 1);

    unhidden = _symbol_lookup(unhidden_name); // skip @
    ASSERT(unhidden);
    return unhidden;
}

void symbol_delete_hidden(symbol *orig, symbol *hidden)
{
    ASSERT(orig->sym_name[0] == '@');
    ASSERT(hidden->sym_name[0] != '@');

    orig->sym_name = hidden->sym_name;
    symbol_remove_from_table(hidden, FALSE);   // must not free memory under sym_name!

    hash_insert(symbol_table, orig);
}

symbol *symbol_create_variable(symbol *sym)
{
    char *hidden_symbol_name;
    symbol *hidden_symbol;

    if (sym->sym_code != sym_unknown) {
        if (sym->sym_code == sym_function) {
            // FIXME: we only allow override functions. extern declarations and typedefs are not supported yet.
            // We create special hidden symbol and later check types matching.
            hidden_symbol_name = allocator_alloc(allocator_persistent_pool, strlen(sym->sym_name) + 2);
            sprintf(hidden_symbol_name, "@%s", sym->sym_name);

            hidden_symbol = _symbol_lookup(hidden_symbol_name);
            // TODO: more flexible behavior? symbols can have multiple duplications
            ASSERT(hidden_symbol->sym_code == sym_unknown);
            return hidden_symbol;
        } else {
            aux_error("identifier '%s' is already defined", sym->sym_name);
            symbol_free(sym, TRUE);
            return NULL;
        }
    } else {
        hash_insert(symbol_table, sym);
        sym->sym_code = sym_variable;
        return sym;
    }
}

symbol *symbol_create_unnamed(const char *default_name, symbol_code code, data_type *type)
{
    static int unique_id = 0;
    char buf[64], *name;
    symbol *sym;

    _snprintf(buf, sizeof(buf) - 1, "__unnamed_%s_%d", default_name, unique_id++);
    buf[sizeof(buf) - 1] = '\0';
    name            = allocator_alloc(allocator_persistent_pool, strlen(buf) + 1);
    strcpy(name, buf);

    sym             = allocator_alloc(allocator_persistent_pool, sizeof(symbol));
    memset(sym, 0, sizeof(symbol));

    sym->sym_name   = name;
    sym->sym_code   = code;
    sym->sym_type   = type;

    ASSERT(!hash_find(symbol_table, sym));
    hash_insert(symbol_table, sym);
    return sym;
}

symbol *symbol_create_temporary(data_type *type)
{
    static int unique_id = 0;
    char buf[64], *name;
    symbol *sym;

    _snprintf(buf, sizeof(buf) - 1, "__tmp%d", unique_id++);
    buf[sizeof(buf) - 1] = '\0';
    name            = allocator_alloc(allocator_persistent_pool, strlen(buf) + 1);
    strcpy(name, buf);

    sym             = allocator_alloc(allocator_persistent_pool, sizeof(symbol));
    memset(sym, 0, sizeof(symbol));

    sym->sym_name   = name;
    sym->sym_code   = sym_variable;
    sym->sym_type   = type;

    ASSERT(!hash_find(symbol_table, sym));
    hash_insert(symbol_table, sym);
    return sym;
}


void symbol_free(symbol *sym, BOOL weak)
{
    if (weak) {
        allocator_free(allocator_persistent_pool, (void*)sym, sizeof(symbol));
        allocator_free(allocator_persistent_pool, (void*)sym->sym_name, strlen(sym->sym_name) + 1);
    } else {
        allocator_free(allocator_persistent_pool, (void*)sym, sizeof(symbol));
        allocator_free(allocator_persistent_pool, (void*)sym->sym_name, strlen(sym->sym_name) + 1);
    }
}

symbol *symbol_remove_from_table(symbol *sym, BOOL discard_token)
{
    hash_delete(symbol_table, sym);

    if (discard_token) {
        symbol_free(sym, TRUE);
        sym = NULL;
    }

    return sym;
}

void symbol_transform_to_typedef(symbol *sym)
{
    sym->sym_code = sym_typedef;
}


symbol_list *symbol_create_list(symbol *sym)
{
    symbol_list *res;

    if (!sym) { return NULL; }

    res = allocator_alloc(allocator_persistent_pool, sizeof(symbol_list));
    res->list_first = sym;
    res->list_last  = sym;
    return res;
}

symbol_list *symbol_push_back(symbol_list *sym_list, symbol *next)
{
    if (!sym_list) { return NULL; }

    sym_list->list_last->sym_next = next;
    sym_list->list_last = next;
    return sym_list;
}

