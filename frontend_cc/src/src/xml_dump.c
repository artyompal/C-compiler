
#include <stdarg.h>

#include "common.h"
#include "xml_dump.h"
#include "unit.h"


static void _xml_alignment(FILE *file, int alignment)
{
    int i;

    for (i = 0; i < alignment; i++) {
        fputc(' ', file);
    }
}

static void _xml_tag_one_line(FILE *file, int alignment, const char *tag, const char *content)
{
    _xml_alignment(file, alignment);
    fprintf(file, "<%s>%s</%s>\n", tag, content, tag);
}

static void _xml_tag_simple_open(FILE *file, int alignment, const char *tag)
{
    _xml_alignment(file, alignment);
    fprintf(file, "<%s>\n", tag);
}

static void _xml_tag_begin_complex_open(FILE *file, int alignment, const char *tag)
{
    _xml_alignment(file, alignment);
    fprintf(file, "<%s", tag);
}

static void _xml_attribute(FILE *file, const char *name, const char *fmt, ...)
{
    va_list args;

    fprintf(file, " %s=\"", name);
    va_start(args, fmt);
    vfprintf(file, fmt, args);
    va_end(args);
    fputc('\"', file);
}

static void _xml_tag_end_complex_open(FILE *file)
{
    fprintf(file, ">\n");
}

static void _xml_tag_early_end_complex_open(FILE *file)
{
    fprintf(file, "/>\n");
}

static void _xml_tag_close(FILE *file, int alignment, const char *tag)
{
    _xml_alignment(file, alignment);
    fprintf(file, "</%s>\n", tag);
}


static void _dump_type(char buffer[256], data_type *type)
{
    char item_type[256];

    if (!type) {
        strcpy(buffer, "null");
        return;
    }

    switch (type->type_code) {
    case code_type_void:
        strcpy(buffer, "void");
        break;

    case code_type_char:
        strcpy(buffer, "char");
        break;

    case code_type_unsigned_char:
        strcpy(buffer, "unsigned char");
        break;

    case code_type_short:
        strcpy(buffer, "short");
        break;

    case code_type_unsigned_short:
        strcpy(buffer, "unsigned short");
        break;

    case code_type_int:
        strcpy(buffer, "int");
        break;

    case code_type_unsigned_int:
        strcpy(buffer, "unsigned int");
        break;

    case code_type_long:
        strcpy(buffer, "long");
        break;

    case code_type_unsigned_long:
        strcpy(buffer, "unsigned long");
        break;

    case code_type_float:
        strcpy(buffer, "float");
        break;

    case code_type_double:
        strcpy(buffer, "double");
        break;

    case code_type_long_double:
        strcpy(buffer, "long double");
        break;

    case code_type_pointer:
        _dump_type(item_type, type->data.ptr.item_type);
        _snprintf(buffer, 256, "%s *", item_type);
        break;

    case code_type_sized_array:
        _dump_type(item_type, type->data.array.item_type);
        _snprintf(buffer, 256, "%s[%d]", item_type, type->data.array.size);
        break;

    case code_type_unsized_array:
        _dump_type(item_type, type->data.array.item_type);
        _snprintf(buffer, 256, "%s[]", item_type);
        break;

    case code_type_structure:
        _snprintf(buffer, 256, "struct %s", type->data.struct_union.sym->sym_name);
        break;

    case code_type_union:
        _snprintf(buffer, 256, "union %s", type->data.struct_union.sym->sym_name);
        break;

    case code_type_enum:
        strcpy(buffer, "enum");
        break;

    case code_type_function: {
        char tmp[256];
        parameter *p;

        _dump_type(buffer, type->data.function.result_type);
        strcat(buffer, " (");

        for (p = type->data.function.parameters_list->param_first; p; p = p->param_next) {
            switch (p->param_code) {
            case code_symbol_parameter:
            case code_type_parameter:
                {
                    _dump_type(tmp, p->param_type);
                    strcat(buffer, tmp);
                    break;
                }
            case code_ellipsis_parameter: {
                strcat(buffer, "...");
            } break;
            default: ASSERT(FALSE);
            }

            if (p->param_next) strcat(buffer, ", ");
        }

        strcat(buffer, ")");
    } break;

    case code_type_incomplete_structure:
        _snprintf(buffer, 256, "incomplete struct %s", type->data.struct_union.sym);
        break;

    case code_type_incomplete_union:
        _snprintf(buffer, 256, "incomplete union %s", type->data.struct_union.sym);
        break;

    default:
        ASSERT(FALSE);
    }
}

