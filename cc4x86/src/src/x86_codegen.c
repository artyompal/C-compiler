
#include "common.h"
#include "x86_codegen.h"
#include "x86_intrinsics.h"
#include "x86_data.h"
#include "x86_stack_frame.h"


static int _last_int_pseudoreg      = 1;
static function_desc *_curr_func    = NULL;


static void _evaluate_nested_expression(expression *expr, x86_operand *res);


//
// Some helpers.
//

int x86_codegen_alloc_pseudoreg(void)
{
    return _last_int_pseudoreg++;
}


static x86_instruction_code _opcode_to_unary_int_instruction(arithmetic_opcode opcode)
{
    switch (opcode) {
    case op_neg:            return x86instr_int_neg;
    case op_bitnot:         return x86instr_int_not;
    case op_increment:
    case op_post_increment: return x86instr_int_inc;
    case op_decrement:
    case op_post_decrement: return x86instr_int_dec;
    default:                ASSERT(FALSE);
    }
}

static x86_instruction_code _opcode_to_binary_int_instruction(arithmetic_opcode opcode)
{
    switch (opcode) {
    case op_add:            return x86instr_int_add;
    case op_sub:            return x86instr_int_sub;
    case op_mul:            return x86instr_int_imul;
    case op_div:            return x86instr_int_idiv;
    case op_mod:            return x86instr_int_idiv;
    case op_shl:            return x86instr_int_sal;
    case op_shr:            return x86instr_int_sar;

    case op_and:            return x86instr_int_and;
    case op_xor:            return x86instr_int_xor;
    case op_or:             return x86instr_int_or;

    case op_assign:         return x86instr_int_mov;
    case op_add_assign:     return x86instr_int_add;
    case op_sub_assign:     return x86instr_int_sub;
    case op_mul_assign:     return x86instr_int_imul;
    case op_div_assign:     return x86instr_int_idiv;
    case op_mod_assign:     return x86instr_int_idiv;
    case op_shl_assign:     return x86instr_int_sal;
    case op_shr_assign:     return x86instr_int_sar;
    case op_and_assign:     return x86instr_int_and;
    case op_xor_assign:     return x86instr_int_xor;
    case op_or_assign:      return x86instr_int_or;

    case op_equal:          return x86instr_int_sete;
    case op_non_equal:      return x86instr_int_setne;
    case op_less_equal:     return x86instr_int_setle;
    case op_less_then:      return x86instr_int_setl;
    case op_greater_equal:  return x86instr_int_setge;
    case op_greater_then:   return x86instr_int_setg;

    default:                ASSERT(FALSE);
    }
}

static x86_instruction_code _opcode_to_float_arithm_instruction(arithmetic_opcode opcode)
{
    switch (opcode) {
    case op_add:            return x86instr_float_add;
    case op_sub:            return x86instr_float_sub;
    case op_mul:            return x86instr_float_mul;
    case op_div:            return x86instr_float_div;

    case op_assign:         return x86instr_float_ld;
    case op_add_assign:     return x86instr_float_add;
    case op_sub_assign:     return x86instr_float_sub;
    case op_mul_assign:     return x86instr_float_mul;
    case op_div_assign:     return x86instr_float_div;

    case op_equal:          return x86instr_int_sete;
    case op_non_equal:      return x86instr_int_setne;
    case op_less_equal:     return x86instr_int_setbe;
    case op_less_then:      return x86instr_int_setb;
    case op_greater_equal:  return x86instr_int_setae;
    case op_greater_then:   return x86instr_int_seta;

    default:                ASSERT(FALSE);
    }
}

static x86_instruction_code _swap_operands_for_condition(arithmetic_opcode opcode)
{
    switch (opcode) {
    case x86instr_int_setne:    return x86instr_int_setne;
    case x86instr_int_sete:     return x86instr_int_sete;
    case x86instr_int_setg:     return x86instr_int_setl;
    case x86instr_int_setge:    return x86instr_int_setle;
    case x86instr_int_setl:     return x86instr_int_setg;
    case x86instr_int_setle:    return x86instr_int_setge;

    default:                    ASSERT(FALSE);
    }
}


static BOOL _is_int_expr(expression *expr)
{
    data_type *type = expr->expr_type;

    if (type->type_code == code_type_int || type->type_code == code_type_pointer) {
        return TRUE;
    } else if (type->type_code == code_type_float) {
        return FALSE;
    } else {
        aux_unimplemented_error("types other then int and float aren't supported");
    }
}


