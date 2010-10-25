
#include "common.h"
#include "x86_codegen.h"
#include "x86_data.h"
#include "x86_regalloc.h"
#include "x86_optimizer.h"
#include "x86_stack_frame.h"
#include "x86_text_output.h"


static function_desc *_first_function       = NULL;
static function_desc *_last_function        = NULL;
static function_desc *_curr_func            = NULL;


typedef struct switch_data_decl {
    symbol *        switch_value;
    expression *    conditions_insertion_point;
    int             default_label;
} switch_data;

#define MAX_NEESTED_LOOPS 64

static int          _continue_targets[MAX_NEESTED_LOOPS];
static int          _break_targets[MAX_NEESTED_LOOPS];
static switch_data  _switch_values[MAX_NEESTED_LOOPS];

static int _last_continue_target;
static int _last_break_target;
static int _last_switch_value;


function_desc * unit_get_current_function(void)
{
    return _curr_func;
}

//
// Добавление выражений.
//

void unit_push_expression(expression *expr)
{
    ASSERT(_curr_func);

    if (!expr) {
        return;
    }

    // вставка элемента в двусвязный список
    if (!_curr_func->func_body) {
        _curr_func->func_body   = expr;
        expr->expr_prev         = NULL;
    } else {
        _curr_func->func_body_end->expr_next = expr;
        expr->expr_prev         = _curr_func->func_body_end;
    }

    _curr_func->func_body_end   = expr;
    expr->expr_next             = NULL;
}

void unit_push_return(expression *result, BOOL allow_empty_return)
{
    unit_push_expression(expr_create_return(result, allow_empty_return));
}

function_desc *unit_get_functions_list(void)
{
    return _first_function;
}


symbol *unit_create_temporary_variable(data_type *type)
{
    symbol *tmp         = symbol_create_temporary(type);
    tmp->sym_is_local   = TRUE;

    ASSERT(_curr_func);

    if (_curr_func->func_locals.list_last) {
        _curr_func->func_locals.list_last->sym_next  = tmp;
        _curr_func->func_locals.list_last            = tmp;
    } else {
        _curr_func->func_locals.list_first           = tmp;
        _curr_func->func_locals.list_last            = tmp;
    }

    return tmp;
}


static void _unit_insert_expression_before(expression *expr, expression *position)
{
    ASSERT(_curr_func);

    expr->expr_next = position;
    expr->expr_prev = position->expr_prev;

    if (position->expr_prev) {
        position->expr_prev->expr_next = expr;
    } else {
        _curr_func->func_body    = expr;
    }

    position->expr_prev = expr;
}

static void _unit_insert_jump_before(int dest, expression *condition, BOOL invert_condition, expression *position)
{
    _unit_insert_expression_before(expr_create_jump(dest, condition, invert_condition), position);
}

static void _unit_insert_label_before(int label, expression *position)
{
    _unit_insert_expression_before(expr_create_label(label), position);
}

