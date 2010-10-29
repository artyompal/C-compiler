
#include "common.h"
#include "x86_codegen.h"
#include "x86_intrinsics.h"
#include "x86_data.h"
#include "x86_stack_frame.h"
#include "x86_regalloc.h"


static int _last_pseudoreg[x86reg_count];
static function_desc *_curr_func = NULL;


static void _evaluate_nested_expression(expression *expr, x86_operand *res);


int x86_codegen_alloc_pseudoreg(x86_operand_type type)
{
    if (type == x86op_qword) {
        int res = _last_pseudoreg[x86reg_dword]++;
        _last_pseudoreg[x86reg_dword]++;
        return res;
    } else
        return _last_pseudoreg[x86_encode_register_type(type)]++;
}


static x86_instruction_code _opcode_to_unary_int_instruction(arithmetic_opcode opcode)
{
    switch (opcode) {
    case op_neg:            return x86insn_int_neg;
    case op_bitnot:         return x86insn_int_not;
    case op_increment:
    case op_post_increment: return x86insn_int_inc;
    case op_decrement:
    case op_post_decrement: return x86insn_int_dec;
    default:                ASSERT(FALSE);
    }
}

static x86_instruction_code _opcode_to_binary_int_instruction(arithmetic_opcode opcode)
{
    switch (opcode) {
    case op_add:            return x86insn_int_add;
    case op_sub:            return x86insn_int_sub;
    case op_mul:            return x86insn_int_imul;
    case op_div:            return x86insn_int_idiv;
    case op_mod:            return x86insn_int_idiv;
    case op_shl:            return x86insn_int_sal;
    case op_shr:            return x86insn_int_sar;

    case op_and:            return x86insn_int_and;
    case op_xor:            return x86insn_int_xor;
    case op_or:             return x86insn_int_or;

    case op_assign:         return x86insn_int_mov;
    case op_add_assign:     return x86insn_int_add;
    case op_sub_assign:     return x86insn_int_sub;
    case op_mul_assign:     return x86insn_int_imul;
    case op_div_assign:     return x86insn_int_idiv;
    case op_mod_assign:     return x86insn_int_idiv;
    case op_shl_assign:     return x86insn_int_sal;
    case op_shr_assign:     return x86insn_int_sar;
    case op_and_assign:     return x86insn_int_and;
    case op_xor_assign:     return x86insn_int_xor;
    case op_or_assign:      return x86insn_int_or;

    case op_equal:          return x86insn_int_sete;
    case op_non_equal:      return x86insn_int_setne;
    case op_less_equal:     return x86insn_int_setle;
    case op_less_then:      return x86insn_int_setl;
    case op_greater_equal:  return x86insn_int_setge;
    case op_greater_then:   return x86insn_int_setg;

    default:                ASSERT(FALSE);
    }
}

static x86_instruction_code _opcode_to_float_arithm_instruction(arithmetic_opcode opcode)
{
    switch (opcode) {
    case op_add:            return x86insn_fpu_add;
    case op_sub:            return x86insn_fpu_sub;
    case op_mul:            return x86insn_fpu_mul;
    case op_div:            return x86insn_fpu_div;

    case op_assign:         return x86insn_fpu_ld;
    case op_add_assign:     return x86insn_fpu_add;
    case op_sub_assign:     return x86insn_fpu_sub;
    case op_mul_assign:     return x86insn_fpu_mul;
    case op_div_assign:     return x86insn_fpu_div;

    case op_equal:          return x86insn_int_sete;
    case op_non_equal:      return x86insn_int_setne;
    case op_less_equal:     return x86insn_int_setbe;
    case op_less_then:      return x86insn_int_setb;
    case op_greater_equal:  return x86insn_int_setae;
    case op_greater_then:   return x86insn_int_seta;

    default:                ASSERT(FALSE);
    }
}

static x86_instruction_code _invert_compare_instruction(arithmetic_opcode opcode)
{
    switch (opcode) {
    case x86insn_int_setne:    return x86insn_int_setne;
    case x86insn_int_sete:     return x86insn_int_sete;
    case x86insn_int_setg:     return x86insn_int_setl;
    case x86insn_int_setge:    return x86insn_int_setle;
    case x86insn_int_setl:     return x86insn_int_setg;
    case x86insn_int_setle:    return x86insn_int_setge;
    case x86insn_int_seta:     return x86insn_int_setb;
    case x86insn_int_setae:    return x86insn_int_setbe;
    case x86insn_int_setb:     return x86insn_int_seta;
    case x86insn_int_setbe:    return x86insn_int_setae;

    default:                    ASSERT(FALSE);
    }
}


