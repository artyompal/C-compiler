
#include "common.h"
#include "unit.h"


static expression * _get_address                   (expression *expr);
static expression * _create_binary_arithm_expr     (arithmetic_opcode opcode, expression *op1, expression *op2, data_type *type);
static BOOL         _is_allowed_cast_of_same_size  (data_type *from, data_type *to);
static BOOL         _try_generate_int_cast         (expression **res, data_type *from, data_type *to);
static BOOL         _try_generate_float_cast       (expression **res, data_type *from, data_type *to);
static void         _silent_cast_to_arithmetic_type(expression **expr, data_type_code code);


static expression *_create_expr(expression_code code, data_type *type)
{
    expression *res;

    res                     = allocator_alloc(allocator_temporary_pool, sizeof(expression));
    res->expr_code          = code;
    res->expr_type          = type;
    res->expr_lvalue        = (code == code_expr_symbol);
    res->expr_source_line   = aux_get_current_line();
    res->expr_next          = NULL;
    res->expr_prev          = NULL;
    res->expr_parent        = NULL;

    return res;
}

static expression *_create_arithmetic(data_type *type)
{
    return _create_expr(code_expr_arithmetic, type);
}


char const *expr_print_opcode_to_user(arithmetic_opcode code)
{
    switch (code) {
    case op_add:            return "binary +";
    case op_sub:            return "binary -";
    case op_mul:            return "* (multiplication)";
    case op_div:            return "/";
    case op_mod:            return "%";
    case op_shl:            return "<<";
    case op_shr:            return ">>";
    case op_and:            return "& (bitwise and)";
    case op_xor:            return "^";
    case op_or:             return "|";
    case op_less_then:      return "<";
    case op_less_equal:     return "<=";
    case op_greater_then:   return ">";
    case op_greater_equal:  return ">=";
    case op_equal:          return "==";
    case op_non_equal:      return "!=";
    case op_logical_and:    return "&&";
    case op_logical_or:     return "||";
    case op_assign:         return "=";
    case op_add_assign:     return "+=";
    case op_sub_assign:     return "-=";
    case op_mul_assign:     return "*=";
    case op_div_assign:     return "/=";
    case op_mod_assign:     return "%=";
    case op_shl_assign:     return "<<=";
    case op_shr_assign:     return ">>=";
    case op_and_assign:     return "&=";
    case op_xor_assign:     return "^=";
    case op_or_assign:      return "|=";
    case op_neg:            return "unary -";
    case op_bitnot:         return "~";
    case op_not:            return "!";
    case op_increment:      return "++ (pre-increment)";
    case op_decrement:      return "-- (pre-decrement)";
    case op_post_increment: return "++ (post-increment)";
    case op_post_decrement: return "-- (post-decrement)";
    case op_dereference:    return "* (dereference)";
    case op_get_address:    return "& (address)";
    case op_convert_int2float:      return "convert_int2float";
    case op_convert_float2int:      return "convert_float2int";
    case op_notnot:                 return "!!";
    case op_logical_and_in_jump:    return "&&";
    case op_logical_or_in_jump:     return "||";
    default:                ASSERT(FALSE);
    }
}

char const *expr_print_opcode_to_debug(arithmetic_opcode code)
{
    switch (code) {
    case op_add:            return "add";
    case op_sub:            return "sub";
    case op_mul:            return "mul";
    case op_div:            return "div";
    case op_mod:            return "mod";
    case op_shl:            return "shl";
    case op_shr:            return "shr";
    case op_and:            return "and";
    case op_xor:            return "xor";
    case op_or:             return "or";
    case op_less_then:      return "less_then";
    case op_less_equal:     return "less_equal";
    case op_greater_then:   return "greater_then";
    case op_greater_equal:  return "greater_equal";
    case op_equal:          return "equal";
    case op_non_equal:      return "non_equal";
    case op_logical_and:    return "logical_and";
    case op_logical_or:     return "logical_or";
    case op_assign:         return "assign";
    case op_add_assign:     return "add_assign";
    case op_sub_assign:     return "sub_assign";
    case op_mul_assign:     return "mul_assign";
    case op_div_assign:     return "div_assign";
    case op_mod_assign:     return "mod_assign";
    case op_shl_assign:     return "shl_assign";
    case op_shr_assign:     return "shr_assign";
    case op_and_assign:     return "and_assign";
    case op_xor_assign:     return "xor_assign";
    case op_or_assign:      return "or_assign";
    case op_neg:            return "neg";
    case op_bitnot:         return "bitnot";
    case op_not:            return "not";
    case op_increment:      return "increment";
    case op_decrement:      return "decrement";
    case op_post_increment: return "post_increment";
    case op_post_decrement: return "post_decrement";
    case op_dereference:    return "dereference";
    case op_get_address:    return "get_address";
    case op_convert_int2float:      return "convert_int2float";
    case op_convert_float2int:      return "convert_float2int";
    case op_notnot:                 return "notnot";
    case op_logical_and_in_jump:    return "logical_and_in_jump";
    case op_logical_or_in_jump:     return "logical_or_in_jump";
    default:                ASSERT(FALSE);
    }
}

static expression *_add_offset_to_raw_pointer(expression *ptr, expression *index, int subtract)
{
    if (index->expr_code == code_expr_int_constant && index->data.int_const == 0) {
        return ptr;
    } else {
        return _create_binary_arithm_expr((subtract ? op_sub : op_add), ptr, index, ptr->expr_type);
    }
}

