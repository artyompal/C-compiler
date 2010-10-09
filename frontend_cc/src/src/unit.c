
#include "common.h"
#include "x86_codegen.h"
#include "x86_data.h"
#include "x86_regalloc.h"
#include "x86_optimizer.h"
#include "x86_stack_frame.h"
#include "x86_text_output.h"


static expression *_last_expression         = NULL;

static function_desc *_first_function       = NULL;
static function_desc *_last_function        = NULL;
static function_desc *_current_function     = NULL;

static x86_instruction *_last_instruction   = NULL;


//
//  Handling expressions.
//

void unit_push_expression(expression *expr)
{
    ASSERT(_current_function);

    if (!expr) {
        return;
    }

    // inserting in expressions list
    if (!_current_function->func_body) {
        _current_function->func_body = expr;
    } else {
        _last_expression->expr_next = expr;
    }

    _last_expression = expr;
}

void unit_push_return(expression *result)
{
    unit_push_expression(expr_create_return(result));
}


int unit_create_label(function_desc *function)
{
    return function->func_last_label++;
}

int unit_push_label(void)
{
    int label = unit_create_label(_current_function);
    unit_place_label(label);
    return label;
}

void unit_push_jump(int dest, expression *condition, BOOL invert_condition)
{
    unit_push_expression(expr_create_jump(dest, condition, invert_condition));
}

int unit_create_label_and_push_jump(expression *condition, BOOL invert_condition)
{
    int label = unit_create_label(_current_function);
    unit_push_jump(label, condition, invert_condition);
    return label;
}

void unit_place_label(int label)
{
    unit_push_expression(expr_create_label(label));
}


expression *unit_get_last_expression(void)
{
    return _last_expression;
}

expression *unit_extract_expressions_since(expression *expr)
{
    expression *prev;

    expr = expr->expr_next;

    if (!expr) {
        return NULL;
    }

    // FIXME: quadratic complexity!!!
    if (_current_function->func_body == expr) {
        _current_function->func_body = _last_expression = NULL;
    } else {
        for (prev = _current_function->func_body; ; prev = prev->expr_next) {
            ASSERT(prev);

            if (prev->expr_next == expr) {
                _last_expression = prev;
                break;
            }
        }
    }

    return expr;
}

void unit_push_expressions(expression *list)
{
    unit_push_expression(list);

    while (_last_expression->expr_next) {
        _last_expression = _last_expression->expr_next;
    }
}


function_desc *unit_get_functions_list(void)
{
    return _first_function;
}


symbol *unit_create_temporary_variable(data_type *type)
{
    symbol *tmp         = symbol_create_temporary(type);
    tmp->sym_is_local   = TRUE;

    ASSERT(_current_function);

    if (_current_function->func_locals.list_last) {
        _current_function->func_locals.list_last->sym_next  = tmp;
        _current_function->func_locals.list_last            = tmp;
    } else {
        _current_function->func_locals.list_first           = tmp;
        _current_function->func_locals.list_last            = tmp;
    }

    return tmp;
}


static void _unit_insert_expression_after(expression *expr, expression *position)
{
    ASSERT(_current_function);

    if (!position) {
        expr->expr_next     = _current_function->func_body;
        _current_function->func_body = expr;
    } else {
        expr->expr_next     = position->expr_next;
        position->expr_next = expr;
    }
}

static void _unit_insert_jump_after(int dest, expression *condition, BOOL invert_condition, expression *position)
{
    _unit_insert_expression_after(expr_create_jump(dest, condition, invert_condition), position);
}

static void _unit_insert_label_after(int label, expression *position)
{
    _unit_insert_expression_after(expr_create_label(label), position);
}


//
//  Удаление выражений, бессмысленных с точки зрения кодогенерации.
//

static void _eliminate_meaningless_expressions(void)
{
    expression *expr, *prev;

    for (expr = _current_function->func_body, prev = 0; expr; prev = expr, expr = expr->expr_next) {
        switch (expr->expr_code) {
        case code_expr_int_constant:
        case code_expr_float_constant:
        case code_expr_symbol:
            aux_warning("useless expression");

            if (prev) {
                prev->expr_next                 = expr->expr_next;
            } else {
                _current_function->func_body    = expr->expr_next;
            }

            break;

        case code_expr_arithmetic:
        case code_expr_function_call:
        case code_expr_return:
        case code_expr_jump:
        case code_expr_label:
            break;

        default:
            ASSERT(FALSE);
        }
    }
}


//
//  Выделение логической арифметики внутри условных переходов.
//  Мы помечаем для кодогенератора такие команды специальными кодами.
//