//
// Кодогенерация для унарных выражений.
//

static void _generate_convert_int2float(x86_operand *res, x86_operand *op)
{
    ASSERT(OP_IS_INT(*op) && OP_IS_REGISTER_OR_ADDRESS(*op));

    if (option_use_sse2) {
        bincode_create_operand_and_alloc_pseudoreg(res, x86reg_float);
        unit_push_binary_instruction(x86insn_sse_load_int, res, op);
    } else {
        if (OP_IS_REGISTER(*op)) {
            unit_push_unary_instruction(x86insn_fpu_int2float, op);
        } else {
            unit_push_unary_instruction(x86insn_fpu_ld_int, op);
        }

        res->op_loc     = x86loc_register;
        res->op_type    = x86op_float;
    }
}

static void _generate_convert_float2int(x86_operand *res, x86_operand *op)
{
    x86_operand tmp;

    ASSERT(OP_IS_FLOAT(*op) && OP_IS_REGISTER_OR_ADDRESS(*op));
    bincode_create_operand_and_alloc_pseudoreg(res, x86reg_dword);

    if (option_use_sse2) {
        if (OP_IS_ADDRESS(*op)) {
            bincode_create_operand_and_alloc_pseudoreg(&tmp, x86reg_float);
            unit_push_binary_instruction(x86insn_sse_mov, &tmp, op);
        }

        unit_push_binary_instruction(x86insn_sse_store_int, res, &tmp);
    } else {
        if (OP_IS_ADDRESS(*op)) {
            bincode_create_operand_and_alloc_pseudoreg(&tmp, x86reg_float);
            unit_push_binary_instruction(x86insn_fpu_ld, &tmp, op);
        }

        unit_push_unary_instruction(x86insn_fpu_float2int, res);
    }
}

static void _generate_convert_float2double(x86_operand *res, x86_operand *op)
{
    ASSERT(OP_IS_FLOAT(*op) && OP_IS_REGISTER_OR_ADDRESS(*op));

    if (OP_IS_ADDRESS(*op)) {
        bincode_create_operand_and_alloc_pseudoreg(res, x86reg_float);
        unit_push_unary_instruction(x86insn_fpu_ld, op);
    } else {
        *res = *op;
    }
}

static void _generate_dereference(x86_operand *res, x86_operand *op, data_type *type)
{
    ASSERT(OP_IS_ADDRESS(*op) || OP_IS_REGISTER(*op) && op->op_type == x86reg_dword);

    if (op->op_loc == x86loc_register) {
        bincode_create_operand_addr_from_reg(res, bincode_encode_type(type), op->data.reg);
    } else {
        bincode_create_operand_and_alloc_pseudoreg(res, x86reg_dword);
        unit_push_binary_instruction(x86insn_int_mov, res, op);

        bincode_create_operand_addr_from_reg(res, bincode_encode_type(type), res->data.reg);
    }
}

static void _generate_get_address(x86_operand *res, x86_operand *op)
{
    ASSERT(OP_IS_ADDRESS(*op));

    if (op->data.address.base != 0 && op->data.address.index == 0 && op->data.address.offset == 0) {
        bincode_create_operand_from_pseudoreg(res, x86reg_dword, op->data.address.base);
    } else {
        bincode_create_operand_and_alloc_pseudoreg(res, x86reg_dword);
        unit_push_binary_instruction(x86insn_lea, res, op);
    }
}

static void _generate_int2bool(x86_operand *res, x86_operand *op, BOOL invert)
{
    x86_operand tmp;

    ASSERT(OP_IS_INT(*op));

    if (op->op_loc == x86loc_address) {
        bincode_create_operand_and_alloc_pseudoreg(&tmp, x86reg_dword);
        unit_push_binary_instruction(x86insn_int_mov, &tmp, op);
        unit_push_binary_instruction(x86insn_int_test, &tmp, &tmp);
    } else {
        unit_push_binary_instruction(x86insn_int_test, op, op);
    }

    bincode_create_operand_and_alloc_pseudoreg(res, x86reg_byte);
    unit_push_unary_instruction(invert ? x86insn_int_sete : x86insn_int_setne, res);
}


#define CONVERT_INCDEC_TO_BINARY(CODE) ((x86_instruction_code) (CODE + 5))