static expression *_add_offset_to_sized_pointer(expression *ptr, expression *index, BOOL subtract)
{
    int             item_type_size;
    expression *    res;
    data_type *     int_type;

    ASSERT(TYPE_IS_POINTER(ptr->expr_type));
    item_type_size  = type_calculate_sizeof(ptr->expr_type->data.ptr.item_type);

    if (item_type_size == 0) {
        aux_error("indexing of void pointer");
        return NULL;
    } else if (item_type_size > 1) {
        int_type    = type_create_arithmetic(code_type_int);
        index       = _create_binary_arithm_expr(op_mul, index, expr_create_from_integer(item_type_size, int_type), int_type);
    }

    res             = _add_offset_to_raw_pointer(ptr, index, subtract);
    res->expr_type  = ptr->expr_type;

    return res;
}

static expression *_generate_pointer(expression *expr, BOOL allow_array, BOOL allow_function)
{
    expression *res = expr;

    if (TYPE_IS_ARRAY(expr->expr_type)) {
        if (allow_array) {
            res             = _get_address(expr);
            res->expr_type  = type_create_pointer_node(expr->expr_type->data.array.item_type);
        }
    } else if (TYPE_IS_FUNCTION(expr->expr_type)) {
        if (allow_function) {
            res             = _get_address(expr);
            res->expr_type  = type_create_pointer_node(expr->expr_type);
        }
    }

    return res;
}

static expression *_integral_promotion(expression *expr)
{
    if (expr->expr_type->type_code >= code_type_char && expr->expr_type->type_code <= code_type_unsigned_short) {
        _silent_cast_to_arithmetic_type(&expr, code_type_int);
    }

    return expr;
}


static expression *_evaluate_const_int_unary_expression(arithmetic_opcode opcode, int value, data_type *type)
{
    int res;

    if (opcode == op_convert_int2float) {
        return expr_create_from_float((float) value, type);
    }

    switch (opcode) {
    case op_neg:    res = -value; break;
    case op_bitnot: res = ~value; break;
    case op_not:    res = !value; break;
    case op_notnot: res = !!value; break;
    default:        ASSERT(FALSE);
    }

    return expr_create_from_integer(res, type);
}

static expression *_evaluate_const_float_unary_expression(arithmetic_opcode opcode, double value, data_type *type)
{
    if (opcode == op_convert_float2int) {
        return expr_create_from_integer((int) value, type);
    } else {
        ASSERT(opcode == op_neg);
        return expr_create_from_float(-value, type);
    }
}

static expression *_evaluate_const_int_binary_expression(arithmetic_opcode opcode, int val1, int val2, data_type *type)
{
    expression *res = _create_expr(code_expr_int_constant, type);

    switch (opcode) {
    case op_add:            res->data.int_const = val1 + val2; break;
    case op_sub:            res->data.int_const = val1 - val2; break;
    case op_mul:            res->data.int_const = val1 * val2; break;
    case op_div:            res->data.int_const = val1 / val2; break;
    case op_mod:            res->data.int_const = val1 % val2; break;
    case op_shl:            res->data.int_const = val1 << val2; break;
    case op_shr:            res->data.int_const = val1 >> val2; break;
    case op_logical_and:
    case op_logical_and_in_jump:
    case op_and:            res->data.int_const = val1 & val2; break;
    case op_xor:            res->data.int_const = val1 ^ val2; break;
    case op_logical_or:
    case op_logical_or_in_jump:
    case op_or:             res->data.int_const = val1 | val2; break;

    case op_less_then:      res->data.int_const = (val1 < val2); break;
    case op_less_equal:     res->data.int_const = (val1 <= val2); break;
    case op_greater_then:   res->data.int_const = (val1 > val2); break;
    case op_greater_equal:  res->data.int_const = (val1 >= val2); break;
    case op_equal:          res->data.int_const = (val1 == val2); break;
    case op_non_equal:      res->data.int_const = (val1 != val2); break;

    default:                ASSERT(FALSE);
    }

    return res;
}

static expression *_evaluate_const_float_binary_expression(arithmetic_opcode opcode, double val1, double val2, data_type *type)
{
    expression *res;

    if (IS_COMPARE_OP(opcode)) {
        res = _create_expr(code_expr_int_constant, type);
    } else {
        res = _create_expr(code_expr_float_constant, type);
    }

    switch (opcode) {
    case op_add:            res->data.float_const.val = val1 + val2; break;
    case op_sub:            res->data.float_const.val = val1 - val2; break;
    case op_mul:            res->data.float_const.val = val1 * val2; break;
    case op_div:            res->data.float_const.val = val1 / val2; break;

    case op_less_then:      res->data.int_const = (val1 < val2); break;
    case op_less_equal:     res->data.int_const = (val1 <= val2); break;
    case op_greater_then:   res->data.int_const = (val1 > val2); break;
    case op_greater_equal:  res->data.int_const = (val1 >= val2); break;
    case op_equal:          res->data.int_const = (val1 == val2); break;
    case op_non_equal:      res->data.int_const = (val1 != val2); break;

    default:                ASSERT(FALSE);
    }

    return res;
}


