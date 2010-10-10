
#include "common.h"
#include "unit.h"


static expression *_expr_get_address(expression *expr);
static expression *_expr_create_binary_arithm_expr(arithmetic_opcode opcode, expression *op1, expression *op2, data_type *type);


static expression *_expr_create(expression_code code, data_type *type)
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

static expression *_expr_create_arithmetic(data_type *type)
{
    return _expr_create(code_expr_arithmetic, type);
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

static BOOL _expr_are_pointer_and_index(expression *ptr, expression *index)
{
    return TYPE_IS_INTEGRAL(index->expr_type) && TYPE_IS_POINTER(ptr->expr_type);
}

static expression *_expr_add_offset_to_raw_pointer(expression *ptr, expression *index, int subtract)
{
    if (index->expr_code == code_expr_int_constant && index->data.int_const == 0) {
        return ptr;
    } else {
        return _expr_create_binary_arithm_expr((subtract ? op_sub : op_add), ptr, index, ptr->expr_type);
    }
}

static expression *_expr_add_offset_to_sized_pointer(expression *ptr, expression *index, BOOL subtract)
{
    int             item_type_size;
    expression *    res;
    data_type *     int_type;

    ASSERT(TYPE_IS_POINTER(ptr->expr_type));
    item_type_size  = type_calculate_sizeof(ptr->expr_type->data.ptr.item_type);

    if (item_type_size == 0) {
        aux_error("indexing of void pointers is forbidden");
        return NULL;
    } else if (item_type_size > 1) {
        int_type    = type_create_arithmetic(code_type_int);
        index       = _expr_create_binary_arithm_expr(op_mul, index, expr_create_from_integer(item_type_size, int_type), int_type);
    }

    res             = _expr_add_offset_to_raw_pointer(ptr, index, subtract);
    res->expr_type  = ptr->expr_type;

    return res;
}

static expression *_expr_generate_pointer(expression *expr, BOOL allow_array, BOOL allow_function)
{
    expression *res = expr;

    if (TYPE_IS_ARRAY(expr->expr_type)) {
        if (allow_array) {
            res             = _expr_get_address(expr);
            res->expr_type  = type_create_pointer_node(expr->expr_type->data.array.item_type);
        }
    } else if (TYPE_IS_FUNCTION(expr->expr_type)) {
        if (allow_function) {
            res             = _expr_get_address(expr);
            res->expr_type  = type_create_pointer_node(expr->expr_type);
        }
    }

    return res;
}


static expression *_expr_evaluate_const_int_unary_expression(arithmetic_opcode opcode, int value, data_type *type)
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

static expression *_expr_evaluate_const_float_unary_expression(arithmetic_opcode opcode, double value, data_type *type)
{
    if (opcode == op_convert_float2int) {
        return expr_create_from_integer((int) value, type);
    } else {
        ASSERT(opcode == op_neg);
        return expr_create_from_float(-value, type);
    }
}

static expression *_expr_evaluate_const_int_binary_expression(arithmetic_opcode opcode, int val1, int val2, data_type *type)
{
    expression *res = _expr_create(code_expr_int_constant, type);

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

static expression *_expr_evaluate_const_float_binary_expression(arithmetic_opcode opcode, double val1, double val2, data_type *type)
{
    expression *res;

    if (IS_COMPARE_OP(opcode)) {
        res = _expr_create(code_expr_int_constant, type);
    } else {
        res = _expr_create(code_expr_float_constant, type);
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

    expr = _expr_generate_pointer(expr, !IS_INCREMENT_DECREMENT(opcode), TRUE);

    // semantic checks
    if (IS_INTERNAL(opcode)) {
        // internally-generated, so we should be ok with them
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

    // construct the expression
    res                         = _expr_create_arithmetic(expr->expr_type);
    res->data.arithm.opcode     = opcode;
    res->data.arithm.operand1   = expr;
    expr->expr_parent           = res;

    if (IS_INCREMENT_DECREMENT(opcode) && TYPE_IS_POINTER(expr->expr_type)) {
        res->data.arithm.step = type_calculate_sizeof(expr->expr_type->data.ptr.item_type);
    } else {
        res->data.arithm.step = 1;
    }

    // evaluate constant expressions
    if (IS_INT_CONSTANT_EXPR(expr)) {
        if (opcode != op_dereference) {
            res = _expr_evaluate_const_int_unary_expression(opcode, expr->data.int_const, res->expr_type);
        }
    } else if (IS_FLOAT_CONSTANT_EXPR(expr)) {
        res = _expr_evaluate_const_float_unary_expression(opcode, expr->data.float_const.val, res->expr_type);
    }

    return res;
}


#define IS_POT(X) ((X & (X - 1)) == 0)

static int log2(int x)
{
    int res = 0;
    while (x >>= 1) res++;
    return res;
}


static expression *_expr_try_optimize_constant_operand(arithmetic_opcode opcode, expression *e1, expression *e2, data_type *type)
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
            return _expr_create_binary_arithm_expr(op_assign, e1, expr_create_from_integer(1, type), type);
        }
    }

    if (IS_POT(val)) {
        log = expr_create_from_integer(log2(val), type);

        if (opcode == op_mul) {
            return _expr_create_binary_arithm_expr(op_shl, e1, log, type);
        } else if (opcode == op_mul_assign) {
            return _expr_create_binary_arithm_expr(op_shl_assign, e1, log, type);
        } else if (opcode == op_div) {
            return _expr_create_binary_arithm_expr(op_shr, e1, log, type);
        } else if (opcode == op_div_assign) {
            return _expr_create_binary_arithm_expr(op_shr_assign, e1, log, type);
        } else if (opcode == op_mod) {
            log->data.int_const--;
            return _expr_create_binary_arithm_expr(op_and, e1, log, type);
        } else if (opcode == op_mod_assign) {
            log->data.int_const--;
            return _expr_create_binary_arithm_expr(op_and_assign, e1, log, type);
        }
    }

    return NULL;
}

static expression *_expr_create_binary_arithm_expr(arithmetic_opcode opcode, expression *e1, expression *e2, data_type *type)
{
    expression *res;

    // check for division by zero
    if ((opcode == op_div || opcode == op_mod || opcode == op_div_assign || opcode == op_mod_assign)
        && IS_INT_CONSTANT_EXPR(e2) && e2->data.int_const == 0) {
            aux_error("constant division by zero");
            return NULL;
        }

    // try to evaluate constant expressions
    if (IS_INT_CONSTANT_EXPR(e1) && IS_INT_CONSTANT_EXPR(e2)) {
        return _expr_evaluate_const_int_binary_expression(opcode, e1->data.int_const, e2->data.int_const, type);
    } else if (IS_FLOAT_CONSTANT_EXPR(e1) && IS_FLOAT_CONSTANT_EXPR(e2)) {
        return _expr_evaluate_const_float_binary_expression(opcode, e1->data.float_const.val, e2->data.float_const.val, type);
    }

    // try to optimize div to right shift, etc
    if (IS_INT_CONSTANT_EXPR(e2)) {
        res = _expr_try_optimize_constant_operand(opcode, e1, e2, type);

        if (res) {
            return res;
        }
    } else if (IS_INT_CONSTANT_EXPR(e1) && (opcode == op_mul || opcode == op_add)) {
        res = _expr_try_optimize_constant_operand(opcode, e2, e1, type);

        if (res) {
            return res;
        }
    }

    // create expression node
    res = _expr_create_arithmetic(type);
    res->data.arithm.opcode     = opcode;
    res->data.arithm.operand1   = e1;
    res->data.arithm.operand2   = e2;

    e1->expr_parent             = res;
    e2->expr_parent             = res;

    return res;
}

expression *expr_create_binary(expression *e1, expression *e2, arithmetic_opcode opcode)
{
    data_type *res_type;

    e1 = _expr_generate_pointer(e1, !IS_ASSIGN_OP(opcode), TRUE);
    e2 = _expr_generate_pointer(e2, TRUE, TRUE);

    // TODO: type check

    // handle pointer arithmetic
    if (opcode == op_add || opcode == op_sub) {
        if (_expr_are_pointer_and_index(e1, e2)) {
            return _expr_add_offset_to_sized_pointer(e1, e2, opcode == op_sub);
        } else if (_expr_are_pointer_and_index(e2, e1)) {
            return _expr_add_offset_to_sized_pointer(e2, e1, opcode == op_sub);
        }
    }

    // first operand must be lvalue for self-modifying expressions
    if (IS_SELF_MOD_OP(opcode)) {
        if (!e1->expr_lvalue) {
            aux_error("operator '%s' needs lvalue as first operand", expr_print_opcode_to_user(opcode));
            return NULL;
        }
    }

    // type promotion. FIXME: support arithmetic transformations for all types.
    if (e1->expr_type->type_code == code_type_int && e2->expr_type->type_code == code_type_float) {
        if (IS_ASSIGN_OP(opcode)) {
            e2 = expr_create_type_cast(e2, e1->expr_type);
        } else {
            e1 = expr_create_type_cast(e1, e2->expr_type);
        }
    } else if (e1->expr_type->type_code == code_type_float && e2->expr_type->type_code == code_type_int) {
        e2 = expr_create_type_cast(e2, e1->expr_type);
    }

    // deduce operand type. Compare operations always have integer result
    if (IS_COMPARE_OP(opcode)) {
        res_type = type_create_arithmetic(code_type_int);
    } else {
        res_type = e1->expr_type;
    }

    return _expr_create_binary_arithm_expr(opcode, e1, e2, res_type);
}

expression *expr_create_ternary(expression *e1, expression *e2, expression *e3)
{
    symbol *        tmp;
    int             if_dest, end_dest;
    expression *    expr;

    // TODO: type check and arithmetic transformations.

    e1 = _expr_generate_pointer(e1, TRUE, TRUE);
    e2 = _expr_generate_pointer(e2, TRUE, TRUE);
    e3 = _expr_generate_pointer(e3, TRUE, TRUE);

    if (!type_are_same(e2->expr_type, e3->expr_type)) {
        aux_error("operator ?: second and third operand must be of the same type");
        return NULL;
    }

    tmp         = unit_create_temporary_variable(e2->expr_type);
    if_dest     = unit_create_label_and_push_jump(e1, TRUE);

    expr        = expr_create_binary(expr_create_from_identifier(tmp), e2, op_assign);
    unit_push_expression(expr);

    end_dest    = unit_create_label_and_push_jump(NULL, TRUE);
    unit_place_label(if_dest);

    expr        = expr_create_binary(expr_create_from_identifier(tmp), e3, op_assign);
    unit_push_expression(expr);

    unit_place_label(end_dest);

    expr        = expr_create_from_identifier(tmp);
    return expr;
}

expression *expr_create_from_identifier(symbol *sym)
{
    expression *res;

    if (sym->sym_code == code_sym_unknown) {
        aux_error("unknown identifier: '%s'", sym->sym_name);
        symbol_free(sym, TRUE);
    }

    res             = _expr_create(code_expr_symbol, sym->sym_type);
    res->data.sym   = sym;

    return res;
}

expression *expr_create_from_integer(long val, data_type *type)
{
    expression *res     = _expr_create(code_expr_int_constant, type);

    res->data.int_const = val;
    return res;
}

expression *expr_create_from_float(double val, data_type *type)
{
    expression *res    = _expr_create(code_expr_float_constant, type);

    res->data.float_const.val = val;
    return res;
}

expression *expr_create_from_string(char *str)
{
    expression *res    = _expr_create(code_expr_string, type_create_string());

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

    res                         = _expr_create(code_expr_jump, NULL);
    res->data.jump.destination  = destination;
    res->data.jump.condition    = condition;
    res->data.jump.invert_cond  = invert_condition;

    if (condition) {
        condition->expr_parent  = res;
    }

    return res;
}

expression *expr_create_return(expression *result)
{
    expression *res;

    // TODO: check types and probably insert a type cast.
    res                 = _expr_create(code_expr_return, NULL);
    res->data.ret_value = result;

    if (result) {
        result->expr_parent = res;
    }

    return res;
}


expression *expr_create_array_indexing(expression *e1, expression *e2)
{
    expression *res;

    e1 = _expr_generate_pointer(e1, TRUE, TRUE);
    e2 = _expr_generate_pointer(e2, TRUE, TRUE);

    if (_expr_are_pointer_and_index(e1, e2)) {
        res = _expr_add_offset_to_sized_pointer(e1, e2, FALSE);
    } else if (_expr_are_pointer_and_index(e2, e1)) {
        return _expr_add_offset_to_sized_pointer(e2, e1, FALSE);
    } else {
        aux_error("invalid types for '[]'");
        return NULL;
    }

    res = expr_dereference(res);
    return res;
}

static expression *_expr_dereference(expression *expr, data_type *type)
{
    expression *res;

    res                         = _expr_create_arithmetic(type);
    res->data.arithm.opcode     = op_dereference;
    res->data.arithm.operand1   = expr;
    res->expr_lvalue            = TRUE;

    expr->expr_parent           = res;
    return res;
}

expression *expr_dereference(expression *expr)
{
    expr = _expr_generate_pointer(expr, TRUE, TRUE);

    if (!TYPE_IS_POINTER(expr->expr_type)) {
        aux_error("operator '*' needs pointer");
        return NULL;
    }

    return _expr_dereference(expr, expr->expr_type->data.ptr.item_type);
}

expression *_expr_real_indirect_field_access(expression *expr, symbol *sym, data_type *struct_type)
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
        res = _expr_add_offset_to_raw_pointer(expr, expr_create_from_integer(member_offset,
            type_create_arithmetic(code_type_int)), FALSE);
    }

    res = _expr_dereference(res, member_type);
    return res;
}