static void _generate_inc_dec(expr_arithm *arithm, x86_operand *op, data_type *type)
{
    x86_instruction_code insn = _opcode_to_unary_int_instruction(arithm->opcode);

    ASSERT(OP_IS_INT(*op) && OP_IS_REGISTER_OR_ADDRESS(*op));
    // TODO: provide an optimized codepath for x86loc_address case: return value in the register if it will be reused.

    if (IS_INCREMENT_DECREMENT(arithm->opcode) && arithm->step != 1) {
        x86_instruction_code bin = CONVERT_INCDEC_TO_BINARY(insn);
        x86_operand op2;

        bincode_create_operand_from_int_constant(&op2, bincode_encode_type(type), arithm->step);
        unit_push_binary_instruction(bin, op, &op2);
    } else {
        unit_push_unary_instruction(insn, op);
    }
}

static void _generate_common_unary_arithm_expr(expression *expr, x86_operand *res, x86_operand *op)
{
    *res = *op;

    if (TYPE_IS_INTEGRAL_OR_POINTER(expr->expr_type)) {
        if (IS_INCREMENT_DECREMENT(expr->data.arithm.opcode)) {
            if (!expr->expr_parent) {
                _generate_inc_dec(&expr->data.arithm, op, expr->expr_type);
                res->op_loc = x86loc_none;
            } else {
                if (IS_POST_OPERATION(expr->data.arithm.opcode)) {
                    bincode_create_operand_and_alloc_pseudoreg(res, op->op_type);
                    unit_push_binary_instruction(x86insn_int_mov, res, op);
                    _generate_inc_dec(&expr->data.arithm, op, expr->expr_type);
                } else {
                    _generate_inc_dec(&expr->data.arithm, op, expr->expr_type);
                }
            }
        } else {
            unit_push_unary_instruction(_opcode_to_unary_int_instruction(expr->data.arithm.opcode), op);
        }
    } else {
        ASSERT(expr->data.arithm.opcode == op_neg);

        if (op->op_loc == x86loc_address) {
            unit_push_unary_instruction(x86insn_fpu_ld, op);
        }

        unit_push_nullary_instruction(x86insn_fpu_zero);

        bincode_create_operand_and_alloc_pseudoreg(res, op->op_type);
        unit_push_unary_instruction(x86insn_fpu_subr, res);
    }
}


//
// Кодогенерация для бинарных выражений.
//

static void _generate_int_binary_expr(expression *expr, x86_operand *res, x86_operand *op1, x86_operand *op2)
{
    x86_instruction_code insn = _opcode_to_binary_int_instruction(expr->data.arithm.opcode);
    x86_operand tmp;

    ASSERT(OP_IS_INT(*op1) && OP_IS_REGISTER_OR_ADDRESS(*op1));
    ASSERT(OP_IS_INT(*op2) && OP_IS_REGISTER_OR_ADDRESS(*op2));
    ASSERT(op1->op_type == op2->op_type);

    // TODO: unsigned div/mod, compare, mul, shr/sar
    // TODO: generate SHL/SHR eax,cl
    // TODO: support long long arithmetics.

    *res = *op1;

    if (IS_COMPARE_OP(expr->data.arithm.opcode)) {
        if (op1->op_loc == x86loc_address && op2->op_loc == x86loc_address) {
            bincode_create_operand_and_alloc_pseudoreg(&tmp, op1->op_type);
            unit_push_binary_instruction(x86insn_int_mov, &tmp, op1);
            unit_push_binary_instruction(x86insn_int_cmp, &tmp, op2);
        } else {
            unit_push_binary_instruction(x86insn_int_cmp, op1, op2);
        }

        bincode_create_operand_and_alloc_pseudoreg(&tmp, x86reg_byte);
        unit_push_unary_instruction(insn, &tmp);

        bincode_create_operand_and_alloc_pseudoreg(res, x86reg_dword);
        unit_push_binary_instruction(x86insn_movzx, res, &tmp);
    } else if (IS_DIVISION_OP(expr->data.arithm.opcode) || IS_MODULO_OP(expr->data.arithm.opcode)) {
        bincode_create_operand_from_register(res, x86reg_dword, x86reg_eax);
        unit_push_binary_instruction(x86insn_int_mov, res, op1);
        unit_push_nullary_instruction(x86insn_cdq);
        unit_push_unary_instruction(x86insn_int_idiv, op2);

        if (IS_MODULO_OP(expr->data.arithm.opcode)) {
            bincode_create_operand_from_register(res, x86reg_dword, x86reg_edx);
        }
    } else if (IS_ASSIGN_OP(expr->data.arithm.opcode)) {
        ASSERT(op1->op_loc == x86loc_address);

        if (op2->op_loc == x86loc_address) {
            bincode_create_operand_and_alloc_pseudoreg(res, op1->op_type);

            if (insn != x86insn_int_mov) {
                unit_push_binary_instruction(x86insn_int_mov, res, op1);
            }

            unit_push_binary_instruction(insn, res, op2);
            unit_push_binary_instruction(x86insn_int_mov, op1, res);
        } else {
            unit_push_binary_instruction(insn, op1, op2);
        }
    } else if (op1->op_loc == x86loc_address) {
        if (op2->op_loc == x86loc_register && (insn == x86insn_int_add || insn == x86insn_int_imul)) {
            unit_push_binary_instruction(insn, op2, res);
            *res = *op2;
        } else {
            bincode_create_operand_and_alloc_pseudoreg(res, op1->op_type);
            unit_push_binary_instruction(x86insn_int_mov, res, op1);
            unit_push_binary_instruction(insn, res, op2);
        }
    } else {
        unit_push_binary_instruction(insn, op1, op2);
    }
}