expression *expr_create_unary(expression *expr, arithmetic_opcode opcode)
{
    expression *res;

    if (!expr) {
        return NULL;
    }

    expr = _generate_pointer(expr, !IS_INCREMENT_DECREMENT(opcode), TRUE);
    expr = _integral_promotion(expr);

    // семантические проверки
    if (IS_INTERNAL(opcode)) {
        // у инструкций, сгенерированных компилятором, всё должно быть корректно
    } else if (opcode == op_neg || opcode == op_bitnot || opcode == op_not) {
        if (!TYPE_IS_ARITHMETIC(expr->expr_type)) {
            aux_error("operator '%s' needs operand of arithmetic type", expr_print_opcode_to_user(opcode));
            return NULL;
        }

        if (opcode == op_bitnot && !TYPE_IS_INTEGRAL(expr->expr_type)) {
            aux_error("operator '~' needs operand of integral type");
            return NULL;
        }
    } else if (IS_INCREMENT_DECREMENT(opcode)) {
        if (!expr->expr_lvalue) {
            aux_error("operator '%s' needs lvalue", expr_print_opcode_to_user(opcode));
            return NULL;
        }

        if (!TYPE_IS_INTEGRAL(expr->expr_type) && !TYPE_IS_POINTER(expr->expr_type)) {
            aux_error("operator '%s' needs operand of integral or pointer type", expr_print_opcode_to_user(opcode));
            return NULL;
        }
    } else {
        ASSERT(FALSE);
    }

    // создаём результирующее выражение
    res                         = _create_arithmetic(expr->expr_type);
    res->data.arithm.opcode     = opcode;
    res->data.arithm.operand1   = expr;
    expr->expr_parent           = res;

    if (IS_INCREMENT_DECREMENT(opcode) && TYPE_IS_POINTER(expr->expr_type)) {
        res->data.arithm.step = type_calculate_sizeof(expr->expr_type->data.ptr.item_type);
    } else {
        res->data.arithm.step = 1;
    }


    // вычисляем константные выражения
    if (IS_INT_CONSTANT_EXPR(expr)) {
        if (opcode != op_dereference) {
            res = _evaluate_const_int_unary_expression(opcode, expr->data.int_const, res->expr_type);
        }
    } else if (IS_FLOAT_CONSTANT_EXPR(expr)) {
        res = _evaluate_const_float_unary_expression(opcode, expr->data.float_const.val, res->expr_type);
    }

    return res;
}


static expression *_try_optimize_constant_operand(arithmetic_opcode opcode, expression *e1, expression *e2, data_type *type)
{
    int val = e2->data.int_const;
    expression *log;

    if (val == 0) {
        if (opcode == op_add || opcode == op_add_assign || opcode == op_sub || opcode == op_sub_assign
            || opcode == op_shl || opcode == op_shl_assign || opcode == op_shr || opcode == op_shr_assign
                || opcode == op_or || opcode == op_or_assign) {
                    return e1;
                }

        if (opcode == op_mul || opcode == op_mul_assign || opcode == op_and || opcode == op_and_assign) {
            return e2;
        }
    } else if (val == 1) {
        if (opcode == op_mul || opcode == op_mul_assign || opcode == op_div || opcode == op_div_assign) {
            return e1;
        } else if (opcode == op_mod) {
            return expr_create_from_integer(0, type);
        } else if (opcode == op_mod_assign) {
            return _create_binary_arithm_expr(op_assign, e1, expr_create_from_integer(1, type), type);
        }
    }

    if (IS_POT(val)) {
        log = expr_create_from_integer(log2(val), type);

        if (opcode == op_mul) {
            return _create_binary_arithm_expr(op_shl, e1, log, type);
        } else if (opcode == op_mul_assign) {
            return _create_binary_arithm_expr(op_shl_assign, e1, log, type);
        } else if (opcode == op_div) {
            return _create_binary_arithm_expr(op_shr, e1, log, type);
        } else if (opcode == op_div_assign) {
            return _create_binary_arithm_expr(op_shr_assign, e1, log, type);
        } else if (opcode == op_mod) {
            log->data.int_const--;
            return _create_binary_arithm_expr(op_and, e1, log, type);
        } else if (opcode == op_mod_assign) {
            log->data.int_const--;
            return _create_binary_arithm_expr(op_and_assign, e1, log, type);
        }
    }

    return NULL;
}

static expression *_create_binary_arithm_expr(arithmetic_opcode opcode, expression *e1, expression *e2, data_type *type)
{
    expression *res;

    // проверка на константное деление на ноль
    if ((opcode == op_div || opcode == op_mod || opcode == op_div_assign || opcode == op_mod_assign)
        && IS_INT_CONSTANT_EXPR(e2) && e2->data.int_const == 0) {
            aux_error("constant division by zero");
            return NULL;
        }

    // если выражение константное, тривиально вычисляем его
    if (IS_INT_CONSTANT_EXPR(e1) && IS_INT_CONSTANT_EXPR(e2)) {
        return _evaluate_const_int_binary_expression(opcode, e1->data.int_const, e2->data.int_const, type);
    } else if (IS_FLOAT_CONSTANT_EXPR(e1) && IS_FLOAT_CONSTANT_EXPR(e2)) {
        return _evaluate_const_float_binary_expression(opcode, e1->data.float_const.val, e2->data.float_const.val, type);
    }

    // заменяем умножение/деление на константную степень двойки битовыми сдвигами
    if (IS_INT_CONSTANT_EXPR(e2)) {
        res = _try_optimize_constant_operand(opcode, e1, e2, type);

        if (res) {
            return res;
        }
    } else if (IS_INT_CONSTANT_EXPR(e1) && (opcode == op_mul || opcode == op_add)) {
        res = _try_optimize_constant_operand(opcode, e2, e1, type);

        if (res) {
            return res;
        }
    }

    // создаём ноду выражения
    res = _create_arithmetic(type);
    res->data.arithm.opcode     = opcode;
    res->data.arithm.operand1   = e1;
    res->data.arithm.operand2   = e2;

    e1->expr_parent             = res;
    e2->expr_parent             = res;

    return res;
}

