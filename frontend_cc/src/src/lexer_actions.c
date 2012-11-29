
#include "common.h"
#include "parser.h"
#include "parser_codes.h"
#include "keywords.h"
#include "x86_data.h"


void token_whitespace(const char *token, int token_len)
{
    int i;

    for (i = 0; ; i++) {
        for (; token[i] != '\n'; i++) {
            if (i == token_len) {
                return;
            }
        }

        aux_increment_current_line();
    }
}

int token_identifier(const char *token, int token_len)
{
    int keyword = keyword_lookup(token, token_len);
    symbol *sym;

    if (keyword != lxm_identifier) {
        return keyword;
    }

    sym = symbol_lookup(token, token_len);

    if (sym->sym_code == code_sym_type) {
        yylval.type = sym->sym_type;
        return lxm_typedef_name;
    } else {
        yylval.sym = sym;
        return lxm_identifier;
    }
}

static long long str_to_signed(const char *token, const char **endptr, int radix)
{
    long long res = 0;

    while (*token >= '0' && *token <= '9' || *token >= 'A' && *token <= 'F'
        || *token >= 'a' && *token <= 'f') {
            int tok     = *token | 0x20;
            int base    = (tok >= 'a' ? 'a'-10 : '0');

            res = radix * res + tok - base;
            token++;
    }

    *endptr = token;
    return res;
}

static unsigned long long str_to_unsigned(const char *token, const char **endptr, int radix)
{
    unsigned long long res = 0;

    while (*token >= '0' && *token <= '9' || *token >= 'A' && *token <= 'F'
        || *token >= 'a' && *token <= 'f') {
            int tok     = *token | 0x20;
            int base    = (tok >= 'a' ? 'a'-10 : '0');

            res = radix * res + tok - base;
            token++;
    }

    *endptr = token;
    return res;
}

int token_integer_literal(const char *token, int unused)
{
    char *endptr;
    int radix               = (*token == '0' ? (token[1] == 'x' ? 16 : 8) : 10);
    long long sres          = str_to_signed((radix == 16 ? token+2 : token), &endptr, radix);
    unsigned long long ures = str_to_unsigned((radix == 16 ? token+2 : token), &endptr, radix);
    long long val;
    data_type_code type     = code_type_int;

    // парсим суффиксы ulUL и выводим тип
    while (*endptr) {
        if (*endptr == 'u' || *endptr == 'U')
            if (type == code_type_int)
                type = code_type_long;
            else if (type == code_type_long)
                type = code_type_unsigned_long;
            else if (type == code_type_long_long)
                type = code_type_unsigned_long_long;
            else
                aux_error("invalid integer number suffix");
        else if (*endptr == 'l' || *endptr == 'L')
            if (type == code_type_int)
                type = code_type_long;
            else if (type == code_type_unsigned_int)
                type = code_type_unsigned_long;
            else if (type == code_type_long)
                type = code_type_long_long;
            else if (type == code_type_unsigned_long)
                type = code_type_unsigned_long_long;
            else
                aux_error("invalid integer number suffix");
        else
            ASSERT(FALSE);

        endptr++;
    }

    val = (TYPE_IS_UNSIGNED(type_create_arithmetic(type)) ? ures : sres);
    yylval.expr = expr_create_from_integer(val, type_create_arithmetic(type));
    return lxm_constant;
}

int token_float_literal(const char *token, int unused)
{
    char *endptr;
    double val          = strtod(token, &endptr);
    data_type_code type = code_type_double;

    // парсим суффиксы lfLF и выводим тип
    while (*endptr) {
        if (*endptr == 'f' || *endptr == 'F')
            if (type == code_type_double)
                type = code_type_float;
            else
                aux_error("invalid floating number suffix");
        else if (*endptr == 'l' || *endptr == 'L')
            if (type == code_type_double)
                type = code_type_long_double;
            else
                aux_error("invalid floating number suffix");
        else
            ASSERT(FALSE);

        endptr++;
    }

    yylval.expr = expr_create_from_float(val, type_create_arithmetic(type));
    return lxm_constant;
}


static BOOL isodigit(char c)
{
    return (c >= '0' && c <= '7');
}

static void _parse_character(const char *str, int *length, char *value)
{
    char *str_end;
    int len = 1;

    if (*str != '\\') {
        *value  = *str;
    } else if (str[1] == 'x') {
        *value  = (char) strtol(str + 2, &str_end, 16);
        len     = str_end - str;
    } else if (isodigit(str[1])) {
        *value  = (char) strtol(str + 1, &str_end, 8);
        len     = str_end - str;
    } else {
        len     = 2;

        if (str[1] == 'n') {
            *value = '\n';
        } else if (str[1] == 't') {
            *value = '\t';
        } else if (str[1] == 'v') {
            *value = '\v';
        } else if (str[1] == 'b') {
            *value = '\b';
        } else if (str[1] == 'r') {
            *value = '\r';
        } else if (str[1] == 'f') {
            *value = '\n';
        } else if (str[1] == 'a') {
            *value = '\n';
        } else if (str[1] == '\\') {
            *value = '\\';
        } else if (str[1] == '\?') {
            *value = '?';
        } else if (str[1] == '\'') {
            *value = '\'';
        } else if (str[1] == '\"') {
            *value = '\"';
        } else {
            aux_warning("unknown escape sequence: \\%c(\\x%02x)", str[1], str[1]);
            *value = str[1];
        }
    }

    *length = len;
}

int token_string_literal(const char *token, int token_len)
{
    char value;
    int i, j, count = 0, length;
    char *data;

    for (i = 1; token[i] != '"'; i += length, count++) {
        _parse_character(token + i, &length, &value);
    }

    count++;    // место для завершающего нуля
    data    = allocator_alloc(allocator_global_pool, count);

    for (i = 1, j = 0; token[i] != '"'; i += length, j++) {
        _parse_character(token + i, &length, &data[j]);
    }

    ASSERT(j == count - 1);
    data[j] = '\0';

    yylval.expr = expr_create_from_string(data);
    return lxm_string_literal;
}

int token_character_literal(const char *token, int token_len)
{
    char value;
    int length;

    _parse_character(token+1, &length, &value);
    yylval.expr = expr_create_from_integer(value, type_create_arithmetic(code_type_char));
    return lxm_constant;
}

void token_bad_number(const char *token, int token_len)
{
    char buf[128];
    int len = (token_len < 127 ? token_len : 127);

    memcpy(buf, token, len);
    buf[len] = '\0';
    aux_error("bad number or identifier: '%s'", buf);
}

void token_bad_character(char c)
{
    aux_error("bad character in source: '%c'(\\x%02x)", c, (int)c);
}

void token_bad_literal(void)
{
    aux_error("ill-formed character or string literal");
}