static void _unit_insert_expression_after(expression *expr, expression *position)
{
    ASSERT(_curr_func);

    expr->expr_prev = position;
    expr->expr_next = position->expr_next;

    if (position->expr_next)
        position->expr_next->expr_prev = expr;
    else
        _curr_func->func_body_end = expr;

    position->expr_next = expr;
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
// Поддержка циклов.
//

int unit_create_label()
{
    return _curr_func->func_last_label++;
}

int unit_create_and_push_label(void)
{
    int label = unit_create_label(_curr_func);
    unit_push_label(label);
    return label;
}

void unit_push_jump(int dest, expression *condition, BOOL invert_condition)
{
    unit_push_expression(expr_create_jump(dest, condition, invert_condition));
}

int unit_create_label_and_push_jump(expression *condition, BOOL invert_condition)
{
    int label = unit_create_label();
    unit_push_jump(label, condition, invert_condition);
    return label;
}

void unit_push_label(int label)
{
    unit_push_expression(expr_create_label(label));
}


//
// Поддержка goto.
//

void unit_push_named_label(symbol *label_name)
{
    int label = unit_create_label(_curr_func);
    unit_push_label(label);

    label_name = symbol_create_label(label_name, label);
}

void unit_push_jump_to_named_label(symbol *label_name)
{
    expression *jump;

    if (label_name->sym_code == code_sym_label) {
        jump = expr_create_jump(label_name->sym_value, NULL, FALSE);
    } else {
        jump = expr_create_jump_to_named_label(symbol_create_label(label_name, INVALID_LABEL));
    }

    unit_push_expression(jump);
}

static void _resolve_jumps_to_named_labels(void)
{
    expression *expr;

    for (expr = _curr_func->func_body; expr; expr = expr->expr_next) {
        if (expr->expr_code == code_expr_jump_by_name) {
            int label                   = expr->data.jump_by_name->sym_value;

            if (label == INVALID_LABEL) {
                aux_error("unknown label: '%s'", expr->data.jump_by_name->sym_name);
                label = 0;
            }

            expr->expr_code             = code_expr_jump;
            expr->data.jump.destination = label;
            expr->data.jump.condition   = NULL;
            expr->data.jump.invert_cond = FALSE;
        }
    }
}


//
// Поддержка break/continue.
//

static void _unit_reset_continue_break_switch_targets()
{
    _last_continue_target   = -1;
    _last_break_target      = -1;
    _last_switch_value      = -1;
}

void unit_push_continue()
{
    if (_last_continue_target != INVALID_LABEL)
        unit_push_jump(_continue_targets[_last_continue_target], NULL, FALSE);
    else
        aux_error("continue outside a loop");
}

void unit_push_break()
{
    if (_last_break_target != INVALID_LABEL)
        unit_push_jump(_break_targets[_last_break_target], NULL, FALSE);
    else
        aux_error("break outside a loop or switch");
}

void unit_push_continue_break_targets(int continue_target, int break_target)
{
    if (++_last_continue_target >= MAX_NEESTED_LOOPS || ++_last_break_target >= MAX_NEESTED_LOOPS)
        aux_fatal_error("too many nested loops");

    _continue_targets[_last_continue_target]    = continue_target;
    _break_targets[_last_break_target]          = break_target;
}

void unit_pop_continue_break_targets()
{
    ASSERT(_last_continue_target-- >= 0);
    ASSERT(_last_break_target-- >= 0);
}


//
// Поддержка switch/case/default.
//


// Помещаем в стек break/default и вычисляем выражение во временную переменную.

void unit_open_switch_stmt(expression *value)
{
    symbol *tmp;

    if (!TYPE_IS_INTEGRAL(value->expr_type)) {
        aux_error("switch operator requires expression of integral type");
        return;
    }

    tmp = unit_create_temporary_variable(value->expr_type);

    unit_push_expression(
        expr_create_binary(
            expr_create_from_identifier(tmp),
            value,
            op_assign));

    if (++_last_break_target >= MAX_NEESTED_LOOPS || ++_last_switch_value >= MAX_NEESTED_LOOPS)
        aux_fatal_error("too many nested switches");

    _break_targets[_last_break_target]                              = unit_create_label();
    _switch_values[_last_switch_value].switch_value                 = tmp;
    _switch_values[_last_switch_value].default_label                = INVALID_LABEL;
    _switch_values[_last_switch_value].conditions_insertion_point   = _curr_func->func_body_end;
}

// Вставляем метку и вставляем сравнение + условный переход.

void unit_push_case_label(expression *value)
{
    int label           = unit_create_and_push_label();
    expression *place   = _switch_values[_last_switch_value].conditions_insertion_point;

    _unit_insert_jump_after(
        label,
        expr_create_binary(
            expr_create_from_identifier(_switch_values[_last_switch_value].switch_value),
            value,
            op_equal),
        FALSE,
        place);

    _switch_values[_last_switch_value].conditions_insertion_point = place->expr_next;
}

// Вставляем метку и вставляем безусловный переход.

void unit_push_default_stmt()
{
    int label           = unit_create_and_push_label();
    expression *place   = _switch_values[_last_switch_value].conditions_insertion_point;

    if (_switch_values[_last_switch_value].default_label != INVALID_LABEL) {
        aux_error("more than one default label");
        return;
    }

    _switch_values[_last_switch_value].default_label = label;

    _unit_insert_jump_after(
        label,
        NULL,
        FALSE,
        place);

    _switch_values[_last_switch_value].conditions_insertion_point = place->expr_next;
}

// Вставляем метку для break и восстанавливаем стеки.

void unit_close_switch_stmt()
{
    unit_push_label(_break_targets[_last_break_target]);

    ASSERT(_last_break_target-- >= 0);
    ASSERT(_last_switch_value-- >= 0);
}


//
// Поддержка цикла for (вырезание третьей инструкции и вставка её после тела цикла).
//

expression *unit_get_last_expression(void)
{
    return _curr_func->func_body_end;
}

expression *unit_extract_slice(expression *expr)
{
    if (!expr) {
        return NULL;
    }

    if (_curr_func->func_body == expr) {
        _curr_func->func_body = _curr_func->func_body_end = NULL;
    } else {
        _curr_func->func_body_end               = expr->expr_prev;
        _curr_func->func_body_end->expr_next    = NULL;
        expr->expr_prev                         = NULL;
    }

    return expr;
}

void unit_insert_slice(expression *list)
{
    expression *end;

    ASSERT(_curr_func);
    if (!list) {
        return;
    }

    // вставка подсписка в двусвязный список
    if (!_curr_func->func_body) {
        _curr_func->func_body                   = list;
    } else {
        _curr_func->func_body_end->expr_next    = list;
    }


    // находим новый конец списка
    end = _curr_func->func_body_end;

    for (end = list; end->expr_next; ) {
        end = end->expr_next;
    }

    _curr_func->func_body_end   = end;
}


//
//  Удаление выражений, бессмысленных с точки зрения кодогенерации.
//

static void _eliminate_meaningless_expressions(void)
{
    expression *expr;

    for (expr = _curr_func->func_body; expr; expr = expr->expr_next) {
        switch (expr->expr_code) {
        case code_expr_int_constant:
        case code_expr_float_constant:
        case code_expr_symbol:
            aux_warning("useless expression");

            if (expr->expr_prev) {
                expr->expr_prev->expr_next  = expr->expr_next;
            } else {
                _curr_func->func_body       = expr->expr_next;
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

    for (expr = _curr_func->func_body; expr; expr = expr->expr_next) {
        if (expr->expr_code == code_expr_jump && expr->data.jump.condition) {
            _replace_boolean_operations_in_jump(expr->data.jump.condition);
        }
    }
}


//
//  Заменяем логические операции, не подпавшие под предыдущие проверки,
//  на условный переход + сохранение во временную переменную.
//

static void _replace_boolean_with_jumps(expression *expr, void *unused)
{
    expr_arithm *arithm = &expr->data.arithm;
    int label;
    symbol *tmp;
    expression saved;


    if (arithm->opcode != op_logical_and && arithm->opcode != op_logical_or) {
        return;
    }

    aux_warning("logical and/or outside of 'if', performance hit because of extra branching");

    tmp     = unit_create_temporary_variable(arithm->operand1->expr_type);
    label   = unit_create_label(_curr_func);


    _unit_insert_expression_before(
        expr_create_binary(
            expr_create_from_identifier(tmp),
            expr_create_from_integer(arithm->opcode == op_logical_or ? 1 : 0, type_create_arithmetic(code_type_int)),
            op_assign),
        expr);

    _unit_insert_jump_before(label, arithm->operand1, arithm->opcode == op_logical_and ? 1 : 0, expr);

    _unit_insert_expression_before(
        expr_create_binary(
            expr_create_from_identifier(tmp),
            expr_create_unary(arithm->operand2, op_notnot),
            op_assign),
        expr);

    _unit_insert_label_before(label, expr);


    saved                   = *expr;
    *expr                   = *expr_create_from_identifier(tmp);

    expr->expr_next         = saved.expr_next;
    expr->expr_prev         = saved.expr_prev;
    expr->expr_parent       = saved.expr_parent;
}

static void _process_general_boolean_arithmetic(void)
{
    expression *expr;

    for (expr = _curr_func->func_body; expr; expr = expr->expr_next) {
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
            if (expr->data.arithm.opcode == op_get_address) {
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
    expr_iterate_through_subexpressions(_curr_func->func_body, 0, EXPR_IT_CHILDREN_FIRST, _calc_complexity_cb, 0);
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

    for (sym = _curr_func->func_locals.list_first; sym; sym = sym->sym_next) {
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
        sym->sym_is_local = !!_curr_func;

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

            if (!_curr_func) {
                expression *val = sym->sym_init->init_data.value;

                if (val->expr_code == code_expr_int_constant) {
                    x86data_declare_initialized_int(sym, val->data.int_const);
                } else if (val->expr_code == code_expr_float_constant) {
                    x86data_declare_initialized_float(sym, val->data.float_const.val);
                } else if (val->expr_code == code_expr_string) {
                    if (sym->sym_type->type_code == code_type_unsized_array
                        && sym->sym_type->data.array.item_type->type_code == code_type_char)
                            x86data_declare_initialized_string(sym, val->data.str);
                    else if (sym->sym_type->type_code == code_type_pointer
                        && sym->sym_type->data.ptr.item_type->type_code == code_type_char)
                            x86data_declare_ptr_to_initialized_string(sym, val->data.str);
                    else
                        aux_error("string literal can only be used to initialize char * or char[]");
                } else {
                    aux_error("initializer of global variable must be a constant expression");
                }
            } else {
                expression *id      = expr_create_from_identifier(sym);
                expression *expr    = expr_create_binary(id, sym->sym_init->init_data.value, op_assign);

                unit_push_expression(expr);
            }
        } else if (!_curr_func && sym->sym_code != code_sym_function) {
            x86data_declare_uninitialized_bytes(sym, type_calculate_sizeof(sym->sym_type));
        }
    }

    // inserting the variable into the list of variables
    if (_curr_func) {
        if (_curr_func->func_locals.list_last) {
            _curr_func->func_locals.list_last->sym_next  = symbols->list_first;
            _curr_func->func_locals.list_last            = symbols->list_last;
        } else {
            _curr_func->func_locals.list_first           = symbols->list_first;
            _curr_func->func_locals.list_last            = symbols->list_last;
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
    _curr_func                  = allocator_alloc(allocator_temporary_pool, sizeof(function_desc));
    memset(_curr_func, 0, sizeof(function_desc));

    _curr_func->func_sym        = sym;
    _curr_func->func_is_static  = spec->spec_static;
    _curr_func->func_params     = sym->sym_type->data.function.parameters_list;

    _curr_func->func_body_end   = NULL;


    // insert function into the list of functions in the current unit
    if (!_first_function) {
        _first_function = _last_function = _curr_func;
    } else {
        _last_function->func_next   = _curr_func;
        _last_function              = _curr_func;
    }


    _unit_reset_continue_break_switch_targets();
}

void unit_handle_function_body(symbol *sym)
{
    if (!sym) {
        return;
    }

    ASSERT(TYPE_IS_FUNCTION(sym->sym_type));

    // add "return" statement if needed and warn if it's non-void function
    if (!_curr_func->func_body) {
        unit_push_return(NULL, TRUE);
    } else {
        expression *expr = _curr_func->func_body;

        while (expr->expr_next) {
            expr = expr->expr_next;
        }

        if (expr->expr_code != code_expr_return) {
            // TODO: чтобы выдавать этот варнинг, нужно статическим анализом доказать достижимость этого кода.
            //
            //data_type *func_type = _curr_func->func_sym->sym_type;
            //
            //if (func_type->data.function.result_type->type_code != code_type_void) {
            //    aux_warning("non-void function does not return anything");
            //}

            unit_push_return(NULL, TRUE);
        }
    }


    // Разрешаем ссылки на неопределённые метки на момент компиляции goto.
    _resolve_jumps_to_named_labels();

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


    _curr_func = NULL;
}


void unit_after_global_declaration(void)
{
    allocator_reset_temporary();
}


//
//  Кодогенерация.
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
    for (_curr_func = _first_function; _curr_func; _curr_func = _curr_func->func_next) {
        ASSERT(_curr_func->func_body);
        _curr_func->func_binary_code = _curr_func->func_binary_code_end = NULL;

        x86_stack_frame_begin_function(_curr_func);
        x86_codegen_do_function(_curr_func);
        x86_stack_frame_end_function(_curr_func);

        _curr_func->func_start_of_regvars = INT_MAX;

        x86_analyze_registers_usage(_curr_func);

        if (!option_debug_disable_basic_opt) {
            x86_optimization_after_codegen(_curr_func);
        }

        if (option_enable_optimization) {
            x86_create_register_variables(_curr_func);
        }

        if (!option_debug_disable_regalloc) {
            x86_allocate_registers(_curr_func);
        }

        _unit_output_function_code(_curr_func);
        allocator_reset_temporary();
    }
}


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

    ASSERT(_curr_func);

    if (!_curr_func->func_binary_code) {
        _curr_func->func_binary_code = res;
    } else {
        _curr_func->func_binary_code_end->in_next = res;
    }

    res->in_next            = NULL;
    res->in_prev            = _curr_func->func_binary_code_end;

    _curr_func->func_binary_code_end = res;
}