static void _silent_cast_to_arithmetic_type(expression **expr, data_type_code code)
{
    data_type *type = type_create_arithmetic(code);

    if (_is_allowed_cast_of_same_size((*expr)->expr_type, type)) {
        (*expr)->expr_type = type;
    } else if (_try_generate_float_cast(expr, (*expr)->expr_type, type)) {
        (*expr)->expr_type = type;
    } else if (!_try_generate_int_cast(expr, (*expr)->expr_type, type)) {
        ASSERT(FALSE);
    }
}

static void _arithmetic_transformations(expression **e1, expression **e2)
{
    if ((*e1)->expr_type->type_code == code_type_long_double || (*e2)->expr_type->type_code == code_type_long_double) {
        _silent_cast_to_arithmetic_type(e1, code_type_long_double);
        _silent_cast_to_arithmetic_type(e2, code_type_long_double);
    } else if ((*e1)->expr_type->type_code == code_type_double || (*e2)->expr_type->type_code == code_type_double) {
        _silent_cast_to_arithmetic_type(e1, code_type_double);
        _silent_cast_to_arithmetic_type(e2, code_type_double);
    } else if ((*e1)->expr_type->type_code == code_type_float || (*e2)->expr_type->type_code == code_type_float) {
        _silent_cast_to_arithmetic_type(e1, code_type_float);
        _silent_cast_to_arithmetic_type(e2, code_type_float);
    } else if ((*e1)->expr_type->type_code == code_type_unsigned_long_long || (*e2)->expr_type->type_code == code_type_unsigned_long_long) {
        _silent_cast_to_arithmetic_type(e1, code_type_unsigned_long_long);
        _silent_cast_to_arithmetic_type(e2, code_type_unsigned_long_long);
    } else if ((*e1)->expr_type->type_code == code_type_long_long || (*e2)->expr_type->type_code == code_type_long_long) {
        _silent_cast_to_arithmetic_type(e1, code_type_long_long);
        _silent_cast_to_arithmetic_type(e2, code_type_long_long);
    } else if ((*e1)->expr_type->type_code == code_type_unsigned_long || (*e2)->expr_type->type_code == code_type_unsigned_long) {
        _silent_cast_to_arithmetic_type(e1, code_type_unsigned_long);
        _silent_cast_to_arithmetic_type(e2, code_type_unsigned_long);
    } else if ((*e1)->expr_type->type_code == code_type_long || (*e2)->expr_type->type_code == code_type_long) {
        _silent_cast_to_arithmetic_type(e1, code_type_long);
        _silent_cast_to_arithmetic_type(e2, code_type_long);
    } else if ((*e1)->expr_type->type_code == code_type_unsigned_int || (*e2)->expr_type->type_code == code_type_unsigned_int) {
        _silent_cast_to_arithmetic_type(e1, code_type_unsigned_int);
        _silent_cast_to_arithmetic_type(e2, code_type_unsigned_int);
    } else {
        _silent_cast_to_arithmetic_type(e1, code_type_int);
        _silent_cast_to_arithmetic_type(e2, code_type_int);
    }
}

expression *expr_create_binary(expression *e1, expression *e2, arithmetic_opcode opcode)
{
    data_type *res_type;

    if (!e1 || !e2) {
        return NULL;
    }

    e1 = _generate_pointer(e1, !IS_ASSIGN_OP(opcode), TRUE);
    e2 = _generate_pointer(e2, TRUE, TRUE);

    // проверяем допустимость типов операндов
    if (type_are_same(e1->expr_type, e2->expr_type)) {
        if (TYPE_IS_ARITHMETIC(e1->expr_type))
            _arithmetic_transformations(&e1, &e2);
    } else if (TYPE_IS_ARITHMETIC(e1->expr_type) && TYPE_IS_ARITHMETIC(e2->expr_type)) {
        if (IS_ASSIGN_OP(opcode)) {
            e2 = expr_create_type_cast(e2, e1->expr_type);
        } else {
            _arithmetic_transformations(&e1, &e2);
        }
    } else if ((TYPE_IS_POINTER(e1->expr_type) && TYPE_IS_INTEGRAL(e2->expr_type) ||
        TYPE_IS_INTEGRAL(e1->expr_type) && TYPE_IS_POINTER(e2->expr_type)) &&
            opcode == op_add || opcode == op_sub) {
                if (TYPE_IS_POINTER(e1->expr_type)) {
                    return _add_offset_to_sized_pointer(e1, e2, opcode == op_sub);
                } else {
                    return _add_offset_to_sized_pointer(e2, e1, opcode == op_sub);
                }
    } else {
        aux_error("type mismatch");
        return NULL;
    }

    // проверяем случай сравнения указателей
    if (TYPE_IS_POINTER(e1->expr_type)) {
        // TODO: нужно поддержать вычитание указателей
        if (!IS_COMPARE_OP(opcode) && opcode != op_sub && opcode != op_assign) {
            aux_error("type mismatch: invalid operation with pointers");
            return NULL;
        }
    }

    // проверяем присваивание структур
    if (TYPE_IS_STRUCTURE_UNION(e1->expr_type)) {
        if (opcode != op_assign) {
            aux_error("type mismatch: invalid operation with structure/union");
            return NULL;
        }
    }

    // для присваивания первый операнд обязан быть lvalue
    if (IS_SELF_MOD_OP(opcode)) {
        if (!e1->expr_lvalue) {
            aux_error("operator '%s' needs lvalue as first operand", expr_print_opcode_to_user(opcode));
            return NULL;
        }
    }

    // выводим тип результата; результат сравнения всегда int.
    if (IS_COMPARE_OP(opcode)) {
        res_type = type_create_arithmetic(code_type_int);
    } else {
        res_type = e1->expr_type;
    }

    return _create_binary_arithm_expr(opcode, e1, e2, res_type);
}