static x86_instruction_code _negate_float_insn(x86_instruction_code insn)
{
    if (insn == x86insn_fpu_sub) {
        return x86insn_fpu_subr;
    } else if (insn == x86insn_fpu_div) {
        return x86insn_fpu_divr;
    } else {
        return insn;
    }
}

static void _generate_float_binary_expr(expression *expr, x86_operand *res, x86_operand *op1, x86_operand *op2, BOOL fpu_invert)
{
    x86_instruction_code insn = _opcode_to_float_arithm_instruction(expr->data.arithm.opcode);

    ASSERT(OP_IS_FLOAT(*op1) && OP_IS_REGISTER_OR_ADDRESS(*op1));
    ASSERT(OP_IS_FLOAT(*op2) && OP_IS_REGISTER_OR_ADDRESS(*op2));

    *res = *op1;

    if (IS_ASSIGN_OP(expr->data.arithm.opcode)) {
        ASSERT(op1->op_loc == x86loc_address);

        if (expr->data.arithm.opcode == op_assign) {
            if (op2->op_loc == x86loc_address) {
                unit_push_unary_instruction(x86insn_fpu_ld, op2);
            }

            unit_push_unary_instruction((expr->expr_parent ? x86insn_fpu_st : x86insn_fpu_stp), op1);
        } else {
            if (op1->op_loc == x86loc_address) {
                unit_push_unary_instruction(x86insn_fpu_ld, op1);
            }

            unit_push_unary_instruction(insn, op2);
            unit_push_unary_instruction((expr->expr_parent ? x86insn_fpu_st : x86insn_fpu_stp), op1);
        }

        if (!expr->expr_parent) {
            res->op_loc = x86loc_none;
        }
    } else if (IS_COMPARE_OP(expr->data.arithm.opcode)) {
        fpu_invert = !fpu_invert;

        if (op2->op_loc == x86loc_address) {
            unit_push_unary_instruction(x86insn_fpu_ld, op2);
        }

        if (op1->op_loc == x86loc_address) {
            unit_push_unary_instruction(x86insn_fpu_ld, op1);
        }

        if (fpu_invert) {
            insn = _invert_compare_instruction(insn);
        }

        if (op1->op_loc != x86loc_address && op2->op_loc == x86loc_address) {
            insn = _invert_compare_instruction(insn);
        }

        unit_push_nullary_instruction(x86insn_fpu_cmp);

        bincode_create_operand_and_alloc_pseudoreg(op2, x86reg_byte);
        unit_push_unary_instruction(insn, op2);

        bincode_create_operand_and_alloc_pseudoreg(res, x86reg_dword);
        unit_push_binary_instruction(x86insn_movzx, res, op2);
    } else {
        if (fpu_invert) {
            insn = _negate_float_insn(insn);
        }

        if (op1->op_loc == x86loc_address) {
            if (op2->op_loc == x86loc_register) {
                insn = _negate_float_insn(insn);
                unit_push_unary_instruction(insn, op1);
            } else {
                unit_push_unary_instruction(x86insn_fpu_ld, op1);
                unit_push_unary_instruction(insn, op2);
            }
        } else {
            unit_push_unary_instruction(insn, op2);
        }

        bincode_create_operand_and_alloc_pseudoreg(res, op1->op_type);
    }
}


//
// Основные случаи кодогенерации выражений.
//