expression *expr_create_direct_field_access(expression *expr, symbol *sym)
{
    expression *res;

    if (!expr->expr_lvalue) {
        aux_error("operator '.' needs lvalue");
        return NULL;
    }

    if (!TYPE_IS_STRUCTURE_UNION(expr->expr_type)) {
        aux_error("invalid type for '.': structure or union expected");
        return NULL;
    }

    res = expr_get_address(expr);
    res = _expr_real_indirect_field_access(res, sym, expr->expr_type);
    return res;
}

expression *expr_create_indirect_field_access(expression *expr, symbol *sym)
{
    data_type *struct_type;

    if (!TYPE_IS_NONFUNC_POINTER(expr->expr_type)) {
        aux_error("invalid type for '->': pointer to structure or union expected");
        return NULL;
    }

    struct_type = expr->expr_type->data.ptr.item_type;

    if (!TYPE_IS_STRUCTURE_UNION(struct_type)) {
        aux_error("invalid type for '->': pointer to structure or union expected");
        return NULL;
    }

    return _expr_real_indirect_field_access(expr, sym, struct_type);
}

expression *expr_create_function_call(expression *address, expression_list *args)
{
    data_type *address_type;
    expression *res, *arg, *converted;
    parameter *param;
    int i;


    // check type of function-expression
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


    // construct resulting expression
    res = _expr_create(code_expr_function_call, address_type->data.function.result_type);
    res->data.function_call.address             = address;
    res->data.function_call.args                = args;
    res->data.function_call.ellipsis_position   = INT_MAX;


    // check argument type matching and do proper type casting
    param   = address_type->data.function.parameters_list->param_first;
    arg     = args->expr_first;

    for (i = 0; param && arg; i++, arg = arg->expr_next) {
        if (!param || !arg) {
            aux_error("function call: number of actual parameters differs from number of format parameters");
            return NULL;
        }

        if (param->param_code == code_ellipsis_parameter) {
            res->data.function_call.ellipsis_position = i;
            break;
        }

        if (!type_are_same(param->param_type, arg->expr_type)) {
            // if we can silently convert types, do that
            if (TYPE_IS_ARITHMETIC(param->param_type) && TYPE_IS_ARITHMETIC(arg->expr_type)) {
                converted                   = expr_create_type_cast(arg, param->param_type);
                converted->expr_next        = arg->expr_next;
                converted->expr_prev        = arg->expr_prev;

                if (arg->expr_next)
                    arg->expr_next->expr_prev = converted;
                if (arg->expr_prev)
                    arg->expr_prev->expr_next = converted;
                else
                    args->expr_first        = converted;

                arg->expr_next              = NULL;
                arg->expr_prev              = NULL;
                arg                         = converted;
            } else {
                aux_error("function call: wrong type of parameter #%d", i);
                return NULL;
            }
        }

        param   = param->param_next;
    }

    for (arg = args->expr_first; arg; arg = arg->expr_next) {
        arg->expr_parent = res;
    }

    return res;
}