static const char *_dump_bool(BOOL b)
{
    if (b == TRUE) {
        return "yes";
    } else if (b == FALSE) {
        return "no";
    } else {
        ASSERT(FALSE);
    }
}

#define VALIDATE_STANDALONE_EXPR(EXPR, PARENT)  ((EXPR)->expr_next == NULL && (EXPR)->expr_prev == NULL && (EXPR)->expr_parent == (PARENT))
#define VALIDATE_LINKED_EXPR(EXPR, PARENT)      ((!(EXPR)->expr_next || (EXPR)->expr_next->expr_prev == (EXPR)) && (EXPR)->expr_parent == (PARENT))

static void _dump_expression(FILE *file, int align, const char *name, expression *expr)
{
    char type[256];
    int i = 0;
    char buf[64];
    expression *arg;

    _dump_type(type, expr->expr_type);

    _xml_tag_begin_complex_open(file, align, name);
    _xml_attribute(file, "type", type);
    _xml_attribute(file, "lvalue", _dump_bool(expr->expr_lvalue));
    _xml_attribute(file, "complexity", "%d", expr->expr_complexity);

    switch (expr->expr_code) {
    case code_expr_int_constant:
        _xml_attribute(file, "code", "integer literal");
        _xml_attribute(file, "value", "%d", expr->data.int_const);
        _xml_tag_early_end_complex_open(file);
        break;

    case code_expr_float_constant:
        _xml_attribute(file, "code", "float literal");
        _xml_attribute(file, "value", "%f", expr->data.float_const.val);
        _xml_tag_early_end_complex_open(file);
        break;

    case code_expr_symbol:
        _xml_attribute(file, "code", "variable");
        _xml_attribute(file, "name", expr->data.sym->sym_name);
        _xml_tag_early_end_complex_open(file);
        break;

    case code_expr_arithmetic:
        _xml_attribute(file, "code", expr_print_opcode_to_debug(expr->data.arithm.opcode));

        if (IS_INCREMENT_DECREMENT(expr->data.arithm.opcode)) {
            _xml_attribute(file, "step", "%d", expr->data.arithm.step);
        }

        _xml_tag_end_complex_open(file);
        VALIDATE_STANDALONE_EXPR(expr->data.arithm.operand1, expr);
        _dump_expression(file, align + 2, "operand_1", expr->data.arithm.operand1);

        if (IS_BINARY_OP(expr->data.arithm.opcode)) {
            VALIDATE_STANDALONE_EXPR(expr->data.arithm.operand2, expr);
            _dump_expression(file, align + 2, "operand_2", expr->data.arithm.operand2);
        }

        _xml_tag_close(file, align, name);
        break;

    case code_expr_function_call:
        _xml_attribute(file, "code", "function call");
        _xml_tag_end_complex_open(file);
        VALIDATE_STANDALONE_EXPR(expr->data.function_call.address, expr);
        _dump_expression(file, align + 2, "func_address", expr->data.function_call.address);

        for (arg = expr->data.function_call.args->expr_first; arg; arg = arg->expr_next) {
            sprintf(buf, "func_argument_%d", i++);
            VALIDATE_LINKED_EXPR(arg, expr);
            _dump_expression(file, align + 2, buf, arg);
        }

        _xml_tag_close(file, align, name);
        break;

    case code_expr_jump:
        _xml_attribute(file, "code", (expr->data.jump.condition ? "conditional jump" : "jump to label"));
        _xml_attribute(file, "target", "label%04x", expr->data.jump.destination);

        if (!expr->data.jump.condition) {
            _xml_tag_early_end_complex_open(file);
        } else {
            _xml_attribute(file, "invert_condition", _dump_bool(expr->data.jump.invert_cond));
            _xml_tag_end_complex_open(file);

            VALIDATE_STANDALONE_EXPR(expr->data.jump.condition, expr);
            _dump_expression(file, align + 2, "condition", expr->data.jump.condition);
            _xml_tag_close(file, align, name);
        }
        break;

    case code_expr_return:
        _xml_attribute(file, "code", "return");

        if (!expr->data.ret_value) {
            _xml_attribute(file, "retvalue", "void");
            _xml_tag_early_end_complex_open(file);
        } else {
            _xml_tag_end_complex_open(file);

            VALIDATE_STANDALONE_EXPR(expr->data.ret_value, expr);
            _dump_expression(file, align + 2, "retvalue", expr->data.ret_value);
            _xml_tag_close(file, align, name);
        }
        break;

    case code_expr_label:
        _xml_attribute(file, "code", "label");
        _xml_attribute(file, "name", "label%04x", expr->data.jump.destination);
        _xml_tag_early_end_complex_open(file);
        break;

    case code_expr_string:
        _xml_attribute(file, "code", "string literal");
        _xml_attribute(file, "name", "%s", expr->data.str);
        _xml_tag_early_end_complex_open(file);
        break;

    default: ASSERT(FALSE);
    }
}