//
// Code generation for unary expressions.
//

// TODO: provide an optimized codepath for (*mem) = float2int/int2float(val): just save to the given memory location.

static void _generate_convert_int2float(x86_operand *res, x86_operand *op)
{
    ASSERT(op->op_type == x86op_int_register || op->op_type == x86op_address);

    if (op->op_type == x86op_int_register) {
        x86_operand tmp;

        bincode_create_operand_addr_from_ebp_offset(&tmp, x86_stack_frame_get_float2int_tmp());

        unit_push_binary_instruction(x86instr_int_mov, &tmp, op);
        unit_push_unary_instruction(x86instr_float_ld_int, &tmp);
    } else { // x86op_address
        unit_push_unary_instruction(x86instr_float_ld_int, op);
    }

    res->op_type = x86op_float_register;
}

static void _generate_convert_float2int(x86_operand *res, x86_operand *op)
{
    ASSERT(op->op_type == x86op_float_register || op->op_type == x86op_address);

    if (op->op_type == x86op_address) {
        unit_push_unary_instruction(x86instr_float_ld, op);
    }

    bincode_create_operand_addr_from_ebp_offset(res, x86_stack_frame_get_float2int_tmp());
    unit_push_unary_instruction(x86instr_float_stp_int, res);
}

static void _generate_dereference(x86_operand *res, x86_operand *op)
{
    ASSERT(op->op_type == x86op_address || op->op_type == x86op_int_register);

    if (op->op_type == x86op_int_register) {
        bincode_create_operand_addr_from_reg(res, op->data.reg);
    } else {
        bincode_create_operand_from_int_pseudoreg(res, x86_codegen_alloc_pseudoreg());
        unit_push_binary_instruction(x86instr_int_mov, res, op);

        bincode_create_operand_addr_from_reg(res, res->data.reg);
    }
}

static void _generate_get_address(x86_operand *res, x86_operand *op)
{
    ASSERT(op->op_type == x86op_address);

    if (op->data.address.base != 0 && op->data.address.index == 0 && op->data.address.offset == 0) {
        bincode_create_operand_from_int_pseudoreg(res, op->data.address.base);
    } else {
        bincode_create_operand_from_int_pseudoreg(res, x86_codegen_alloc_pseudoreg());
        unit_push_binary_instruction(x86instr_lea, res, op);
    }
}

static void _generate_int2bool(x86_operand *res, x86_operand *op, BOOL invert)
{
    x86_operand tmp;

    ASSERT(op->op_type == x86op_address || op->op_type == x86op_int_register);

    if (op->op_type == x86op_address) {
        bincode_create_operand_from_int_pseudoreg(&tmp, x86_codegen_alloc_pseudoreg());
        unit_push_binary_instruction(x86instr_int_mov, &tmp, op);
        unit_push_binary_instruction(x86instr_int_test, &tmp, &tmp);
    } else {
        unit_push_binary_instruction(x86instr_int_test, op, op);
    }

    unit_push_nullary_instruction(invert ? x86instr_int_sete : x86instr_int_setne);

    bincode_create_operand_from_int_pseudoreg(res, x86_codegen_alloc_pseudoreg());
    unit_push_unary_instruction(x86instr_movzx_al, res);
}


#define CONVERT_INCDEC_TO_BINARY(CODE) ((x86_instruction_code) (CODE + 5))

static void _generate_unary_expr_with_step(expr_arithm *arithm, x86_operand *op)
{
    x86_instruction_code instr = _opcode_to_unary_int_instruction(arithm->opcode);

    ASSERT(op->op_type == x86op_int_register || op->op_type == x86op_address);
    // TODO: provide an optimized codepath for x86op_address case: return value in register if it will be reused.

    if (IS_INCREMENT_DECREMENT(arithm->opcode) && arithm->step != 1) {
        x86_instruction_code bin = CONVERT_INCDEC_TO_BINARY(instr);
        x86_operand op2;

        bincode_create_operand_from_int_constant(&op2, arithm->step);
        unit_push_binary_instruction(bin, op, &op2);
    } else {
        unit_push_unary_instruction(instr, op);
    }
}