expression *expr_create_ternary(expression *e1, expression *e2, expression *e3)
{
    symbol *        tmp;
    int             if_dest, end_dest;
    expression *    expr;

    if (!e1 || !e2 || !e3) {
        return NULL;
    }

    e1 = _generate_pointer(e1, TRUE, TRUE);
    e2 = _generate_pointer(e2, TRUE, TRUE);
    e3 = _generate_pointer(e3, TRUE, TRUE);

    if (!type_are_same(e2->expr_type, e3->expr_type)) {
        aux_error("operator ?: second and third operand must have the same type");
        return NULL;
    }

    tmp         = unit_create_temporary_variable(e2->expr_type);
    if_dest     = unit_create_label_and_push_jump(e1, TRUE);

    expr        = expr_create_binary(expr_create_from_identifier(tmp), e2, op_assign);
    unit_push_expression(expr);

    end_dest    = unit_create_label_and_push_jump(NULL, TRUE);
    unit_push_label(if_dest);

    expr        = expr_create_binary(expr_create_from_identifier(tmp), e3, op_assign);
    unit_push_expression(expr);

    unit_push_label(end_dest);

    expr        = expr_create_from_identifier(tmp);
    return expr;
}

expression *expr_create_from_identifier(symbol *sym)
{
    expression *res;

    if (!sym) {
        return NULL;
    }

    if (sym->sym_code == code_sym_unknown) {
        aux_error("unknown identifier: '%s'", sym->sym_name);
        symbol_free(sym, TRUE);
    }

    res             = _create_expr(code_expr_symbol, sym->sym_type);
    res->data.sym   = sym;

    return res;
}

expression *expr_create_from_integer(long val, data_type *type)
{
    expression *res;

    if (!type) {
        return NULL;
    }

    res                 = _create_expr(code_expr_int_constant, type);
    res->data.int_const = val;
    return res;
}

expression *expr_create_from_float(double val, data_type *type)
{
    expression *res;

    if (!type) {
        return NULL;
    }

    res                         = _create_expr(code_expr_float_constant, type);
    res->data.float_const.val   = val;
    return res;
}

expression *expr_create_from_string(char *str)
{
    expression *res    = _create_expr(code_expr_string, type_create_string());

    res->data.str = str;
    return res;
}


expression *expr_create_jump(int destination, expression *condition, BOOL invert_condition)
{
    expression *res;

    if (condition && !TYPE_IS_ARITHMETIC(condition->expr_type) && !TYPE_IS_POINTER(condition->expr_type)) {
        aux_error("if/while condition must have arithmetic or pointer type");
        return NULL;
    }

    res                         = _create_expr(code_expr_jump, NULL);
    res->data.jump.destination  = destination;
    res->data.jump.condition    = condition;
    res->data.jump.invert_cond  = invert_condition;

    if (condition) {
        condition->expr_parent  = res;
    }

    return res;
}

expression *expr_create_jump_to_named_label(symbol *label_name)
{
    expression *res;

    res                     = _create_expr(code_expr_jump_by_name, NULL);
    res->data.jump_by_name  = label_name;

    return res;
}

BOOL _try_silently_cast(expression **expr, data_type *type)
{
    if (type_are_same((*expr)->expr_type, type)) return TRUE;

    if (TYPE_IS_ARITHMETIC((*expr)->expr_type) && TYPE_IS_ARITHMETIC(type)) {
        _silent_cast_to_arithmetic_type(expr, type->type_code);
        return TRUE;
    } else {
        return FALSE;
    }
}

expression *expr_create_return(expression *result, BOOL allow_empty_return)
{
    expression *res;
    data_type *function_type;

    function_type = unit_get_current_function()->func_sym->sym_type;
    ASSERT(function_type->type_code == code_type_function);

    if (result) {
        if (!_try_silently_cast(&result, function_type->data.function.result_type)) {
            aux_error("invalid function return type");
            return NULL;
        }
    } else {
        if (!allow_empty_return && function_type->data.function.result_type->type_code != code_type_void) {
            aux_error("missing return value in non-void function");
            return NULL;
        }
    }

    res                 = _create_expr(code_expr_return, NULL);
    res->data.ret_value = result;

    if (result) {
        result->expr_parent = res;
    }

    return res;
}


expression *expr_create_array_indexing(expression *e1, expression *e2)
{
    expression *res;

    if (!e1 || !e2) {
        return NULL;
    }

    e1 = _generate_pointer(e1, TRUE, TRUE);
    e2 = _generate_pointer(e2, TRUE, TRUE);

    if (TYPE_IS_POINTER(e1->expr_type) && TYPE_IS_INTEGRAL(e2->expr_type)) {
        res = _add_offset_to_sized_pointer(e1, e2, FALSE);
    } else if (TYPE_IS_POINTER(e2->expr_type) &&  TYPE_IS_POINTER(e1->expr_type)) {
        return _add_offset_to_sized_pointer(e2, e1, FALSE);
    } else {
        aux_error("invalid types for '[]'");
        return NULL;
    }

    res = expr_dereference(res);
    return res;
}

static expression *_dereference(expression *expr, data_type *type)
{
    expression *res;

    res                         = _create_arithmetic(type);
    res->data.arithm.opcode     = op_dereference;
    res->data.arithm.operand1   = expr;
    res->expr_lvalue            = TRUE;

    expr->expr_parent           = res;
    return res;
}