static void _dump_variable(FILE *file, symbol *var)
{
    char type[256];
    _dump_type(type, var->sym_type);

    _xml_tag_begin_complex_open(file, 8, "variable");
    _xml_attribute(file, "name", var->sym_name);
    _xml_attribute(file, "type", type);
    _xml_tag_early_end_complex_open(file);
}

static void _dump_parameters(FILE *file, function_desc *func)
{
    char type[256];
    parameter *p;

    _xml_tag_simple_open(file, 6, "parameters");

    for (p = func->func_params->param_first; p; p = p->param_next) {
        _xml_tag_begin_complex_open(file, 8, "parameter");

        switch (p->param_code) {
        case code_symbol_parameter:
            _xml_attribute(file, "name", p->param_sym->sym_name);
            // and dump as code_type_parameter
        case code_type_parameter:
            _dump_type(type, p->param_type);
            _xml_attribute(file, "type", type);
            break;

        case code_ellipsis_parameter:
            _xml_attribute(file, "semantic", "ellipsis");
            break;

        default: ASSERT(FALSE);
        }

        _xml_tag_early_end_complex_open(file);
    }

    _xml_tag_close(file, 6, "parameters");
}

static void _dump_locals(FILE *file, function_desc *func)
{
    symbol *var;

    if (func->func_locals.list_first) {
        _xml_tag_simple_open(file, 6, "local_variables");

        for (var = func->func_locals.list_first; var; var = var->sym_next) {
            _dump_variable(file, var);
        }

        _xml_tag_close(file, 6, "local_variables");
    }
}

static void _dump_functions(FILE *file)
{
    function_desc *func;
    expression *expr;

    for (func = unit_get_functions_list(); func; func = func->func_next) {
        _xml_tag_simple_open(file, 4, "function");
        _xml_tag_one_line(file, 6, "name", func->func_sym->sym_name);

        _dump_parameters(file, func);
        _dump_locals(file, func);

        _xml_tag_simple_open(file, 6, "body");

        for (expr = func->func_body; expr; expr = expr = expr->expr_next) {
            VALIDATE_LINKED_EXPR(expr, NULL);
            _dump_expression(file, 8, "expression", expr);
        }

        _xml_tag_close(file, 6, "body");
        _xml_tag_close(file, 4, "function");
    }
}

void debug_dump_unit(const char *src_filename)
{
    char filename[256];
    FILE *file;

    aux_replace_file_extension(filename, src_filename, ".xml");
    file = fopen(filename, "w+");
    fprintf(file, "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n");

    _xml_tag_simple_open(file, 0, "unit");

    _xml_tag_simple_open(file, 2, "general");
    _xml_tag_one_line(file, 4, "source_module", src_filename);
    _xml_tag_close(file, 2, "general");

    _xml_tag_simple_open(file, 2, "functions_list");
    _dump_functions(file);
    _xml_tag_close(file, 2, "functions_list");

    _xml_tag_close(file, 0, "unit");

    fclose(file);
}