static void _generate_unary_arithm_expr(expression *expr, x86_operand *res)
{
    x86_operand op;

    _evaluate_nested_expression(expr->data.arithm.operand1, &op);

    if (expr->data.arithm.opcode == op_convert_int2float) {
        _generate_convert_int2float(res, &op);
    } else if (expr->data.arithm.opcode == op_convert_float2int) {
        _generate_convert_float2int(res, &op);
    } else if (expr->data.arithm.opcode == op_convert_float2double ||
        expr->data.arithm.opcode == op_convert_double2float) {
            _generate_convert_float2double(res, &op);
    } else if (expr->data.arithm.opcode == op_dereference) {
        _generate_dereference(res, &op, expr->expr_type);
    } else if (expr->data.arithm.opcode == op_get_address) {
        _generate_get_address(res, &op);
    } else if (expr->data.arithm.opcode == op_not) {
        _generate_int2bool(res, &op, TRUE);
    } else if (expr->data.arithm.opcode == op_notnot) {
        _generate_int2bool(res, &op, FALSE);
    } else {
        _generate_common_unary_arithm_expr(expr, res, &op);
    }
}

static void _generate_binary_arithm_expr(expression *expr, x86_operand *res)
{
    x86_operand op1, op2;
    BOOL is_structure_op    = TYPE_IS_STRUCTURE_UNION(expr->expr_type);
    BOOL is_fpu_op          = TYPE_IS_FLOATING(expr->expr_type) && !option_use_sse2;
    BOOL is_int_op          = TYPE_IS_INTEGRAL_OR_POINTER(expr->data.arithm.operand1->expr_type);
    BOOL fpu_invert;

    if (expr->data.arithm.operand1->expr_complexity < expr->data.arithm.operand2->expr_complexity) {
        _evaluate_nested_expression(expr->data.arithm.operand2, &op2);
        _evaluate_nested_expression(expr->data.arithm.operand1, &op1);
        fpu_invert = (op1.op_loc == x86loc_register && op2.op_loc == x86loc_register);
    } else {
        _evaluate_nested_expression(expr->data.arithm.operand1, &op1);
        _evaluate_nested_expression(expr->data.arithm.operand2, &op2);
        fpu_invert = FALSE;
    }

    if (is_structure_op) {
        ASSERT(expr->data.arithm.opcode == op_assign);
        x86_intrinsic_static_memcpy(_curr_func, res, &op1, &op2, type_calculate_sizeof(expr->expr_type));
    } else if (is_int_op) {
        _generate_int_binary_expr(expr, res, &op1, &op2);
    } else {
        _generate_float_binary_expr(expr, res, &op1, &op2, fpu_invert);
    }
}


static void _generate_arithmetic(expression *expr, x86_operand *res)
{
    if (!expr->expr_parent && !IS_SELF_MOD_OP(expr->data.arithm.opcode)) {
        aux_warning("useless operation: '%s'", expr_print_opcode_to_user(expr->data.arithm.opcode));
    }

    if (IS_UNARY_OP(expr->data.arithm.opcode)) {
        _generate_unary_arithm_expr(expr, res);
    } else {
        _generate_binary_arithm_expr(expr, res);
    }
}

static void _generate_call(expression *call, x86_operand *res)
{
    expression *addr, *arg;
    x86_operand tmp, tmp2;
    int param_size, params_total_size = 0;


    // сохраняем все используемые регистры
    unit_push_nullary_instruction(x86insn_push_all);

    // вычисляем аргументы в обратном порядке и кладём их в стек
    for (arg = call->data.function_call.args->expr_last; arg; arg = arg->expr_prev) {
        _evaluate_nested_expression(arg, &tmp);

        param_size = type_calculate_sizeof(arg->expr_type);
        unit_push_unary_instruction(x86insn_push_arg, &tmp);

        params_total_size += param_size;
    }

    // вычисляем адрес функции
    addr = call->data.function_call.address;

    if (addr->expr_code == code_expr_symbol && TYPE_IS_FUNCTION(addr->expr_type)) {
        bincode_create_operand_from_symbol(&tmp, addr->data.sym);
    } else {
        _evaluate_nested_expression(addr, &tmp);
    }

    // выдаём инструкцию CALL и сохраняем информацию о типе результата во второй операнд
    tmp2.op_loc     = x86loc_register;  // al/ax/eax/eax:edx/st0/xmm1
    tmp2.op_type    = bincode_encode_type(call->expr_type);
    unit_push_binary_instruction(x86insn_call, &tmp, &tmp2);

    // удаляем параметры из стека
    if (params_total_size) {
        bincode_create_operand_from_int_constant(&tmp, x86op_dword, params_total_size);
        unit_push_unary_instruction(x86insn_restore_stack, &tmp);
    }

    // восстанавливаем сохранённые регистры
    unit_push_nullary_instruction(x86insn_pop_all);

    // возвращаем результат, если он есть
    if (TYPE_IS_VOID(call->expr_type)) {
        res->op_loc = x86loc_none;
    } else {
        // TODO: возвращать результат типа QWORD
        bincode_create_operand_from_register(res, tmp2.op_type, x86reg_eax);
    }
}