expression *expr_dereference(expression *expr)
{
    if (!expr) {
        return NULL;
    }

    expr = _generate_pointer(expr, TRUE, TRUE);

    if (!TYPE_IS_POINTER(expr->expr_type)) {
        aux_error("operator '*' needs pointer");
        return NULL;
    }

    return _dereference(expr, expr->expr_type->data.ptr.item_type);
}

expression *_real_indirect_field_access(expression *expr, symbol *sym, data_type *struct_type)
{
    expression *res = expr;
    data_type *member_type;
    int member_offset;

    member_offset = type_calculate_offsetof(struct_type, sym, &member_type);

    if (member_offset == -1) {
        aux_error("member '%s' not found", sym->sym_name);
        symbol_free(sym, TRUE);
    }

    if (member_offset) {
        res = _add_offset_to_raw_pointer(expr, expr_create_from_integer(member_offset,
            type_create_arithmetic(code_type_int)), FALSE);
    }

    res = _dereference(res, member_type);
    return res;
}

expression *expr_create_direct_field_access(expression *expr, symbol *sym)
{
    expression *res;

    if (!expr || !sym) {
        return NULL;
    }

    if (!expr->expr_lvalue) {
        aux_error("operator '.' needs lvalue");
        return NULL;
    }

    if (!TYPE_IS_STRUCTURE_UNION(expr->expr_type)) {
        aux_error("invalid type for '.': structure or union expected");
        return NULL;
    }

    res = expr_get_address(expr);
    res = _real_indirect_field_access(res, sym, expr->expr_type);
    return res;
}

expression *expr_create_indirect_field_access(expression *expr, symbol *sym)
{
    data_type *struct_type;

    if (!expr || !sym) {
        return NULL;
    }

    if (!TYPE_IS_NONFUNC_POINTER(expr->expr_type)) {
        aux_error("invalid type for '->': pointer to structure or union expected");
        return NULL;
    }

    struct_type = expr->expr_type->data.ptr.item_type;

    if (!TYPE_IS_STRUCTURE_UNION(struct_type)) {
        aux_error("invalid type for '->': pointer to structure or union expected");
        return NULL;
    }

    return _real_indirect_field_access(expr, sym, struct_type);
}

expression *expr_create_function_call(expression *address, expression_list *args)
{
    data_type *address_type;
    expression *res, *arg, *new_arg;
    parameter *param;
    int i;
    BOOL ellipsis_reached = FALSE;


    if (!address) {
        return NULL;
    }

    // проверяем тип выражения с адресом функции
    if (TYPE_IS_POINTER(address->expr_type)) {
        address_type = address->expr_type->data.ptr.item_type;
    } else {
        address_type = address->expr_type;
    }

    if (!TYPE_IS_FUNCTION(address_type)) {
        aux_error("function call to something that is not a function");
        return NULL;
    }

    if (!args) {
        args = allocator_alloc(allocator_temporary_pool, sizeof(expression_list));
        args->expr_first = args ->expr_last = NULL;
    }


    // создаём результирующее выражение
    res = _create_expr(code_expr_function_call, address_type->data.function.result_type);
    res->data.function_call.address = address;
    res->data.function_call.args    = args;


    // проверяем типы аргументов и делаем необходимые преобразования типов
    param   = address_type->data.function.parameters_list->param_first;
    arg     = args->expr_first;

    for (i = 0; param || arg; i++, arg = arg->expr_next, param = param->param_next) {
        if (!arg) {
            if (param->param_code == code_ellipsis_parameter) {
                break;
            } else {
                aux_error("function call: too short arguments list");
                return NULL;
            }
        } else if (!param && !ellipsis_reached) {
            aux_error("function call: too long arguments list");
            return NULL;
        }

        if (param->param_code == code_ellipsis_parameter) {
            ellipsis_reached = TRUE;
        }

        new_arg = arg;

        if (ellipsis_reached) {
            if (arg->expr_type->type_code == code_type_float) {
                _silent_cast_to_arithmetic_type(&new_arg, code_type_double);
            } else {
                new_arg = _integral_promotion(new_arg);
            }
        } else if (!type_are_same(param->param_type, arg->expr_type)) {
            if (!_try_silently_cast(&new_arg, param->param_type)) {
                aux_error("function call: wrong type of parameter #%d", i);
                return NULL;
            }
        }

        if (new_arg != arg) {
            if (arg->expr_prev) {
                arg->expr_prev->expr_next = new_arg;
            } else {
                args->expr_first = new_arg;
            }

            if (arg->expr_next) {
                arg->expr_next->expr_prev = new_arg;
            } else {
                args->expr_last = new_arg;
            }

            new_arg->expr_prev = arg->expr_prev;
            new_arg->expr_next = arg->expr_next;
        }
    }

    for (arg = args->expr_first; arg; arg = arg->expr_next) {
        arg->expr_parent = res;
    }

    return res;
}

expression_list *expr_create_expression_list(expression *expr)
{
    expression_list *res;

    if (!expr) {
        return NULL;
    }

    res             = allocator_alloc(allocator_temporary_pool, sizeof(expression_list));
    expr            = _generate_pointer(expr, TRUE, TRUE);

    res->expr_first = expr;
    res->expr_last  = expr;

    return res;
}

expression_list *expr_add_expression_to_list(expression_list *comma_list, expression *expr)
{
    if (!expr || !comma_list) {
        return NULL;
    }

    expr            = _generate_pointer(expr, TRUE, TRUE);

    comma_list->expr_last->expr_next    = expr;
    expr->expr_prev                     = comma_list->expr_last;
    comma_list->expr_last               = expr;

    return comma_list;
}

