
#include "common.h"


BOOL option_no_codegen          = FALSE;
BOOL option_no_regalloc         = FALSE;
BOOL option_no_copy_opt         = FALSE;
BOOL option_no_basic_opt        = FALSE;
BOOL option_enable_optimization = FALSE;
BOOL option_no_inline           = FALSE;
BOOL option_xml_dump            = FALSE;
int  option_max_inline_insn     = 100;

char option_output_filename[MAX_PATH];


//
// Отслеживание текущего файла/строки для сообщений об ошибках.
//

int current_line         = 0;
const char *current_file = NULL;


void aux_set_current_line(int line)
{
    current_line = line;
}

void aux_increment_current_line(void)
{
    current_line++;
}

int aux_get_current_line(void)
{
    return current_line;
}

void aux_set_current_file(const char *file)
{
    current_file = file;
}

const char *aux_get_current_file(void)
{
    return current_file;
}


//
// Выдача сообщений об ошибках.
//

static int errors_count     = 0;
static int warnings_count   = 0;


void aux_error(const char *text, ...)
{
    va_list args;

    va_start(args, text);
    printf("%s:%d: error: ", current_file, current_line);
    vprintf(text, args);
    _fputchar('\n');
    va_end(args);

    errors_count++;
}

void aux_warning(const char *text, ...)
{
    va_list args;

    va_start(args, text);
    printf("%s:%d: warning: ", current_file, current_line);
    vprintf(text, args);
    _fputchar('\n');
    va_end(args);

    warnings_count++;
}

void aux_fatal_error(const char *text, ...)
{
    va_list args;

    if (current_file) {
        printf("%s:%d: fatal error: ", current_file, current_line);
    } else {
        printf("fatal error: ");
    }

    va_start(args, text);
    vprintf(text, args);
    _fputchar('\n');
    va_end(args);

    errors_count++;

#ifdef _DEBUG
    __asm int 3;
#else
    exit(0);
#endif
}

void yyerror(const char *text)
{
#ifdef _DEBUG
    printf("%s:%d: %s\n", current_file, current_line, text);
#endif
}

void aux_reset_errors_count(void)
{
    errors_count = warnings_count = 0;
}

int aux_get_errors_count(void)
{
    return errors_count;
}

int aux_get_warnings_count(void)
{
    return warnings_count;
}


#ifdef _DEBUG
__declspec(noreturn) void aux_assertion_failed(const char *file, int line, const char *cond)
{
    aux_fatal_error("internal compiler error in %s:%d: '%s'\n", file, line, cond);
}
#else
__declspec(noreturn) void aux_assertion_failed(const char *file, int line, const char *cond)
{
    aux_fatal_error("internal compiler error in %s:%d\n", file, line);
}
#endif

__declspec(noreturn) void aux_unimplemented_error(const char *text)
{
    aux_fatal_error("feature is not implemented yet: %s", text);
}


void aux_replace_file_extension(char *dst, const char *path, const char *extension)
{
    char *slash, *dot;

    strcpy(dst, path);

    slash = strrchr(dst, '\\');
    if (slash) dst = slash + 1;

    dot = strrchr(dst, '.');
    if (dot) *dot = '\0';

    strcat(dst, extension);
}


void aux_sort_int(int *arr, int count)
{
    int i, j, m, k, tmp;

    if (count < 2) {
        return;
    }

    i = 0;
    j = count - 1;
    m = count / 2;
    k = arr[m];

    do {
        while (arr[i] < k) i++;
        while (arr[j] > k) j--;

        if (i <= j) {
            tmp = arr[i], arr[i] = arr[j], arr[j] = tmp;
            i++, j--;
        }
    } while (i <= j);

    aux_sort_int(arr, j + 1);
    aux_sort_int(arr + i, count - i);
}

int aux_unique_int(int *arr, int count)
{
    int *dst, *src;

    for (dst = arr, src = arr; src < arr + count; src++, dst++) {
        *dst = *src;

        while (src + 1 < arr + count && src[0] == src[1]) {
            src++;
        }
    }

    return (dst - arr);
}

int _binary_search(const int *arr, int count, int key)
{
    int base = 0, m;

    while (count > 1) {
        m = count/2;

        if (arr[base + m] == key) {
            return base + m;
        } else if (arr[base + m] > key) {
            count = m;
        } else {
            count -= m, base += m;
        }
    }

    return base;
}

int aux_binary_search(const int *arr, int count, int key)
{
    int pos = _binary_search(arr, count, key);

    if (count == 0) {
        return -1;
    } else {
        return (arr[pos] == key ? pos : -1);
    }
}