static void _replace_boolean_operations_in_jump(expression *expr)
{
    if (expr->expr_code == code_expr_arithmetic) {
        if (expr->data.arithm.opcode == op_logical_and) {
            expr->data.arithm.opcode = op_logical_and_in_jump;

            _replace_boolean_operations_in_jump(expr->data.arithm.operand1);
            _replace_boolean_operations_in_jump(expr->data.arithm.operand2);
        } else if (expr->data.arithm.opcode == op_logical_or) {
            expr->data.arithm.opcode = op_logical_or_in_jump;

            _replace_boolean_operations_in_jump(expr->data.arithm.operand1);
            _replace_boolean_operations_in_jump(expr->data.arithm.operand2);
        } else if (expr->data.arithm.opcode == op_not) {
            _replace_boolean_operations_in_jump(expr->data.arithm.operand1);
        }
    }
}

static void _process_boolean_operations_in_jumps(void)
{
    expression *expr;

    for (expr = _current_function->func_body; expr; expr = expr->expr_next) {
        if (expr->expr_code == code_expr_jump && expr->data.jump.condition) {
            _replace_boolean_operations_in_jump(expr->data.jump.condition);
        }
    }
}


//
//  Заменяем логические операции, не подпавшие под предыдущие проверки,
//  на условный переход + сохранение во временную переменную.
//

static expression *previous_expr = NULL;

static void _replace_boolean_with_jumps(expression *expr, void *unused)
{
    expr_arithm *arithm = &expr->data.arithm;
    int label;
    symbol *tmp;
    expression saved;
    expression *next    = (previous_expr ? previous_expr->expr_next : _current_function->func_body);


    if (arithm->opcode != op_logical_and && arithm->opcode != op_logical_or) {
        return;
    }

    // TODO: можно анализировать операнд на наличие side-effects и возможность убрать джампы.
    aux_warning("logical and/or outside a jump, performance hit because of extra jumps");

    tmp     = unit_create_temporary_variable(arithm->operand1->expr_type);
    label   = unit_create_label(_current_function);


    // FIXME: Из-за того, что список выражений односвязный, нам приходится вставлять инструкции в обратном порядке.
    _unit_insert_label_after(label, previous_expr);

    _unit_insert_expression_after(expr_create_binary(
        expr_create_from_identifier(tmp), expr_create_unary(arithm->operand2, op_notnot), op_assign), previous_expr);

    _unit_insert_jump_after(label, arithm->operand1, arithm->opcode == op_logical_and ? 1 : 0, previous_expr);

    _unit_insert_expression_after(expr_create_binary(expr_create_from_identifier(tmp),
        expr_create_from_integer(arithm->opcode == op_logical_or ? 1 : 0,
            type_create_arithmetic(code_type_int)), op_assign), previous_expr);


    if (previous_expr) {
        previous_expr       = previous_expr->expr_next->expr_next->expr_next->expr_next;
    } else {
        previous_expr       = _current_function->func_body->expr_next->expr_next->expr_next;
    }

    ASSERT(previous_expr->expr_next == next);

    saved                   = *expr;
    *expr                   = *expr_create_from_identifier(tmp);

    expr->expr_next         = saved.expr_next;
    expr->expr_parent       = saved.expr_parent;
}

static void _process_general_boolean_arithmetic(void)
{
    expression *expr, *prev;

    for (expr = _current_function->func_body, prev = NULL; expr; prev = expr, expr = expr->expr_next) {
        previous_expr = prev;
        expr_iterate_through_subexpressions(expr, code_expr_arithmetic,
            EXPR_IT_APPLY_FILTER | EXPR_IT_CHILDREN_FIRST | EXPR_IT_DONT_ADVANCE, _replace_boolean_with_jumps, NULL);
    }
}


//
//  Вычисление метрики сложности для всех выражений.
//

static void _calc_complexity_cb(expression *expr, void *unused)
{
    int res;
    expression *arg;

    switch (expr->expr_code) {
    case code_expr_float_constant:
    case code_expr_int_constant:
    case code_expr_symbol:
        expr->expr_complexity = 1;
        break;

    case code_expr_arithmetic:
        if (IS_UNARY_OP(expr->data.arithm.opcode)) {
            if (expr->data.arithm.opcode == op_dereference || expr->data.arithm.opcode == op_get_address) {
                // BTW, dereference can cost something.
                expr->expr_complexity = expr->data.arithm.operand1->expr_complexity;
            } else {
                expr->expr_complexity = expr->data.arithm.operand1->expr_complexity + 1;
            }
        } else {
            expr->expr_complexity =
                MAX(expr->data.arithm.operand1->expr_complexity, expr->data.arithm.operand2->expr_complexity) + 1;
        }
        break;

    case code_expr_function_call:
        res = 16;

        for (arg = expr->data.function_call.args->expr_first; arg; arg = arg->expr_next) {
            res += arg->expr_complexity;
        }

        expr->expr_complexity = res;
        break;

    case code_expr_return:
    case code_expr_jump:
    case code_expr_label:
        expr->expr_complexity = 0;
        break;

    default:
        ASSERT(FALSE);
    }
}