static void _load_symbol(symbol *sym, data_type *type, x86_operand *res)
{
    x86_operand tmp;

    if (sym->sym_is_local) {
        bincode_create_operand_addr_from_ebp_offset(&tmp, x86op_dword, sym->sym_offset);
    } else {
        bincode_create_operand_from_symbol(&tmp, sym);
    }

    bincode_create_operand_and_alloc_pseudoreg(res, x86reg_dword);
    unit_push_binary_instruction(x86insn_lea, res, &tmp);

    bincode_create_operand_addr_from_reg(res, bincode_encode_type(type), res->data.reg);
}

static void _evaluate_nested_expression(expression *expr, x86_operand *res)
{
    x86_operand tmp;
    x86_instruction_code val;

    switch (expr->expr_code) {
    case code_expr_arithmetic:
        _generate_arithmetic(expr, res);
        break;

    case code_expr_function_call:
        _generate_call(expr, res);
        break;

    case code_expr_symbol:
        _load_symbol(expr->data.sym, expr->expr_type, res);
        break;

    case code_expr_int_constant:
        bincode_create_operand_and_alloc_pseudoreg(res, bincode_encode_type(expr->expr_type));
        bincode_create_operand_from_int_constant(&tmp, bincode_encode_type(expr->expr_type), expr->data.int_const);
        unit_push_binary_instruction(x86insn_int_mov, res, &tmp);
        break;

    case code_expr_float_constant:
        val = bincode_encode_float_constant(expr->data.float_const.val);

        if (val != x86insn_count) {
            unit_push_nullary_instruction(val);
        } else {
            _load_symbol(expr->data.float_const.sym, expr->expr_type, res);
            unit_push_unary_instruction(x86insn_fpu_ld, res);
        }

        bincode_create_operand_and_alloc_pseudoreg(res, bincode_encode_type(expr->expr_type));
        break;

    default:
        ASSERT(FALSE);
    }
}


//
// Кодогенерация для кода вызова функций: пролог/эпилог/return.
//

static void _generate_prolog(void)
{
    unit_push_nullary_instruction(x86insn_create_stack_frame);
}

static void _generate_epilog(void)
{
    unit_push_nullary_instruction(x86insn_destroy_stack_frame);
}

static void _generate_return(expression *ret_value)
{
    x86_operand res, tmp, tmp2;

    if (ret_value) {
        _evaluate_nested_expression(ret_value, &res);
        ASSERT(res.op_loc == x86loc_register || res.op_loc == x86loc_address);

        if (res.op_type == x86op_byte) {
            bincode_create_operand_from_register(&tmp, x86reg_byte, x86reg_al);
            unit_push_binary_instruction(x86insn_int_mov, &tmp, &res);
        } else if (res.op_type == x86op_word) {
            bincode_create_operand_from_register(&tmp, x86reg_word, x86reg_ax);
            unit_push_binary_instruction(x86insn_int_mov, &tmp, &res);
        } else if (res.op_type == x86op_dword) {
            bincode_create_operand_from_register(&tmp, x86reg_dword, x86reg_eax);
            unit_push_binary_instruction(x86insn_int_mov, &tmp, &res);
        } else if (res.op_type == x86op_qword) {
            UNIMPLEMENTED_ASSERT(res.op_loc == x86loc_register);
            bincode_create_operand_from_register(&tmp, x86reg_dword, x86reg_eax);
            bincode_create_operand_from_register(&tmp2, x86reg_dword, res.data.qword.low);
            unit_push_binary_instruction(x86insn_int_mov, &tmp, &tmp2);
            bincode_create_operand_from_register(&tmp, x86reg_dword, x86reg_edx);
            bincode_create_operand_from_register(&tmp2, x86reg_dword, res.data.qword.high);
            unit_push_binary_instruction(x86insn_int_mov, &tmp, &tmp2);
        } else {
            if (res.op_loc == x86loc_address) {
                unit_push_unary_instruction(x86insn_fpu_ld, &res);
            } else {
                if (!option_use_sse2) {
                    // результат уже находится в st(0)
                } else {
                    unit_push_binary_instruction(x86insn_sse_mov, 0, &res);
                }
            }
        }
    }

    _generate_epilog();
    unit_push_nullary_instruction(x86insn_ret);
}