static void _generate_common_unary_arithm_expr(expression *expr, x86_operand *res, x86_operand *op)
{
    *res = *op;

    if (_is_int_expr(expr->data.arithm.operand1)) {
        if (IS_SELF_MOD_OP(expr->data.arithm.opcode)) {
            if (!expr->expr_parent) {
                _generate_unary_expr_with_step(&expr->data.arithm, op);
                res->op_type = x86op_none;
            } else {
                if (IS_POST_OPERATION(expr->data.arithm.opcode)) {
                    int copy = x86_codegen_alloc_pseudoreg();

                    bincode_create_operand_from_int_pseudoreg(res, copy);
                    unit_push_binary_instruction(x86instr_int_mov, res, op);
                    _generate_unary_expr_with_step(&expr->data.arithm, op);
                } else {
                    _generate_unary_expr_with_step(&expr->data.arithm, op);
                }
            }
        } else {
            unit_push_unary_instruction(_opcode_to_unary_int_instruction(expr->data.arithm.opcode), op);
        }
    } else {
        ASSERT(expr->data.arithm.opcode == op_neg);

        if (op->op_type == x86op_address) {
            unit_push_unary_instruction(x86instr_float_ld, op);
        }

        unit_push_nullary_instruction(x86instr_float_zero);

        bincode_create_operand_from_float_register(res);
        unit_push_unary_instruction(x86instr_float_subr, res);
    }
}


//
// Code generation for binary expressions.
//

static void _generate_int_binary_expr(expression *expr, x86_operand *res, x86_operand *op1, x86_operand *op2)
{
    x86_instruction_code instr = _opcode_to_binary_int_instruction(expr->data.arithm.opcode);
    x86_operand tmp;

    ASSERT(op1->op_type == x86op_int_register || op1->op_type == x86op_address);
    ASSERT(op2->op_type == x86op_int_register || op2->op_type == x86op_address);

    *res = *op1;

    if (IS_COMPARE_OP(expr->data.arithm.opcode)) {
        if (op1->op_type == x86op_address && op2->op_type == x86op_address) {
            bincode_create_operand_from_int_pseudoreg(&tmp, x86_codegen_alloc_pseudoreg());
            unit_push_binary_instruction(x86instr_int_mov, &tmp, op1);
            unit_push_binary_instruction(x86instr_int_cmp, &tmp, op2);
        } else {
            unit_push_binary_instruction(x86instr_int_cmp, op1, op2);
        }

        unit_push_nullary_instruction(instr);
        bincode_create_operand_from_int_pseudoreg(res, x86_codegen_alloc_pseudoreg());
        unit_push_unary_instruction(x86instr_movzx_al, res);
    } else if (IS_DIVISION_OP(expr->data.arithm.opcode) || IS_MODULO_OP(expr->data.arithm.opcode)) {
        bincode_create_operand_from_int_register(&tmp, x86reg_eax);
        unit_push_binary_instruction(x86instr_int_mov, &tmp, op1);
        unit_push_nullary_instruction(x86instr_cdq);
        unit_push_unary_instruction(x86instr_int_idiv, op2);

        if (IS_MODULO_OP(expr->data.arithm.opcode)) {
            bincode_create_operand_from_int_register(&tmp, x86reg_edx);
        }

        bincode_create_operand_from_int_pseudoreg(res, x86_codegen_alloc_pseudoreg());
        unit_push_binary_instruction(x86instr_int_mov, res, &tmp);
    } else if (IS_ASSIGN_OP(expr->data.arithm.opcode)) {
        ASSERT(op1->op_type == x86op_address);

        if (op2->op_type == x86op_address) {
            bincode_create_operand_from_int_pseudoreg(res, x86_codegen_alloc_pseudoreg());

            if (instr != x86instr_int_mov) {
                unit_push_binary_instruction(x86instr_int_mov, res, op1);
            }

            unit_push_binary_instruction(instr, res, op2);
            unit_push_binary_instruction(x86instr_int_mov, op1, res);
        } else {
            unit_push_binary_instruction(instr, op1, op2);
        }
    } else if (op1->op_type == x86op_address) {
        if (op2->op_type == x86op_int_register && (instr == x86instr_int_add || instr == x86instr_int_imul)) {
            unit_push_binary_instruction(instr, op2, res);
            *res = *op2;
        } else {
            bincode_create_operand_from_int_pseudoreg(res, x86_codegen_alloc_pseudoreg());
            unit_push_binary_instruction(x86instr_int_mov, res, op1);
            unit_push_binary_instruction(instr, res, op2);
        }
    } else {
        unit_push_binary_instruction(instr, op1, op2);
    }
}

