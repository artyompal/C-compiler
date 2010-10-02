
#include "common.h"
#include "parser.h"
#include "parser_codes.h"
#include "keywords_hash.h"


static struct resword_decl {
    const char  *keyword;
    int         token_code;
} reswords_table[32] = {
    "auto",     lxm_auto,
    "break",    lxm_break,
    "case",     lxm_case,
    "char",     lxm_char,
    "const",    lxm_const,
    "continue", lxm_continue,
    "default",  lxm_default,
    "do",       lxm_do,
    "double",   lxm_double,
    "else",     lxm_else,
    "enum",     lxm_enum,
    "extern",   lxm_extern,
    "float",    lxm_float,
    "for",      lxm_for,
    "goto",     lxm_goto,
    "if",       lxm_if,
    "int",      lxm_int,
    "long",     lxm_long,
    "register", lxm_register,
    "return",   lxm_return,
    "short",    lxm_short,
    "signed",   lxm_signed,
    "sizeof",   lxm_sizeof,
    "static",   lxm_static,
    "struct",   lxm_struct,
    "switch",   lxm_switch,
    "typedef",  lxm_typedef,
    "union",    lxm_union,
    "unsigned", lxm_unsigned,
    "void",     lxm_void,
    "volatile", lxm_volatile,
    "while",    lxm_while,
};


static int equal_keywords(const char *keyword, const char *token, int token_len)
{
    return (!memcmp(keyword, token, token_len) && !keyword[token_len]);
}

int keyword_lookup(const char *token, int token_len)
{
    int hash_code = keywords_hash_function(token, token_len);

    if (hash_code == -1 || !equal_keywords(reswords_table[hash_code].keyword, token, token_len)) {
        return lxm_identifier;
    } else {
        return reswords_table[hash_code].token_code;
    }
}