//
//  Кодогенерация для переходов.
//

static void _generate_common_conditional_jump(expression *condition, int destination, BOOL invert)
{
    x86_operand tmp, res;

    _evaluate_nested_expression(condition, &res);
    ASSERT(res.op_loc == x86loc_register || res.op_loc == x86loc_address);

    bincode_create_operand_from_int_constant(&tmp, bincode_encode_type(condition->expr_type), 0);
    unit_push_binary_instruction(x86insn_int_cmp, &res, &tmp);

    bincode_create_operand_from_label(&tmp, destination);
    unit_push_unary_instruction((invert ? x86insn_je : x86insn_jne), &tmp);
}

static x86_instruction_code _condition_to_jump(arithmetic_opcode opcode, BOOL is_float)
{
    switch (opcode) {
    case op_less_then:      return (is_float ? x86insn_jb : x86insn_jl);
    case op_less_equal:     return (is_float ? x86insn_jbe : x86insn_jle);
    case op_greater_then:   return (is_float ? x86insn_ja : x86insn_jg);
    case op_greater_equal:  return (is_float ? x86insn_jae : x86insn_jge);
    case op_equal:          return x86insn_je;
    case op_non_equal:      return x86insn_jne;
    default:                ASSERT(FALSE);
    }
}

static x86_instruction_code _invert_jump(x86_instruction_code jump_insn)
{
    switch (jump_insn) {
    case x86insn_je:       return x86insn_jne;
    case x86insn_jne:      return x86insn_je;
    case x86insn_jle:      return x86insn_jg;
    case x86insn_jl:       return x86insn_jge;
    case x86insn_jge:      return x86insn_jl;
    case x86insn_jg:       return x86insn_jle;
    case x86insn_jbe:      return x86insn_ja;
    case x86insn_jb:       return x86insn_jae;
    case x86insn_jae:      return x86insn_jb;
    case x86insn_ja:       return x86insn_jbe;
    default:                ASSERT(FALSE);
    }
}

static void _generate_conditional_jump(expression *condition, int destination, BOOL invert);

static void _generate_jumps_for_and(expression *cond1, expression *cond2, int destination, BOOL invert_operands)
{
    int label = unit_create_label(_curr_func);
    x86_operand op;

    _generate_conditional_jump(cond1, label, !invert_operands);
    _generate_conditional_jump(cond2, destination, invert_operands);
    bincode_create_operand_from_label(&op, label);
    unit_push_unary_instruction(x86insn_label, &op);
}

static void _generate_jumps_for_or(expression *cond1, expression *cond2, int destination, BOOL invert_operands)
{
    _generate_conditional_jump(cond1, destination, invert_operands);
    _generate_conditional_jump(cond2, destination, invert_operands);
}

static void _generate_conditional_jump(expression *condition, int destination, BOOL invert)
{
    expr_arithm *arithm;
    x86_operand op1, op2, tmp;
    x86_instruction_code insn;
    BOOL is_float;

    if (condition->expr_code == code_expr_arithmetic) {
        arithm = &condition->data.arithm;

        if (IS_COMPARE_OP(arithm->opcode)) {
            if (arithm->operand1->expr_complexity >= arithm->operand2->expr_complexity) {
                _evaluate_nested_expression(arithm->operand1, &op1);
                _evaluate_nested_expression(arithm->operand2, &op2);
            } else {
                _evaluate_nested_expression(arithm->operand2, &op1);
                _evaluate_nested_expression(arithm->operand1, &op2);
                invert = !invert;
            }

            is_float = (arithm->operand1->expr_type->type_code == code_type_float);

            if (!is_float) {
                if (op1.op_loc == x86loc_address && op2.op_loc == x86loc_address) {
                    bincode_create_operand_and_alloc_pseudoreg(&tmp, op1.op_type);
                    unit_push_binary_instruction(x86insn_int_mov, &tmp, &op1);
                    unit_push_binary_instruction(x86insn_int_cmp, &tmp, &op2);
                } else {
                    unit_push_binary_instruction(x86insn_int_cmp, &op1, &op2);
                }
            } else {
                if (op2.op_loc == x86loc_address) {
                    unit_push_unary_instruction(x86insn_fpu_ld, &op2);
                }

                if (op1.op_loc == x86loc_address) {
                    unit_push_unary_instruction(x86insn_fpu_ld, &op1);
                }

                if (op1.op_loc != x86loc_address && op2.op_loc == x86loc_address) {
                    invert = !invert;
                }

                unit_push_nullary_instruction(x86insn_fpu_cmp);
            }

            insn = _condition_to_jump(arithm->opcode, is_float);

            if (invert) {
                insn = _invert_jump(insn);
            }

            bincode_create_operand_from_label(&tmp, destination);
            unit_push_unary_instruction(insn, &tmp);
        } else if (arithm->opcode == op_not) {
            _generate_conditional_jump(arithm->operand1, destination, !invert);
        } else if (arithm->opcode == op_logical_and_in_jump) {
            if (!invert) {
                _generate_jumps_for_and(arithm->operand1, arithm->operand2, destination, FALSE);
            } else {
                _generate_jumps_for_or(arithm->operand1, arithm->operand2, destination, TRUE);
            }
        } else if (arithm->opcode == op_logical_or_in_jump) {
            if (!invert) {
                _generate_jumps_for_or(arithm->operand1, arithm->operand2, destination, FALSE);
            } else {
                _generate_jumps_for_and(arithm->operand1, arithm->operand2, destination, TRUE);
            }
        } else {
            _generate_common_conditional_jump(condition, destination, invert);
        }
    } else {
        _generate_common_conditional_jump(condition, destination, invert);
    }
}