expression_list *expr_create_expression_list(expression *expr)
{
    expression_list *res = allocator_alloc(allocator_temporary_pool, sizeof(expression_list));

    expr            = _expr_generate_pointer(expr, TRUE, TRUE);

    res->expr_first = expr;
    res->expr_last  = expr;

    return res;
}

expression_list *expr_add_expression_to_list(expression_list *comma_list, expression *expr)
{
    expr            = _expr_generate_pointer(expr, TRUE, TRUE);

    comma_list->expr_last->expr_next    = expr;
    expr->expr_prev                     = comma_list->expr_last;
    comma_list->expr_last               = expr;

    return comma_list;
}

expression *expr_create_sizeof(expression *expr)
{
    expr = _expr_generate_pointer(expr, FALSE, TRUE);
    return expr_create_sizeof_type(expr->expr_type);
}

expression *expr_create_sizeof_type(data_type *type)
{
    int size        = type_calculate_sizeof(type);

    // FIXME: sizeof should return unsigned type.
    expression *res = expr_create_from_integer(size, type_create_arithmetic(code_type_int));

    return res;
}


static expression *_expr_get_address(expression *expr)
{
    expression *res;

    ASSERT(expr->expr_lvalue);

    res                         = _expr_create_arithmetic(type_create_pointer_node(expr->expr_type));
    res->data.arithm.opcode     = op_get_address;
    res->data.arithm.operand1   = expr;
    res->expr_lvalue            = FALSE;

    expr->expr_parent           = res;
    return res;
}

