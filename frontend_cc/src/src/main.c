
#include "common.h"
#include "debug.h"
#include "unit.h"
#include "x86_data.h"
#include "x86_text_output.h"


#define ENABLE_YY_LOG (0)


struct option_decl {
    const char *    option_name;
    BOOL *          flag_address;
    const char *    comment;
} options[] = {
    {"debug_disable_codegen",   &option_debug_disable_codegen,      "disable any code generation"},
    {"debug_disable_regalloc",  &option_debug_disable_regalloc,     "don't replace pseudo-registers with real registers"},
    {"debug_disable_basic_opt", &option_debug_disable_basic_opt,    "don't optimize well-known sequences after code generation"},
    {"optimize",                &option_enable_optimization,        "enables code optimization"},
    {NULL, NULL, NULL},
};


static void print_version(void)
{
    puts("CC version 0.04 - proof of concept.");
}

static void print_help(const char *program_name)
{
    const char *p;
    struct option_decl *opt;

    print_version();

    p = strrchr(program_name, '\\');
    p = (p) ? p + 1 : program_name;

    printf("Usage: %s [--help] [--version] [options] <files>\n\nPossible options:\n", p);

    for (opt = options; opt->option_name; opt++) {
        printf("    --%-30s%s\n", opt->option_name, opt->comment);
    }
}


static void compile_unit(const char *filename)
{
    FILE *source_file;
    aux_reset_errors_count();

    source_file = fopen(filename, "rb");
    if (!source_file) {
        aux_fatal_error("failed to open file '%s'", filename);
    }

    printf("compiling file '%s'...\n", filename);

    aux_set_current_file(filename);
    aux_set_current_line(1);

#if ENABLE_YY_LOG && defined(_DEBUG)
    yydebug = 1;
#endif // ENABLE_YY_LOG && defined(_DEBUG)


    yyin = source_file;

    allocator_init();
    symbol_init_table();
    x86data_init();
    text_output_begin_unit(filename);

    if (yyparse() != 0) {
        aux_fatal_error("unrecoverable syntax error");
    }

#ifdef _DEBUG
    debug_dump_unit(filename);
#endif // _DEBUG

    if (!option_debug_disable_codegen && !aux_get_errors_count()) {
        unit_codegen();
    }

    text_output_end_unit();
    allocator_reset_all();
    fclose(source_file);

    printf("%s (%d errors, %d warnings)\n", (!aux_get_errors_count() ? "successful" : "failed"),
        aux_get_errors_count(), aux_get_warnings_count());
    exit(!aux_get_errors_count() ? EXIT_SUCCESS : EXIT_FAILURE);
}


void interpret_option(const char *option)
{
    struct option_decl *opt;

    if (option[0] == '-' && option[1] == '-') {
        for (opt = options; opt->option_name; opt++) {
            if (!strcmp(option + 2, opt->option_name)) {
                *opt->flag_address = TRUE;
                return;
            }
        }
    }

    aux_fatal_error("invalid command-line option: '%s'", option);
}

int main(int argc, const char *argv[])
{
    int i;

    if (argc == 1 || !strcmp(argv[1], "--help")) {
        print_help(argv[0]);
    } else if (!strcmp(argv[1], "--version")) {
        print_version();
    } else {
        for (i = 1; i < argc; i++) {
            if (argv[i][0] == '-') {
                interpret_option(argv[i]);
            } else {
                compile_unit(argv[i]);
            }
        }
    }

    return 0;
}

