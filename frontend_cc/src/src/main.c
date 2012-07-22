
#include "common.h"
#include "xml_dump.h"
#include "unit.h"
#include "x86_data.h"
#include "x86_text_output.h"


#define ENABLE_YY_LOG 0


struct option_decl {
    const char *    option_name;
    BOOL *          flag_address;
    const char *    comment;
} options[] = {
    {"nocodegen",           &option_no_codegen,             "disable any code generation"},
    {"noregalloc",          &option_no_regalloc,            "don't replace pseudo-registers with real registers"},
    {"nobasicopt",          &option_no_basic_opt,           "don't optimize well-known sequences after code generation"},
    {"optimize",            &option_enable_optimization,    "enables code optimization"},
    {"sse2",                &option_sse2,                   "enables SSE2 code generation"},
    {"noinline",            &option_no_inline,              "disables functions inlining"},
    {"xmldump",             &option_xml_dump,               "dumps XML syntax tree"},
    {"output-file-name",    0,                              "lets to specify the name of the output file"},
    {NULL, NULL, NULL},
};

const char *next_option;


static void _print_version(void)
{
    puts("cc4x86 version 0.05");
}

static void _print_help(const char *program_name)
{
    const char *p;
    struct option_decl *opt;

    _print_version();

    p = strrchr(program_name, '\\');
    p = (p) ? p + 1 : program_name;

    printf("Usage: %s [--help] [--version] [options] <files>\n\nPossible options:\n", p);

    for (opt = options; opt->option_name; opt++) {
        printf("    --%-30s%s\n", opt->option_name, opt->comment);
    }
}

static void _compile_unit(const char *filename)
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

    if (option_output_filename[0] == '\0')
        aux_replace_file_extension(option_output_filename, filename, ".asm");

    text_output_begin_unit();

    if (yyparse() != 0) {
        aux_fatal_error("unrecoverable syntax error");
    }

    if (option_xml_dump) {
        debug_dump_unit(filename);
    }

    if (!option_no_codegen && !aux_get_errors_count()) {
        unit_codegen();
    }

    option_output_filename[0] = '\0';
    text_output_end_unit();

    allocator_term();
    fclose(source_file);

    printf("%s (%d errors, %d warnings)\n", (!aux_get_errors_count() ? "successful" : "failed"),
        aux_get_errors_count(), aux_get_warnings_count());
    exit(!aux_get_errors_count() ? EXIT_SUCCESS : EXIT_FAILURE);
}

static void _interpret_option(const char *option)
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
        _print_help(argv[0]);
    } else if (!strcmp(argv[1], "--version")) {
        _print_version();
    } else {
        for (i = 1; i < argc; i++) {
            if (!strcmp(argv[i], "--output-file-name")) {
                if (i < argc-1) {
                    strcpy(option_output_filename, argv[i+1]);
                    i++;
                }
            } else if (argv[i][0] == '-') {
                _interpret_option(argv[i]);
            } else {
                _compile_unit(argv[i]);
            }
        }
    }

    return 0;
}