expression *expr_get_address(expression *expr)
{
    expr = _expr_generate_pointer(expr, TRUE, FALSE);

    if (!expr->expr_lvalue) {
        aux_error("operator '&' needs lvalue");
        return NULL;
    }

    return _expr_get_address(expr);
}

static BOOL _is_allowed_automatic_cast(data_type *from, data_type *to)
{
    if (TYPE_IS_POINTER(from) && (TYPE_IS_POINTER(to) || to->type_code == code_type_int)) {
        return TRUE;
    }

    if (from->type_code == code_type_int && TYPE_IS_POINTER(to)) {
        return TRUE;
    }

    return FALSE;
}

expression *expr_create_type_cast(expression *expr, data_type *type)
{
    expression *res = expr;

    expr = _expr_generate_pointer(expr, TRUE, TRUE);

    if (type_are_same(expr->expr_type, type)) {
        res = expr;
    } else if (expr->expr_type->type_code == code_type_float && type->type_code == code_type_int) {
        res = expr_create_unary(expr, op_convert_float2int);
        res->expr_type = type;
    } else if (expr->expr_type->type_code == code_type_int && type->type_code == code_type_float) {
        res = expr_create_unary(expr, op_convert_int2float);
        res->expr_type = type;
    } else if (_is_allowed_automatic_cast(expr->expr_type, type)) {
        res->expr_type = type;
    } else {
        // TODO: support all possible type conversations
        aux_error("invalid type cast");
    }

    return res;
}