static x86_instruction_code _negate_float_instr(x86_instruction_code instr)
{
    if (instr == x86instr_float_sub) {
        return x86instr_float_subr;
    } else if (instr == x86instr_float_div) {
        return x86instr_float_divr;
    } else {
        return instr;
    }
}

static void _generate_float_binary_expr(expression *expr, x86_operand *res, x86_operand *op1, x86_operand *op2)
{
    x86_instruction_code instr = _opcode_to_float_arithm_instruction(expr->data.arithm.opcode);

    ASSERT(op1->op_type == x86op_float_register || op1->op_type == x86op_address);
    ASSERT(op2->op_type == x86op_float_register || op2->op_type == x86op_address);

    *res = *op1;

    if (IS_ASSIGN_OP(expr->data.arithm.opcode)) {
        ASSERT(op1->op_type == x86op_address);

        if (expr->data.arithm.opcode == op_assign) {
            if (op2->op_type == x86op_address) {
                unit_push_unary_instruction(x86instr_float_ld, op2);
            }

            unit_push_unary_instruction((expr->expr_parent ? x86instr_float_st : x86instr_float_stp), op1);
        } else {
            if (op1->op_type == x86op_address) {
                unit_push_unary_instruction(x86instr_float_ld, op1);
            }

            unit_push_unary_instruction(instr, op2);
            unit_push_unary_instruction((expr->expr_parent ? x86instr_float_st : x86instr_float_stp), op1);
        }

        if (!expr->expr_parent) {
            res->op_type = x86op_none;
        }
    } else if (IS_COMPARE_OP(expr->data.arithm.opcode)) {
        if (op2->op_type == x86op_address) {
            unit_push_unary_instruction(x86instr_float_ld, op2);
        }

        if (op1->op_type == x86op_address) {
            unit_push_unary_instruction(x86instr_float_ld, op1);
        }

        if (op1->op_type != x86op_address && op2->op_type == x86op_address) {
            instr = _swap_operands_for_condition(instr);
        }

        unit_push_nullary_instruction(x86instr_float_cmp);
        unit_push_nullary_instruction(instr);

        bincode_create_operand_from_int_pseudoreg(res, x86_codegen_alloc_pseudoreg());
        unit_push_unary_instruction(x86instr_movzx_al, res);
    } else {
        if (op1->op_type == x86op_address) {
            if (op2->op_type == x86op_float_register) {
                instr = _negate_float_instr(instr);
                unit_push_unary_instruction(instr, op1);
            } else {
                unit_push_unary_instruction(x86instr_float_ld, op1);
                unit_push_unary_instruction(instr, op2);
            }
        } else {
            unit_push_unary_instruction(instr, op2);
        }

        bincode_create_operand_from_float_register(res);
    }
}


//
// Common code generation for expressions.
//