static void _calc_expressions_complexity(void)
{
    expr_iterate_through_subexpressions(_current_function->func_body, 0, EXPR_IT_CHILDREN_FIRST, _calc_complexity_cb, 0);
}


//
//  Удаление переменных, вышедших из области видимости, из таблицы символов.
//

static void _remove_function_params_from_symtable(data_type *type)
{
    parameter *param;

    while (TYPE_IS_POINTER(type)) {
        type = type->data.ptr.item_type;
    }

    if (TYPE_IS_FUNCTION(type)) {
        for (param = type->data.function.parameters_list->param_first; param; param = param->param_next) {
            if (param->param_code == code_symbol_parameter) {
                _remove_function_params_from_symtable(param->param_sym->sym_type);
                symbol_remove_from_table(param->param_sym, FALSE);
            }
        }
    }
}

static void _remove_local_variables_from_symtable(void)
{
    symbol *sym;

    for (sym = _current_function->func_locals.list_first; sym; sym = sym->sym_next) {
        symbol_remove_from_table(sym, FALSE);
    }
}


//
//  Обработка деклараций переменных и функций.
//

void unit_handle_variable_declarations(decl_specifier decl_spec, symbol_list *symbols)
{
    symbol *sym;

    if (!symbols) { // error handling
        return;
    }

    // fixing up variables types
    type_apply_decl_specifiers_to_vars(decl_spec, symbols);

    for (sym = symbols->list_first; sym; sym = sym->sym_next) {
        sym->sym_is_local = !!_current_function;

        // remove nested variables (i.e. parameters of pointer-to-function variables)
        if (TYPE_IS_FUNCTION(sym->sym_type) || TYPE_IS_POINTER_TO_FUNCTION(sym->sym_type)) {
            if (TYPE_IS_FUNCTION(sym->sym_type)) {
                sym->sym_code = code_sym_function;
            }

            _remove_function_params_from_symtable(sym->sym_type);
        }

        // handle initializers, if any
        if (decl_spec.spec_typedef) {
            if (sym->sym_init) {
                aux_error("typedef's cannot have initializers");
            }
        } else if (sym->sym_init) {
            UNIMPLEMENTED_ASSERT(sym->sym_init->init_code == code_terminal_initializer);

            if (!_current_function) {
                expression *val = sym->sym_init->init_data.value;

                if (val->expr_code == code_expr_int_constant) {
                    x86data_declare_initialized_int(sym, val->data.int_const);
                } else if (val->expr_code == code_expr_float_constant) {
                    x86data_declare_initialized_float(sym, val->data.float_const.val);
                } else {
                    aux_error("initializer of a global variable must be constant expression");
                }
            } else {
                expression *id      = expr_create_from_identifier(sym);
                expression *expr    = expr_create_binary(id, sym->sym_init->init_data.value, op_assign);

                unit_push_expression(expr);
            }
        } else if (!_current_function && sym->sym_code != code_sym_function) {
            x86data_declare_uninitialized_bytes(sym, type_calculate_sizeof(sym->sym_type));
        }
    }

    // inserting the variable into the list of variables
    if (_current_function) {
        if (_current_function->func_locals.list_last) {
            _current_function->func_locals.list_last->sym_next  = symbols->list_first;
            _current_function->func_locals.list_last            = symbols->list_last;
        } else {
            _current_function->func_locals.list_first           = symbols->list_first;
            _current_function->func_locals.list_last            = symbols->list_last;
        }
    }
}