//  Common subexpressions iterator.

static void _inner_iterate_through_subexpressions(expression *expr, expression_code filter, int flags,
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
           // terminal
            break;

        case code_expr_arithmetic:
            _inner_iterate_through_subexpressions(expr->data.arithm.operand1, filter, flags, callback, arg);

            if (!IS_UNARY_OP(expr->data.arithm.opcode)) {
                _inner_iterate_through_subexpressions(expr->data.arithm.operand2, filter, flags, callback, arg);
            }
            break;

        case code_expr_function_call:
            for (argument = expr->data.function_call.args->expr_first; argument; argument = argument->expr_next) {
                _inner_iterate_through_subexpressions(argument, filter, flags, callback, arg);
            }
            break;

        case code_expr_return:
            if (expr->data.ret_value) {
                _inner_iterate_through_subexpressions(expr->data.ret_value, filter, flags, callback, arg);
            }
            break;

        case code_expr_jump:
            if (expr->data.jump.condition) {
                _inner_iterate_through_subexpressions(expr->data.jump.condition, filter, flags, callback, arg);
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
            _inner_iterate_through_subexpressions(expr, filter, flags, callback, arg);
            break;

        default:
            ASSERT(FALSE);
        }

        if (flags & EXPR_IT_DONT_ADVANCE) {
            break;
        }
    }
}


expression **expr_list2array(expression *first_in_list, int *dst_length)
{
    int i = 0, length = 0;
    expression *expr;
    expression **list;

    for (expr = first_in_list; expr; expr = expr->expr_next) {
        length++;
    }

    list = allocator_alloc(allocator_temporary_pool, length * sizeof(expression *));

    for (expr = first_in_list; expr; expr = expr->expr_next) {
        list[i++] = expr;
    }

    *dst_length = length;
    return list;
}


expression *expr_create_label(int label)
{
    expression *res;

    res             = _expr_create(code_expr_label, NULL);
    res->data.label = label;

    return res;
}