static void _generate_unary_arithm_expr(expression *expr, x86_operand *res)
{
    x86_operand op;

    _evaluate_nested_expression(expr->data.arithm.operand1, &op);

    if (expr->data.arithm.opcode == op_convert_int2float) {
        _generate_convert_int2float(res, &op);
    } else if (expr->data.arithm.opcode == op_convert_float2int) {
        _generate_convert_float2int(res, &op);
    } else if (expr->data.arithm.opcode == op_dereference) {
        _generate_dereference(res, &op);
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
    BOOL is_structure_op    = (expr->data.arithm.opcode == op_assign && TYPE_IS_STRUCTURE_UNION(expr->expr_type));
    BOOL is_int_op          = !is_structure_op && _is_int_expr(expr->data.arithm.operand1);

    // TODO: for now, we cannot evaluate floating operands in reverse order. Flag "invert" needed.
    if (expr->data.arithm.operand2->expr_complexity > expr->data.arithm.operand1->expr_complexity
        && (is_structure_op || is_int_op)) {
        _evaluate_nested_expression(expr->data.arithm.operand2, &op2);
        _evaluate_nested_expression(expr->data.arithm.operand1, &op1);
    } else {
        _evaluate_nested_expression(expr->data.arithm.operand1, &op1);
        _evaluate_nested_expression(expr->data.arithm.operand2, &op2);
    }

    if (is_structure_op) {
        x86_intrinsic_static_memcpy(_curr_func, res, &op1, &op2, type_calculate_sizeof(expr->expr_type));
    } else if (is_int_op) {
        _generate_int_binary_expr(expr, res, &op1, &op2);
    } else {
        _generate_float_binary_expr(expr, res, &op1, &op2);
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
    expression **reverse_args;
    x86_operand tmp, tmp2;
    int i, args_count, param_size, params_total_size = 0;


    // save all used registers
    unit_push_nullary_instruction(x86instr_push_all);


    // build reverse-order list of actual parameters, evaluate them and push
    reverse_args = expr_list2array(call->data.function_call.args->expr_first, &args_count);

    for (i = args_count - 1; i >= 0; i--) {
        arg = reverse_args[i];
        _evaluate_nested_expression(arg, &tmp);


        param_size          = type_calculate_sizeof(arg->expr_type);
        UNIMPLEMENTED_ASSERT(param_size == 4);

        if (i >= call->data.function_call.ellipsis_position) {
            // inside ellipsis, we must promote float's to double's and integral promotion for corresponding types
            if (tmp.op_type == x86op_float_register) {
                bincode_create_operand_addr_from_esp_offset(&tmp, -8);
                unit_push_unary_instruction(x86instr_float_stp_double, &tmp);

                bincode_create_operand_from_int_register(&tmp, x86reg_esp);
                bincode_create_operand_from_int_constant(&tmp2, 8);
                unit_push_binary_instruction(x86instr_int_sub, &tmp, &tmp2);

                param_size = 8;
            } else if (arg->expr_type->type_code == code_type_float) {
                ASSERT(tmp.op_type == x86op_address);
                unit_push_unary_instruction(x86instr_float_ld, &tmp);

                bincode_create_operand_addr_from_esp_offset(&tmp, -8);
                unit_push_unary_instruction(x86instr_float_stp_double, &tmp);

                bincode_create_operand_from_int_register(&tmp, x86reg_esp);
                bincode_create_operand_from_int_constant(&tmp2, 8);
                unit_push_binary_instruction(x86instr_int_sub, &tmp, &tmp2);

                param_size = 8;
            } else {
                unit_push_unary_instruction(x86instr_push, &tmp);
            }
        } else {
            if (tmp.op_type == x86op_float_register) {
                bincode_create_operand_addr_from_esp_offset(&tmp, -4);
                unit_push_unary_instruction(x86instr_float_stp, &tmp);

                bincode_create_operand_from_int_register(&tmp, x86reg_esp);
                bincode_create_operand_from_int_constant(&tmp2, 4);
                unit_push_binary_instruction(x86instr_int_sub, &tmp, &tmp2);
            } else {
                unit_push_unary_instruction(x86instr_push, &tmp);
            }
        }

        params_total_size   += param_size;
    }

    allocator_free(allocator_temporary_pool, reverse_args, args_count * sizeof(expression *));


    // evaluate call address
    addr = call->data.function_call.address;

    if (addr->expr_code == code_expr_symbol && TYPE_IS_FUNCTION(addr->expr_type)) {
        bincode_create_operand_from_symbol(&tmp, addr->data.sym);
    } else {
        _evaluate_nested_expression(addr, &tmp);
    }

    // emit CALL instruction and provide information about return type to later code generation stages
    if (call->expr_type->type_code == code_type_void) {
        unit_push_unary_instruction(x86instr_call, &tmp);
    } else if (call->expr_type->type_code == code_type_int) {
        unit_push_unary_instruction(x86instr_call_int, &tmp);
    } else if (call->expr_type->type_code == code_type_float) {
        unit_push_unary_instruction(x86instr_call_float, &tmp);
    } else {
        ASSERT(FALSE);
    }

    // remove parameters from stack frame
    if (params_total_size) {
        bincode_create_operand_from_int_register(res, x86reg_esp);
        bincode_create_operand_from_int_constant(&tmp, params_total_size);
        unit_push_binary_instruction(x86instr_int_add, res, &tmp);
    }

    // restore all used registers
    unit_push_nullary_instruction(x86instr_pop_all);

    // return result
    if (TYPE_IS_VOID(call->expr_type)) {
        res->op_type = x86op_none;
    } else if (_is_int_expr(call)) {
        bincode_create_operand_from_int_pseudoreg(res, x86_codegen_alloc_pseudoreg());
        bincode_create_operand_from_int_register(&tmp, x86reg_eax);
        unit_push_binary_instruction(x86instr_int_mov, res, &tmp);
    } else {
        bincode_create_operand_from_float_register(res);
    }
}


static void _load_symbol(symbol *sym, x86_operand *res)
{
    x86_operand tmp;

    if (sym->sym_is_local) {
        bincode_create_operand_addr_from_ebp_offset(&tmp, sym->sym_offset);
    } else {
        bincode_create_operand_from_symbol(&tmp, sym);
    }

    bincode_create_operand_from_int_pseudoreg(res, x86_codegen_alloc_pseudoreg());
    unit_push_binary_instruction(x86instr_lea, res, &tmp);

    bincode_create_operand_addr_from_reg(res, res->data.reg);
}

static void _evaluate_nested_expression(expression *expr, x86_operand *res)
{
    x86_operand tmp;

    switch (expr->expr_code) {
    case code_expr_arithmetic:
        _generate_arithmetic(expr, res);
        break;

    case code_expr_function_call:
        _generate_call(expr, res);
        break;

    case code_expr_symbol:
        _load_symbol(expr->data.sym, res);
        break;

    case code_expr_int_constant:
        bincode_create_operand_from_int_pseudoreg(res, x86_codegen_alloc_pseudoreg());
        bincode_create_operand_from_int_constant(&tmp, expr->data.int_const);
        unit_push_binary_instruction(x86instr_int_mov, res, &tmp);
        break;

    case code_expr_float_constant:
        {
            x86_instruction_code val = bincode_encode_float_constant(expr->data.float_const.val);

            if (val != x86instr_count) {
                unit_push_nullary_instruction(val);
            } else {
                _load_symbol(expr->data.float_const.sym, res);
                unit_push_unary_instruction(x86instr_float_ld, res);
            }

            bincode_create_operand_from_float_register(res);
            break;
        }

    default:
        ASSERT(FALSE);
    }
}


//
// Code generation for function calling: prologue/epilogue/return.
//

static void _generate_prolog(void)
{
    x86_operand op;

    bincode_create_operand_from_int_constant(&op, 0);
    unit_push_unary_instruction(x86instr_create_stack_frame, &op);
}

static void _generate_epilog(void)
{
    x86_operand op;

    bincode_create_operand_from_int_constant(&op, 0);
    unit_push_unary_instruction(x86instr_destroy_stack_frame, &op);
}

static void _generate_return(expression *ret_value)
{
    x86_operand res, tmp;

    if (ret_value) {
        _evaluate_nested_expression(ret_value, &res);

        if (_is_int_expr(ret_value)) {
            ASSERT(res.op_type == x86op_int_register || res.op_type == x86op_address);

            bincode_create_operand_from_int_register(&tmp, x86reg_eax);
            unit_push_binary_instruction(x86instr_int_mov, &tmp, &res);
        } else {
            ASSERT(res.op_type == x86op_float_register || res.op_type == x86op_address);

            if (res.op_type == x86op_address) {
                unit_push_unary_instruction(x86instr_float_ld, &res);
            }

            // otherwise result is already in st(0)
        }
    }

    _generate_epilog();
    unit_push_nullary_instruction(x86instr_ret);
}


//
//  Code generation for jumps.
//

static void _generate_common_conditional_jump(expression *condition, int destination, BOOL invert)
{
    x86_operand tmp, res;

    _evaluate_nested_expression(condition, &res);
    ASSERT(res.op_type == x86op_int_register || res.op_type == x86op_address);

    bincode_create_operand_from_int_constant(&tmp, 0);
    unit_push_binary_instruction(x86instr_int_cmp, &res, &tmp);

    bincode_create_operand_from_label(&tmp, destination);
    unit_push_unary_instruction((invert ? x86instr_je : x86instr_jne), &tmp);
}

static x86_instruction_code _condition_to_jump(arithmetic_opcode opcode, BOOL is_float)
{
    switch (opcode) {
    case op_less_then:      return (is_float ? x86instr_jb : x86instr_jl);
    case op_less_equal:     return (is_float ? x86instr_jbe : x86instr_jle);
    case op_greater_then:   return (is_float ? x86instr_ja : x86instr_jg);
    case op_greater_equal:  return (is_float ? x86instr_jae : x86instr_jge);
    case op_equal:          return x86instr_je;
    case op_non_equal:      return x86instr_jne;
    default:                ASSERT(FALSE);
    }
}

static x86_instruction_code _invert_jump(x86_instruction_code jump_instr)
{
    switch (jump_instr) {
    case x86instr_je:       return x86instr_jne;
    case x86instr_jne:      return x86instr_je;
    case x86instr_jle:      return x86instr_jg;
    case x86instr_jl:       return x86instr_jge;
    case x86instr_jge:      return x86instr_jl;
    case x86instr_jg:       return x86instr_jle;
    case x86instr_jbe:      return x86instr_ja;
    case x86instr_jb:       return x86instr_jae;
    case x86instr_jae:      return x86instr_jb;
    case x86instr_ja:       return x86instr_jbe;
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
    unit_push_unary_instruction(x86instr_label, &op);
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
    x86_instruction_code instr;
    BOOL is_float;

    if (condition->expr_code == code_expr_arithmetic) {
        arithm = &condition->data.arithm;

        if (IS_COMPARE_OP(arithm->opcode)) {
            // TODO: evaluate operands in proper order, according to complexity.
            _evaluate_nested_expression(arithm->operand1, &op1);
            _evaluate_nested_expression(arithm->operand2, &op2);

            is_float    = (arithm->operand1->expr_type->type_code == code_type_float);

            if (!is_float) {
                if (op1.op_type == x86op_address && op2.op_type == x86op_address) {
                    bincode_create_operand_from_int_pseudoreg(&tmp, x86_codegen_alloc_pseudoreg());
                    unit_push_binary_instruction(x86instr_int_mov, &tmp, &op1);
                    unit_push_binary_instruction(x86instr_int_cmp, &tmp, &op2);
                } else {
                    unit_push_binary_instruction(x86instr_int_cmp, &op1, &op2);
                }
            } else {
                if (op2.op_type == x86op_address) {
                    unit_push_unary_instruction(x86instr_float_ld, &op2);
                }

                if (op1.op_type == x86op_address) {
                    unit_push_unary_instruction(x86instr_float_ld, &op1);
                }

                if (op1.op_type != x86op_address && op2.op_type == x86op_address) {
                    invert = !invert;
                }

                unit_push_nullary_instruction(x86instr_float_cmp);
            }

            instr = _condition_to_jump(arithm->opcode, is_float);

            if (invert) {
                instr = _invert_jump(instr);
            }

            bincode_create_operand_from_label(&tmp, destination);
            unit_push_unary_instruction(instr, &tmp);
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
        unit_push_unary_instruction(x86instr_jmp, &dst);
    } else if (jump->condition->expr_code == code_expr_int_constant) {
        if (jump->condition->data.int_const != 0) {
            bincode_create_operand_from_label(&dst, jump->destination);
            unit_push_unary_instruction(x86instr_jmp, &dst);
        }
    } else if (jump->condition->expr_code == code_expr_float_constant) {
        aux_warning("exact comparison of float values");

        if (jump->condition->data.float_const.val != 0.0f) {
            bincode_create_operand_from_label(&dst, jump->destination);
            unit_push_unary_instruction(x86instr_jmp, &dst);
        }
    } else {
        _generate_conditional_jump(jump->condition, jump->destination, jump->invert_cond);
    }
}


//
// Hi-level code generation functions.
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
            unit_push_unary_instruction(x86instr_label, &label);
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


// This code extracts floating-point constants from function code and preallocates them in the .data section.

static void _extract_float_constants(expression *expr, void *unused)
{
    x86_instruction_code c  = bincode_encode_float_constant(expr->data.float_const.val);

    if (c == x86instr_count) {
        expr->data.float_const.sym = x86data_insert_float_constant(expr->data.float_const.val);
    }
}

static void _place_float_constants_into_data_section(void)
{
    expr_iterate_through_subexpressions(_curr_func->func_body, code_expr_float_constant, EXPR_IT_APPLY_FILTER,
        _extract_float_constants, NULL);
    x86data_enter_text_section();
}


// Code generator entry point.

void x86_codegen_do_function(function_desc *function)
{
    _last_int_pseudoreg = 1;
    _curr_func   = function;

    _place_float_constants_into_data_section();
    _generate_prolog();
    _walk_through_expressions();

    _curr_func   = NULL;
}