static void _generate_jmp(expr_jump *jump)
{
    x86_operand dst;

    if (!jump->condition) {
        bincode_create_operand_from_label(&dst, jump->destination);
        unit_push_unary_instruction(x86insn_jmp, &dst);
    } else if (jump->condition->expr_code == code_expr_int_constant) {
        if (jump->condition->data.int_const != 0) {
            bincode_create_operand_from_label(&dst, jump->destination);
            unit_push_unary_instruction(x86insn_jmp, &dst);
        }
    } else if (jump->condition->expr_code == code_expr_float_constant) {
        aux_warning("exact comparison of floating values");

        if (jump->condition->data.float_const.val != 0.0f) {
            bincode_create_operand_from_label(&dst, jump->destination);
            unit_push_unary_instruction(x86insn_jmp, &dst);
        }
    } else {
        _generate_conditional_jump(jump->condition, jump->destination, jump->invert_cond);
    }
}


//
// Высокоуровневые функции кодогенерации.
//

static void _evaluate_1st_level_expression(expression *expr)
{
    x86_operand res;

    switch (expr->expr_code) {
    case code_expr_arithmetic:
    case code_expr_function_call:
        _evaluate_nested_expression(expr, &res);
        break;

    case code_expr_return:
        _generate_return(expr->data.ret_value);
        break;

    case code_expr_jump:
        _generate_jmp(&expr->data.jump);
        break;

    default:
        ASSERT(FALSE);
    }
}

static void _walk_through_expressions(void)
{
    x86_operand label;
    expression *expr;

    for (expr = _curr_func->func_body; expr; expr = expr->expr_next) {
        switch (expr->expr_code) {
        case code_expr_label:
            bincode_create_operand_from_label(&label, expr->data.label);
            unit_push_unary_instruction(x86insn_label, &label);
            break;

        case code_expr_arithmetic:
            if (!IS_SELF_MOD_OP(expr->data.arithm.opcode)) {
                aux_warning("useless expression");
            }

            _evaluate_1st_level_expression(expr);
            break;

        case code_expr_function_call:
        case code_expr_return:
        case code_expr_jump:
            _evaluate_1st_level_expression(expr);
            break;

        default:
            ASSERT(FALSE);
            break;
        }
    }
}


// Эти функции извлекают вещественные константы из кода функции и размещают их в секции .data.

static void _extract_float_constants(expression *expr, void *unused)
{
    x86_instruction_code c  = bincode_encode_float_constant(expr->data.float_const.val);

    if (c == x86insn_count) {
        expr->data.float_const.sym = x86data_insert_float_constant(expr->data.float_const.val);
    }
}

static void _place_float_constants_into_data_section(void)
{
    expr_iterate_through_subexpressions(_curr_func->func_body, code_expr_float_constant, EXPR_IT_APPLY_FILTER,
        _extract_float_constants, NULL);
    x86data_enter_text_section();
}


// Точка входа в кодогенератор.

void x86_codegen_do_function(function_desc *function)
{
    int type;

    for (type = 0; type < x86reg_count; type++)
        _last_pseudoreg[type] = 1;

    _curr_func   = function;

    _place_float_constants_into_data_section();
    _generate_prolog();
    _walk_through_expressions();

    _curr_func   = NULL;
}