expression *expr_create_sizeof(expression *expr)
{
    if (!expr) {
        return NULL;
    }

    expr = _generate_pointer(expr, FALSE, TRUE);
    return expr_create_sizeof_type(expr->expr_type);
}

expression *expr_create_sizeof_type(data_type *type)
{
    int size;

    if (!type) {
        return NULL;
    }

    size = type_calculate_sizeof(type);
    return expr_create_from_integer(size, type_create_arithmetic(code_type_unsigned_int));
}


static expression *_get_address(expression *expr)
{
    expression *res;

    ASSERT(expr->expr_lvalue);

    res                         = _create_arithmetic(type_create_pointer_node(expr->expr_type));
    res->data.arithm.opcode     = op_get_address;
    res->data.arithm.operand1   = expr;
    res->expr_lvalue            = FALSE;

    expr->expr_parent           = res;
    return res;
}

expression *expr_get_address(expression *expr)
{
    if (!expr) {
        return NULL;
    }

    expr = _generate_pointer(expr, TRUE, FALSE);

    if (!expr->expr_lvalue) {
        aux_error("operator '&' needs lvalue");
        return NULL;
    }

    return _get_address(expr);
}

static BOOL _is_allowed_cast_of_same_size(data_type *from, data_type *to)
{
    if (TYPE_IS_X86_BYTE(from) && TYPE_IS_X86_BYTE(to)) {
        return TRUE;
    } else if (TYPE_IS_X86_WORD(from) && TYPE_IS_X86_WORD(to)) {
        return TRUE;
    } else if (TYPE_IS_X86_DWORD(from) && TYPE_IS_X86_DWORD(to)) {
        return TRUE;
    } else if (TYPE_IS_X86_QWORD(from) && TYPE_IS_X86_QWORD(to)) {
        return TRUE;
    } else
        return FALSE;
}

static BOOL _try_generate_int_cast(expression **res, data_type *from, data_type *to)
{
    arithmetic_opcode type_cast;

    if (TYPE_IS_POINTER(from) && TYPE_IS_INTEGRAL(to)) {
        if (TYPE_IS_X86_BYTE(to))
            type_cast = op_convert_int2char;
        else if (TYPE_IS_X86_WORD(to))
            type_cast = op_convert_int2short;
        else if (TYPE_IS_X86_QWORD(to))
            type_cast = op_convert_int2longlong;
        else
            ASSERT(FALSE);  // должно быть обработано в _is_allowed_cast_of_same_size

        return TRUE;
    } else if (TYPE_IS_INTEGRAL(from) && TYPE_IS_POINTER(to)) {
        if (from->type_code == code_type_char)
            type_cast = op_convert_char2int;
        else if (from->type_code == code_type_unsigned_char)
            type_cast = op_convert_uchar2uint;
        else if (from->type_code == code_type_short)
            type_cast = op_convert_short2int;
        else if (from->type_code == code_type_unsigned_short)
            type_cast = op_convert_ushort2uint;
        else if (from->type_code == code_type_long_long)
            type_cast = op_convert_longlong2int;
        else if (from->type_code == code_type_unsigned_long_long)
            type_cast = op_convert_ushort2uint;
        else
            ASSERT(FALSE);  // должно быть обработано в _is_allowed_cast_of_same_size

        return TRUE;
    } else if (TYPE_IS_ARITHMETIC(from) && TYPE_IS_ARITHMETIC(to)) {
        if (from->type_code == code_type_char) {
            if (TYPE_IS_X86_WORD(to))
                type_cast = op_convert_char2short;
            else if (TYPE_IS_X86_DWORD(to))
                type_cast = op_convert_char2int;
            else if (TYPE_IS_X86_QWORD(to))
                type_cast = op_convert_char2longlong;
            else
                ASSERT(FALSE);
        } else if (from->type_code == code_type_unsigned_char) {
            if (TYPE_IS_X86_WORD(to))
                type_cast = op_convert_uchar2ushort;
            else if (TYPE_IS_X86_DWORD(to))
                type_cast = op_convert_uchar2uint;
            else if (TYPE_IS_X86_QWORD(to))
                type_cast = op_convert_uchar2ulonglong;
            else
                ASSERT(FALSE);
        } else if (from->type_code == code_type_short) {
            if (TYPE_IS_X86_BYTE(to))
                type_cast = op_convert_short2char;
            else if (TYPE_IS_X86_DWORD(to))
                type_cast = op_convert_short2int;
            else if (TYPE_IS_X86_QWORD(to))
                type_cast = op_convert_short2longlong;
            else
                ASSERT(FALSE);
        } else if (from->type_code == code_type_unsigned_short) {
            if (TYPE_IS_X86_BYTE(to))
                type_cast = op_convert_ushort2uchar;
            else if (TYPE_IS_X86_DWORD(to))
                type_cast = op_convert_ushort2uint;
            else if (TYPE_IS_X86_QWORD(to))
                type_cast = op_convert_ushort2ulonglong;
            else
                ASSERT(FALSE);
        } else if (from->type_code == code_type_int || from->type_code == code_type_enum) {
            if (TYPE_IS_X86_BYTE(to))
                type_cast = op_convert_int2char;
            else if (TYPE_IS_X86_WORD(to))
                type_cast = op_convert_int2short;
            else if (TYPE_IS_X86_QWORD(to))
                type_cast = op_convert_int2longlong;
            else
                ASSERT(FALSE);
        } else if (from->type_code == code_type_unsigned_int) {
            if (TYPE_IS_X86_BYTE(to))
                type_cast = op_convert_uint2uchar;
            else if (TYPE_IS_X86_WORD(to))
                type_cast = op_convert_uint2ushort;
            else if (TYPE_IS_X86_QWORD(to))
                type_cast = op_convert_uint2ulonglong;
            else
                ASSERT(FALSE);
        } else if (from->type_code == code_type_long_long) {
            if (TYPE_IS_X86_BYTE(to))
                type_cast = op_convert_longlong2char;
            else if (TYPE_IS_X86_WORD(to))
                type_cast = op_convert_longlong2short;
            else if (TYPE_IS_X86_DWORD(to))
                type_cast = op_convert_longlong2int;
            else
                ASSERT(FALSE);
        } else if (from->type_code == code_type_unsigned_long_long) {
            if (TYPE_IS_X86_BYTE(to))
                type_cast = op_convert_ulonglong2uchar;
            else if (TYPE_IS_X86_WORD(to))
                type_cast = op_convert_ulonglong2ushort;
            else if (TYPE_IS_X86_DWORD(to))
                type_cast = op_convert_ulonglong2uint;
            else
                ASSERT(FALSE);
        } else
            ASSERT(FALSE);

        return TRUE;
    } else
        return FALSE;

    *res = expr_create_unary(*res, type_cast);
    return TRUE;
}