void unit_handle_function_prototype(decl_specifier *spec, symbol *sym)
{
    symbol *hidden;
    decl_specifier default_spec;

    if (!sym) {
        return;
    }

    // handling function type
    sym->sym_code       = code_sym_function;
    sym->sym_is_local   = FALSE;

    if (!TYPE_IS_FUNCTION(sym->sym_type)) {
        aux_error("invalid function prototype");
        return;
    }

    if (!spec) {
        memset(&default_spec, 0, sizeof(default_spec));
        default_spec.spec_int   = 1;
        spec                    = &default_spec;
    }

    type_apply_decl_specifiers_to_type(*spec, &sym->sym_type);


    // handle function override: we must check type matching with previous_expr declaration
    hidden = symbol_unhide(sym);

    if (hidden) {
        if (!type_are_same(hidden->sym_type, sym->sym_type)) {
            aux_error("function '%s' was seen earlier with different signature", hidden->sym_name);
        }

        symbol_delete_hidden(sym, hidden);
    }


    // making function descriptor
    _current_function                           = allocator_alloc(allocator_temporary_pool, sizeof(function_desc));
    memset(_current_function, 0, sizeof(function_desc));

    _current_function->func_sym                 = sym;
    _current_function->func_is_static           = spec->spec_static;
    _current_function->func_params              = sym->sym_type->data.function.parameters_list;

    _last_expression                            = NULL;


    // insert function into the list of functions in the current unit
    if (!_first_function) {
        _first_function = _last_function = _current_function;
    } else {
        _last_function->func_next = _current_function;
        _last_function = _current_function;
    }
}

void unit_handle_function_body(symbol *sym)
{
    if (!sym) {
        return;
    }

    ASSERT(TYPE_IS_FUNCTION(sym->sym_type));

    // add "return" statement if needed and warn if it's non-void function
    if (!_current_function->func_body) {
        unit_push_return(NULL);
    } else {
        expression *expr = _current_function->func_body;

        while (expr->expr_next) {
            expr = expr->expr_next;
        }

        if (expr->expr_code != code_expr_return) {
            //data_type *func_type = _current_function->func_sym->sym_type;
            //
            //if (func_type->data.function.result_type->type_code != code_type_void) {
            //    aux_warning("non-void function does not return anything, is it ok?");
            //}

            unit_push_return(NULL);
        }
    }


    // Сначала выкидываем бессмысленные, с точки зрения кодогенератора, выражения.
    _eliminate_meaningless_expressions();

    // Заменяем операторы &&, || внутри jmp на специальные коды op_logical_and_in_jump/op_logical_or_in_jump.
    _process_boolean_operations_in_jumps();

    // Заменяем логическую арифметику (операторы &&, ||) на условные переходы с записью результата
    // во временную переменную.
    _process_general_boolean_arithmetic();

    // Вычисляем метрику сложности для каждого выражения, в том числе для вложенных.
    _calc_expressions_complexity();

    // Удаляем параметры функции и локальные переменные из области видимости.
    // TODO: поддержка локальных переменных во вложенных блоках с правильными областями видимости.
    _remove_function_params_from_symtable(sym->sym_type);
    _remove_local_variables_from_symtable();


    _current_function   = NULL;
    _last_instruction   = NULL;
}


void unit_after_global_declaration(void)
{
    allocator_reset_temporary();
}


//
//  Code generation.
//

static void _unit_output_function_code(function_desc *func)
{
    x86_instruction *instr;

    text_output_begin_function(func);

    for (instr = func->func_binary_code; instr; instr = instr->in_next) {
        text_output_push_instruction(instr);
    }

    text_output_end_function(func);
}

void unit_codegen(void)
{
    for (_current_function = _first_function; _current_function; _current_function = _current_function->func_next) {
        ASSERT(_current_function->func_body);
        _last_instruction = NULL;

        x86_stack_frame_begin_function(_current_function);
        x86_codegen_do_function(_current_function);
        x86_stack_frame_end_function(_current_function);

        _current_function->func_start_of_regvars = INT_MAX;

        x86_analyze_registers_usage(_current_function);

        if (!option_debug_disable_basic_opt) {
            x86_optimization_after_codegen(_current_function);
        }

        if (option_enable_optimization) {
            x86_create_register_variables(_current_function);
        }

        if (!option_debug_disable_regalloc) {
            x86_allocate_registers(_current_function);
        }

        _unit_output_function_code(_current_function);
        allocator_reset_temporary();
    }
}


//
//  Maintaining instructions list.
//

void unit_push_nullary_instruction(x86_instruction_code code)
{
    unit_push_binary_instruction(code, NULL, NULL);
}

void unit_push_unary_instruction(x86_instruction_code code, x86_operand *op)
{
    unit_push_binary_instruction(code, op, NULL);
}

void unit_push_binary_instruction(x86_instruction_code code, x86_operand *op1, x86_operand *op2)
{
    x86_instruction *res    = bincode_create_instruction(code, op1, op2);

    ASSERT(_current_function);

    if (!_last_instruction) {
        _current_function->func_binary_code = res;
    } else {
        _last_instruction->in_next = res;
    }

    res->in_next            = NULL;
    res->in_prev            = _last_instruction;

    _last_instruction       = res;
}


