
#ifndef SYMBOL_TABLE_H__INCLUDED
#define SYMBOL_TABLE_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


typedef struct data_type_decl   data_type;
typedef struct initializer_decl initializer;


typedef enum symbol_code_decl {
    sym_unknown,
    sym_variable,
    sym_field,
    sym_struct,
    sym_union,
    sym_function,
    sym_typedef,
} symbol_code;

typedef struct symbol_decl {
    const char *        sym_name;           // текстовое имя идентификатора
    symbol_code         sym_code;           // класс идентификатора - по идее, должны быть независимые неймспейсы
    data_type *         sym_type;           // тип символа
    BOOL                sym_is_local :1;    // TRUE для локальных и формальных параметров, FALSE для глобальнях
    int                 sym_offset;         // смещение в стеке - используется кодогенератором
    initializer *       sym_init;           // инициализатор - используется парсером
    int                 sym_usage_count;    // счётчик использования в коде - используется кодогенератором
    struct symbol_decl *sym_next;           // указатель на следующий элемент, для списков
} symbol;

typedef struct symbol_list_decl {
    symbol *        list_first;
    symbol *        list_last;
} symbol_list;


void            symbol_init_table               (void);

symbol *        symbol_lookup                   (const char *str, int len);
symbol *        symbol_create_variable          (symbol *sym);
symbol *        symbol_create_unnamed           (const char *default_name, symbol_code code, data_type *type);
symbol *        symbol_create_temporary         (data_type *type);
symbol *        symbol_unhide                   (symbol *sym);
void            symbol_delete_hidden            (symbol *orig, symbol *hidden);
void            symbol_free                     (symbol *sym, BOOL weak);
symbol *        symbol_remove_from_table        (symbol *sym, BOOL discard_token);
void            symbol_transform_to_typedef     (symbol *sym);

symbol_list *   symbol_create_list              (symbol *sym);
symbol_list *   symbol_push_back                (symbol_list *sym_list, symbol *next);


#else
#error Header symbol_table.h duplicated.
#endif // SYMBOL_TABLE_H__INCLUDED