static BOOL _try_generate_float_cast(expression **res, data_type *from, data_type *to)
{
    BOOL allowed;

    if (TYPE_IS_FLOATING(from) && TYPE_IS_FLOATING(to)) {
        return TRUE;
    } else if (TYPE_IS_INTEGRAL(from) && TYPE_IS_FLOATING(to)) {
        if (!TYPE_IS_X86_DWORD(from)) {
            allowed = _try_generate_int_cast(res, from, type_create_arithmetic(code_type_int));
            ASSERT(allowed);
        }

        *res = expr_create_unary(*res, op_convert_int2float);
        return TRUE;
    } else if (TYPE_IS_FLOATING(from) && TYPE_IS_INTEGRAL(to)) {
        *res = expr_create_unary(*res, op_convert_float2int);

        if (!TYPE_IS_X86_DWORD(to)) {
            allowed = _try_generate_int_cast(res, type_create_arithmetic(code_type_int), to);
            ASSERT(allowed);
        }

        return TRUE;
    } else
        return FALSE;
}

expression *expr_create_type_cast(expression *expr, data_type *type)
{
    expression *res = expr;

    if (!expr || !type) {
        return NULL;
    }

    expr = _generate_pointer(expr, TRUE, TRUE);

    if (type_are_same(expr->expr_type, type)) {
        res = expr;
    } else if (_try_generate_float_cast(&res, expr->expr_type, type)) {
        res->expr_type = type;
    } else if (_is_allowed_cast_of_same_size(expr->expr_type, type)) {
        res->expr_type = type;
    } else if (_try_generate_int_cast(&res, expr->expr_type, type)) {
        res->expr_type = type;
    } else {
        aux_error("invalid type cast");
    }

    return res;
}


// Итератор для рекурсивного обхода подвыражений.

static void _inner_iterate_subexpr(expression *expr, expression_code filter, int flags,
    void (*callback)(expression *, void *), void *arg)
{
    expression *argument;

    if (!(flags & EXPR_IT_CHILDREN_FIRST) && (!(flags & EXPR_IT_APPLY_FILTER) || expr->expr_code == filter)) {
        callback(expr, arg);
    }

    if (!(flags & EXPR_IT_ROOT_ONLY)) {
        switch (expr->expr_code) {
        case code_expr_float_constant:
        case code_expr_int_constant:
        case code_expr_symbol:
        case code_expr_label:
            // термильаное выражение
            break;

        case code_expr_arithmetic:
            _inner_iterate_subexpr(expr->data.arithm.operand1, filter, flags, callback, arg);

            if (!IS_UNARY_OP(expr->data.arithm.opcode)) {
                _inner_iterate_subexpr(expr->data.arithm.operand2, filter, flags, callback, arg);
            }
            break;

        case code_expr_function_call:
            _inner_iterate_subexpr(expr->data.function_call.address, filter, flags, callback, arg);

            for (argument = expr->data.function_call.args->expr_first; argument; argument = argument->expr_next) {
                _inner_iterate_subexpr(argument, filter, flags, callback, arg);
            }
            break;

        case code_expr_return:
            if (expr->data.ret_value) {
                _inner_iterate_subexpr(expr->data.ret_value, filter, flags, callback, arg);
            }
            break;

        case code_expr_jump:
            if (expr->data.jump.condition) {
                _inner_iterate_subexpr(expr->data.jump.condition, filter, flags, callback, arg);
            }
            break;

        default:
            ASSERT(FALSE);
        }
    }

    if ((flags & EXPR_IT_CHILDREN_FIRST) && (!(flags & EXPR_IT_APPLY_FILTER) || expr->expr_code == filter)) {
        callback(expr, arg);
    }
}

void expr_iterate_through_subexpressions(expression *root, expression_code filter, int flags,
    void (*callback)(expression *, void *), void *arg)
{
    expression *expr, *next;

    for (expr = root; expr; expr = next) {
        next = expr->expr_next;

        switch (expr->expr_code) {
        case code_expr_arithmetic:
        case code_expr_function_call:
        case code_expr_return:
        case code_expr_jump:
        case code_expr_label:
            _inner_iterate_subexpr(expr, filter, flags, callback, arg);
            break;

        default:
            ASSERT(FALSE);
        }

        if (flags & EXPR_IT_DONT_ADVANCE) {
            break;
        }
    }
}

expression *expr_create_label(int label)
{
    expression *res;

    res             = _create_expr(code_expr_label, NULL);
    res->data.label = label;

    return res;
}

