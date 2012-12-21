
#include "common.h"
#include "x86_codegen.h"
#include "x86_intrinsics.h"
#include "x86_data.h"
#include "x86_stack_frame.h"
#include "x86_regalloc.h"


static function_desc *_curr_codegen_func = NULL;


static void _evaluate_nested_expression(expression *expr, x86_operand *res);


int x86_codegen_alloc_pseudoreg(x86_operand_type type)
{
    return _curr_codegen_func->func_pseudoregs_count[x86_encode_register_type(type)]++;
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

static x86_instruction_code _opcode_to_unsigned(x86_instruction_code opcode)
{
    switch (opcode) {
    case x86insn_int_imul:  return x86insn_int_mul;
    case x86insn_int_idiv:  return x86insn_int_div;
    case x86insn_int_sar:   return x86insn_int_shr;
    case x86insn_int_sal:   return x86insn_int_shl;
    case x86insn_int_setle: return x86insn_int_setbe;
    case x86insn_int_setl:  return x86insn_int_setb;
    case x86insn_int_setge: return x86insn_int_setae;
    case x86insn_int_setg:  return x86insn_int_seta;
    default:                return opcode;
    }
}

static x86_instruction_code _opcode_to_sse_instruction(arithmetic_opcode opcode)
{
    switch (opcode) {
    case op_add:            return x86insn_sse_addss;
    case op_sub:            return x86insn_sse_subss;
    case op_mul:            return x86insn_sse_mulss;
    case op_div:            return x86insn_sse_divss;

    case op_assign:         return x86insn_sse_movss;
    case op_add_assign:     return x86insn_sse_addss;
    case op_sub_assign:     return x86insn_sse_subss;
    case op_mul_assign:     return x86insn_sse_mulss;
    case op_div_assign:     return x86insn_sse_divss;

    case op_equal:          return x86insn_int_sete;
    case op_non_equal:      return x86insn_int_setne;
    case op_less_equal:     return x86insn_int_setbe;
    case op_less_then:      return x86insn_int_setb;
    case op_greater_equal:  return x86insn_int_setae;
    case op_greater_then:   return x86insn_int_seta;

    default:                ASSERT(FALSE);
    }
}

static x86_instruction_code _invert_comparison_operands(arithmetic_opcode opcode)
{
    switch (opcode) {
    case x86insn_int_setne: return x86insn_int_setne;
    case x86insn_int_sete:  return x86insn_int_sete;
    case x86insn_int_setg:  return x86insn_int_setl;
    case x86insn_int_setge: return x86insn_int_setle;
    case x86insn_int_setl:  return x86insn_int_setg;
    case x86insn_int_setle: return x86insn_int_setge;
    case x86insn_int_seta:  return x86insn_int_setb;
    case x86insn_int_setae: return x86insn_int_setbe;
    case x86insn_int_setb:  return x86insn_int_seta;
    case x86insn_int_setbe: return x86insn_int_setae;

    default:                ASSERT(FALSE);
    }
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

static x86_instruction_code _invert_jump_condition(x86_instruction_code jump_insn)
{
    switch (jump_insn) {
    case x86insn_je:        return x86insn_jne;
    case x86insn_jne:       return x86insn_je;
    case x86insn_jle:       return x86insn_jg;
    case x86insn_jl:        return x86insn_jge;
    case x86insn_jge:       return x86insn_jl;
    case x86insn_jg:        return x86insn_jle;
    case x86insn_jbe:       return x86insn_ja;
    case x86insn_jb:        return x86insn_jae;
    case x86insn_jae:       return x86insn_jb;
    case x86insn_ja:        return x86insn_jbe;
    default:                ASSERT(FALSE);
    }
}

static x86_instruction_code _invert_jump_operands(x86_instruction_code jump_insn)
{
    switch (jump_insn) {
    case x86insn_je:        return x86insn_je;
    case x86insn_jne:       return x86insn_jne;
    case x86insn_jle:       return x86insn_jge;
    case x86insn_jl:        return x86insn_jg;
    case x86insn_jge:       return x86insn_jle;
    case x86insn_jg:        return x86insn_jl;
    case x86insn_jbe:       return x86insn_jae;
    case x86insn_jb:        return x86insn_ja;
    case x86insn_jae:       return x86insn_jbe;
    case x86insn_ja:        return x86insn_jb;
    default:                ASSERT(FALSE);
    }
}


//
// Кодогенерация для унарных выражений.
//

static void _generate_convert_int2float(x86_operand *res, x86_operand *op)
{
    ASSERT(OP_IS_INT(*op) && OP_IS_REGISTER_OR_ADDRESS(*op));

    bincode_create_operand_and_alloc_pseudoreg(res, x86op_float);
    unit_push_binary_instruction(x86insn_sse_load_int, res, op);
}

static void _generate_convert_float2int(x86_operand *res, x86_operand *op)
{
    x86_operand tmp;

    ASSERT(OP_IS_FLOAT(*op) && OP_IS_REGISTER_OR_ADDRESS(*op));
    bincode_create_operand_and_alloc_pseudoreg(res, x86op_dword);

    if (OP_IS_ADDRESS(*op)) {
        bincode_create_operand_and_alloc_pseudoreg(&tmp, x86op_float);
        unit_push_binary_instruction(x86insn_sse_movss, &tmp, op);
        unit_push_binary_instruction(x86insn_sse_store_int, res, &tmp);
    } else {
        unit_push_binary_instruction(x86insn_sse_store_int, res, op);
    }
}

static void _generate_convert_float2double(x86_operand *res, x86_operand *op)
{
    ASSERT(OP_IS_FLOAT(*op) && OP_IS_REGISTER_OR_ADDRESS(*op));

    bincode_create_operand_and_alloc_pseudoreg(res, x86op_double);
    unit_push_binary_instruction(x86insn_sse_float2double, res, op);
}

static void _generate_convert_double2float(x86_operand *res, x86_operand *op)
{
    ASSERT(OP_IS_FLOAT(*op) && OP_IS_REGISTER_OR_ADDRESS(*op));

    bincode_create_operand_and_alloc_pseudoreg(res, x86op_float);
    unit_push_binary_instruction(x86insn_sse_double2float, res, op);
}

static void _generate_dereference(x86_operand *res, x86_operand *op, data_type *type)
{
    ASSERT(OP_IS_ADDRESS(*op) || OP_IS_REGISTER(*op, x86op_dword) || OP_IS_SYM_OFFSET(*op));

    if (op->op_loc == x86loc_register) {
        bincode_create_operand_addr_from_reg(res, bincode_encode_type(type), op->data.reg);
    } else if (OP_IS_SYM_OFFSET(*op)) {
        *res            = *op;
        res->op_loc     = x86loc_symbol;
    } else {
        bincode_create_operand_and_alloc_pseudoreg(res, x86op_dword);
        unit_push_binary_instruction(x86insn_int_mov, res, op);

        bincode_create_operand_addr_from_reg(res, bincode_encode_type(type), res->data.reg);
    }
}

static void _generate_get_address(x86_operand *res, x86_operand *op)
{
    ASSERT(OP_IS_ADDRESS(*op));

    if (op->data.address.base != 0 && op->data.address.index == 0 && op->data.address.offset == 0) {
        bincode_create_operand_from_pseudoreg(res, x86op_dword, op->data.address.base);
    } else {
        bincode_create_operand_and_alloc_pseudoreg(res, x86op_dword);
        unit_push_binary_instruction(x86insn_lea, res, op);
    }
}

static void _generate_int2bool(x86_operand *res, x86_operand *op, BOOL invert)
{
    x86_operand tmp;

    ASSERT(OP_IS_INT(*op));

    if (op->op_loc == x86loc_address) {
        bincode_create_operand_and_alloc_pseudoreg(&tmp, x86op_dword);
        unit_push_binary_instruction(x86insn_int_mov, &tmp, op);
        unit_push_binary_instruction(x86insn_int_test, &tmp, &tmp);
    } else {
        unit_push_binary_instruction(x86insn_int_test, op, op);
    }

    bincode_create_operand_and_alloc_pseudoreg(res, x86op_byte);
    unit_push_unary_instruction(invert ? x86insn_int_sete : x86insn_int_setne, res);
}


#define CONVERT_INCDEC_TO_BINARY(CODE) ((x86_instruction_code) (CODE + 5))

static void _generate_inc_dec(expr_arithm *arithm, x86_operand *op, data_type *type)
{
    x86_instruction_code insn = _opcode_to_unary_int_instruction(arithm->opcode);

    ASSERT(OP_IS_INT(*op) && OP_IS_REGISTER_OR_ADDRESS(*op));

    if (IS_INCREMENT_DECREMENT(arithm->opcode) && arithm->step != 1) {
        x86_instruction_code bin = CONVERT_INCDEC_TO_BINARY(insn);
        x86_operand op2;

        bincode_create_operand_from_int_constant(&op2, bincode_encode_type(type), arithm->step);
        unit_push_binary_instruction(bin, op, &op2);
    } else {
        unit_push_unary_instruction(insn, op);
    }
}

const unsigned  _negate_float           = 0x80000000;
const unsigned long long _negate_double = 0x8000000000000000;

static void _generate_common_unary_arithm_expr(expression *expr, x86_operand *res, x86_operand *op)
{
    symbol *constant;
    x86_operand tmp;

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
            bincode_create_operand_and_alloc_pseudoreg(res, op->op_type);
            unit_push_binary_instruction(ENCODE_SSE_MOV(op->op_type), res, op);
        }

        constant = x86data_insert_float4_constant(_negate_float, 0, 0, 0);
        bincode_create_operand_from_symbol(&tmp, constant);
        unit_push_binary_instruction(
            (op->op_type == x86op_float ? x86insn_sse_xorps : x86insn_sse_xorpd), res, &tmp);
    }
}


//
// Кодогенерация для бинарных выражений.
//

static void _generate_int_simple_expr(arithmetic_opcode opcode, expr_arithm *arithm, x86_operand *res, x86_operand *op1, x86_operand *op2)
{
    x86_instruction_code insn = _opcode_to_binary_int_instruction(opcode);
    x86_operand tmp;
    BOOL is_unsigned = TYPE_IS_UNSIGNED(arithm->operand1->expr_type);

    ASSERT(is_unsigned == TYPE_IS_UNSIGNED(arithm->operand2->expr_type));
    ASSERT(OP_IS_INT(*op1) && OP_IS_REGISTER_OR_ADDRESS(*op1));
    ASSERT(OP_IS_INT(*op2));
    ASSERT(op1->op_type == op2->op_type);

    if (is_unsigned) {
        insn = _opcode_to_unsigned(insn);
    }

    // TODO: поддержать кодогенерацию для long long
    // TODO: поддержать кодогенерацию для операндов типа byte/word

    *res = *op1;

    if (IS_COMPARE_OP(opcode)) {
        if (op1->op_loc != x86loc_register && op2->op_loc != x86loc_register) {
            bincode_create_operand_and_alloc_pseudoreg(&tmp, op1->op_type);
            unit_push_binary_instruction(x86insn_int_mov, &tmp, op1);
            unit_push_binary_instruction(x86insn_int_cmp, &tmp, op2);
        } else {
            unit_push_binary_instruction(x86insn_int_cmp, op1, op2);
        }

        bincode_create_operand_and_alloc_pseudoreg(&tmp, x86op_byte);
        unit_push_unary_instruction(insn, &tmp);

        bincode_create_operand_and_alloc_pseudoreg(res, x86op_dword);
        unit_push_binary_instruction(x86insn_movzx, res, &tmp);
    } else if (opcode == op_mul) {
        if (!OP_IS_REGISTER(*op1, x86op_dword)) {
            bincode_create_operand_and_alloc_pseudoreg(res, op1->op_type);  // eax
            unit_push_binary_instruction(x86insn_int_mov, res, op1);
        }

        if (is_unsigned) {
            bincode_create_operand_and_alloc_pseudoreg(&tmp, res->op_type);     // edx
            unit_push_ternary_instruction(x86insn_int_mul, res, op2, &tmp);
        } else {
            unit_push_binary_instruction(x86insn_int_imul, res, op2);
        }
    } else if (opcode == op_div) {
        if (!OP_IS_REGISTER(*op1, x86op_dword)) {
            bincode_create_operand_and_alloc_pseudoreg(res, op1->op_type);  // eax
            unit_push_binary_instruction(x86insn_int_mov, res, op1);
        }

        bincode_create_operand_and_alloc_pseudoreg(&tmp, res->op_type);     // edx

		if (is_unsigned) {
			unit_push_unary_instruction(x86insn_xor_edx_edx, &tmp);
	        unit_push_ternary_instruction(x86insn_int_div, res, op2, &tmp);
		} else {
			unit_push_binary_instruction(x86insn_cdq, &tmp, res);
	        unit_push_ternary_instruction(x86insn_int_idiv, res, op2, &tmp);
		}
    } else if (opcode == op_mod) {
        bincode_create_operand_and_alloc_pseudoreg(res, op1->op_type);      // edx

        if (!OP_IS_REGISTER(*op1, x86op_dword)) {
            bincode_create_operand_and_alloc_pseudoreg(&tmp, op1->op_type); // eax
            unit_push_binary_instruction(x86insn_int_mov, &tmp, op1);
        } else {
            tmp = *op1;
        }

		if (is_unsigned) {
	        unit_push_unary_instruction(x86insn_xor_edx_edx, res);
	        unit_push_ternary_instruction(x86insn_int_div, &tmp, op2, res);
		} else {
	        unit_push_binary_instruction(x86insn_cdq, res, &tmp);
		    unit_push_ternary_instruction(x86insn_int_idiv, &tmp, op2, res);
		}
    } else if (IS_SHIFT_OP(opcode)) {
        if (op2->op_loc != x86loc_register) {
            bincode_create_operand_and_alloc_pseudoreg(&tmp, op2->op_type);
            unit_push_binary_instruction(x86insn_int_mov, &tmp, op2);
        } else {
            tmp = *op2;
        }

        if (op1->op_loc != x86loc_register) {
            bincode_create_operand_and_alloc_pseudoreg(res, op1->op_type);
            unit_push_binary_instruction(x86insn_int_mov, res, op1);
            unit_push_binary_instruction(insn, res, &tmp);
        } else {
            unit_push_binary_instruction(insn, op1, &tmp);
        }
    } else if (op1->op_loc != x86loc_register) {
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

static arithmetic_opcode _convert_assign_opcode_to_simple(arithmetic_opcode opcode)
{
    ASSERT(IS_ASSIGN_OP(opcode));
    return (opcode - op_add_assign);
}

static void _generate_int_binary_expr(expression *expr, x86_operand *res, x86_operand *op1, x86_operand *op2)
{
    arithmetic_opcode opcode = expr->data.arithm.opcode;
    x86_operand tmp;

    ASSERT(expr->expr_code == code_expr_arithmetic);

    if (opcode == op_assign) {
        ASSERT(op1->op_loc == x86loc_address);

        if (op2->op_loc != x86loc_register) {
            bincode_create_operand_and_alloc_pseudoreg(res, op1->op_type);
            unit_push_binary_instruction(x86insn_int_mov, res, op2);
            unit_push_binary_instruction(x86insn_int_mov, op1, res);
        } else {
            unit_push_binary_instruction(x86insn_int_mov, op1, op2);
            res = op1;
        }
    } else if (IS_ASSIGN_OP(opcode)) {
        opcode = _convert_assign_opcode_to_simple(opcode);

        if (op1->op_loc != x86loc_register) {
            bincode_create_operand_and_alloc_pseudoreg(&tmp, op1->op_type);
            unit_push_binary_instruction(x86insn_int_mov, &tmp, op1);

            _generate_int_simple_expr(opcode, &expr->data.arithm, res, &tmp, op2);
            ASSERT(OP_IS_REGISTER(*res, x86op_dword));
            unit_push_binary_instruction(x86insn_int_mov, op1, res);
        } else {
            _generate_int_simple_expr(opcode, &expr->data.arithm, res, op1, op2);
            ASSERT(OP_IS_REGISTER(*res, x86op_dword));
            unit_push_binary_instruction(x86insn_int_mov, op1, res);
        }
    } else {
        _generate_int_simple_expr(opcode, &expr->data.arithm, res, op1, op2);
    }
}

static void _generate_sse_binary_expr(expression *expr, x86_operand *res, x86_operand *op1, x86_operand *op2)
{
    x86_instruction_code insn = _opcode_to_sse_instruction(expr->data.arithm.opcode);

    ASSERT(OP_IS_FLOAT(*op1) && OP_IS_REGISTER_OR_ADDRESS(*op1));
    ASSERT(OP_IS_FLOAT(*op2) && OP_IS_REGISTER_OR_ADDRESS(*op2));

    *res = *op1;

    if (expr->data.arithm.opcode == op_assign) {
        if (OP_IS_ADDRESS(*op1) && OP_IS_ADDRESS(*op2)) {
            bincode_create_operand_and_alloc_pseudoreg(res, op1->op_type);
            unit_push_binary_instruction(ENCODE_SSE_MOV(op1->op_type), res, op2);
            unit_push_binary_instruction(ENCODE_SSE_MOV(op1->op_type), op1, res);
        } else {
            unit_push_binary_instruction(ENCODE_SSE_MOV(op1->op_type), op1, op2);
        }
    } else if (IS_ASSIGN_OP(expr->data.arithm.opcode)) {
        ASSERT(OP_IS_ADDRESS(*op1));
        bincode_create_operand_and_alloc_pseudoreg(res, op1->op_type);
        unit_push_binary_instruction(ENCODE_SSE_MOV(op1->op_type), res, op1);

        if (op1->op_type != x86op_float) {
            insn += (x86insn_sse_addsd - x86insn_sse_addss);
        }

        unit_push_binary_instruction(insn, res, op2);
        unit_push_binary_instruction(ENCODE_SSE_MOV(op1->op_type), op1, res);
    } else if (IS_COMPARE_OP(expr->data.arithm.opcode)) {
        if (OP_IS_ADDRESS(*op1) && OP_IS_ADDRESS(*op2)) {
            bincode_create_operand_and_alloc_pseudoreg(res, op1->op_type);
            unit_push_binary_instruction(ENCODE_SSE_MOV(op1->op_type), res, op1);
            unit_push_binary_instruction(ENCODE_SSE_COMPARE(op1->op_type), res, op2);
        } else if (OP_IS_ADDRESS(*op1)) {
            unit_push_binary_instruction(ENCODE_SSE_COMPARE(op1->op_type), op2, op1);
            insn = _invert_comparison_operands(insn);
        } else {
            unit_push_binary_instruction(ENCODE_SSE_COMPARE(op1->op_type), op1, op2);
        }

        bincode_create_operand_and_alloc_pseudoreg(op2, x86op_byte);
        unit_push_unary_instruction(insn, op2);

        bincode_create_operand_and_alloc_pseudoreg(res, x86op_dword);
        unit_push_binary_instruction(x86insn_movzx, res, op2);
    } else {
        if (op1->op_type != x86op_float) {
            insn += (x86insn_sse_addsd - x86insn_sse_addss);
        }

        if (OP_IS_ADDRESS(*op1)) {
            bincode_create_operand_and_alloc_pseudoreg(res, op1->op_type);
            unit_push_binary_instruction(ENCODE_SSE_MOV(op1->op_type), res, op1);
            unit_push_binary_instruction(insn, res, op2);
        } else {
            unit_push_binary_instruction(insn, op1, op2);
        }
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
    } else if (expr->data.arithm.opcode == op_convert_float2double) {
        _generate_convert_float2double(res, &op);
    } else if (expr->data.arithm.opcode == op_convert_double2float) {
        _generate_convert_double2float(res, &op);
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
    BOOL is_int_op          = TYPE_IS_INTEGRAL_OR_POINTER(expr->data.arithm.operand1->expr_type);

    if (expr->data.arithm.operand1->expr_complexity < expr->data.arithm.operand2->expr_complexity) {
        _evaluate_nested_expression(expr->data.arithm.operand2, &op2);
        _evaluate_nested_expression(expr->data.arithm.operand1, &op1);
    } else {
        _evaluate_nested_expression(expr->data.arithm.operand1, &op1);
        _evaluate_nested_expression(expr->data.arithm.operand2, &op2);
    }

    ASSERT(op1.op_type == op2.op_type);

    if (is_structure_op) {
        ASSERT(expr->data.arithm.opcode == op_assign);
        x86_intrinsic_static_memcpy(res, &op1, &op2, type_calculate_sizeof(expr->expr_type));
    } else if (is_int_op) {
        _generate_int_binary_expr(expr, res, &op1, &op2);
    } else {
        _generate_sse_binary_expr(expr, res, &op1, &op2);
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
        bincode_create_operand_from_int_constant(&tmp2, x86op_dword, param_size);
        unit_push_binary_instruction(x86insn_push_arg, &tmp, &tmp2);

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
    tmp2.op_loc     = x86loc_none;
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
        bincode_create_operand_and_alloc_pseudoreg(res, tmp2.op_type);
        unit_push_unary_instruction(x86insn_read_retval, res);
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

    bincode_create_operand_and_alloc_pseudoreg(res, x86op_dword);
    unit_push_binary_instruction(x86insn_lea, res, &tmp);

    bincode_create_operand_addr_from_reg(res, bincode_encode_type(type), res->data.reg);
}

static void _evaluate_nested_expression(expression *expr, x86_operand *res)
{
    x86_operand tmp;
    symbol *sym;

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

    case code_expr_string:
        sym = symbol_create_unnamed("string", code_sym_variable, expr->expr_type);
        x86data_declare_initialized_string(sym, expr->data.str);

        res->op_loc             = x86loc_symbol_offset;
        res->op_type            = x86op_dword;
        res->data.sym.name      = sym;
        res->data.sym.offset    = 0;
        break;

    case code_expr_int_constant:
        bincode_create_operand_and_alloc_pseudoreg(res, bincode_encode_type(expr->expr_type));
        bincode_create_operand_from_int_constant(&tmp, bincode_encode_type(expr->expr_type), expr->data.int_const);
        unit_push_binary_instruction(x86insn_int_mov, res, &tmp);
        break;

    case code_expr_float_constant:
        _load_symbol(expr->data.float_const.sym, expr->expr_type, &tmp);
        bincode_create_operand_and_alloc_pseudoreg(res, bincode_encode_type(expr->expr_type));
        unit_push_binary_instruction(ENCODE_SSE_MOV(res->op_type), res, &tmp);
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
    x86_operand res;

    if (ret_value) {
        _evaluate_nested_expression(ret_value, &res);
        ASSERT(res.op_loc == x86loc_register || res.op_loc == x86loc_address);
        unit_push_unary_instruction(x86insn_set_retval, &res);
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


static void _generate_conditional_jump(expression *condition, int destination, BOOL invert);

static void _generate_jumps_for_and(expression *cond1, expression *cond2, int destination, BOOL invert_operands)
{
    int label = unit_create_label(_curr_codegen_func);
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

static void _generate_conditional_jump(expression *condition, int destination, BOOL invert_condition)
{
    expr_arithm *arithm;
    x86_operand op1, op2, tmp;
    x86_instruction_code insn;
    BOOL invert_operands = FALSE;
    data_type *type;

    if (condition->expr_code == code_expr_arithmetic) {
        arithm  = &condition->data.arithm;
        type    = arithm->operand1->expr_type;

        if (IS_COMPARE_OP(arithm->opcode)) {
            if (arithm->operand1->expr_complexity >= arithm->operand2->expr_complexity) {
                _evaluate_nested_expression(arithm->operand1, &op1);
                _evaluate_nested_expression(arithm->operand2, &op2);
            } else {
                _evaluate_nested_expression(arithm->operand2, &op1);
                _evaluate_nested_expression(arithm->operand1, &op2);
                invert_operands = TRUE;
            }

            if (!TYPE_IS_FLOATING(type)) {
                if (op1.op_loc == x86loc_address && op2.op_loc == x86loc_address) {
                    bincode_create_operand_and_alloc_pseudoreg(&tmp, op1.op_type);
                    unit_push_binary_instruction(x86insn_int_mov, &tmp, &op1);
                    unit_push_binary_instruction(x86insn_int_cmp, &tmp, &op2);
                } else {
                    unit_push_binary_instruction(x86insn_int_cmp, &op1, &op2);
                }
            } else {
                if (op1.op_loc == x86loc_address && op2.op_loc == x86loc_address) {
                    bincode_create_operand_and_alloc_pseudoreg(&tmp, op1.op_type);
                    unit_push_binary_instruction(ENCODE_SSE_MOV(op1.op_type), &tmp, &op1);
                    unit_push_binary_instruction(ENCODE_SSE_COMPARE(op1.op_type), &tmp, &op2);
                } else if (op1.op_loc == x86loc_address) {
                    unit_push_binary_instruction(ENCODE_SSE_COMPARE(op1.op_type), &op2, &op1);
                    invert_operands = !invert_operands;
                } else {
                    unit_push_binary_instruction(ENCODE_SSE_COMPARE(op1.op_type), &op1, &op2);
                }
            }

            insn = _condition_to_jump(arithm->opcode, TYPE_IS_FLOATING(type));

            if (invert_condition) {
                insn = _invert_jump_condition(insn);
            }

            if (invert_operands) {
                insn = _invert_jump_operands(insn);
            }

            bincode_create_operand_from_label(&tmp, destination);
            unit_push_unary_instruction(insn, &tmp);
        } else if (arithm->opcode == op_not) {
            _generate_conditional_jump(arithm->operand1, destination, !invert_condition);
        } else if (arithm->opcode == op_logical_and_in_jump) {
            if (!invert_condition) {
                _generate_jumps_for_and(arithm->operand1, arithm->operand2, destination, FALSE);
            } else {
                _generate_jumps_for_or(arithm->operand1, arithm->operand2, destination, TRUE);
            }
        } else if (arithm->opcode == op_logical_or_in_jump) {
            if (!invert_condition) {
                _generate_jumps_for_or(arithm->operand1, arithm->operand2, destination, FALSE);
            } else {
                _generate_jumps_for_and(arithm->operand1, arithm->operand2, destination, TRUE);
            }
        } else {
            _generate_common_conditional_jump(condition, destination, invert_condition);
        }
    } else {
        _generate_common_conditional_jump(condition, destination, invert_condition);
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

    for (expr = _curr_codegen_func->func_body; expr; expr = expr->expr_next) {
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
    if (expr->expr_type->type_code == code_type_float) {
        float c = expr->data.float_const.val;
        expr->data.float_const.sym = x86data_insert_float_constant(*(long*)&c);
    } else if (expr->expr_type->type_code == code_type_double) {
        expr->data.float_const.sym = x86data_insert_double_constant(*(long long*)&expr->data.float_const.val);
    } else {
        ASSERT(FALSE);
    }
}

static void _place_float_constants_into_data_section(void)
{
    expr_iterate_through_subexpressions(_curr_codegen_func->func_body, code_expr_float_constant, EXPR_IT_APPLY_FILTER,
        _extract_float_constants, NULL);
}


// Точка входа в кодогенератор.

AUX_CASSERT(sizeof(_curr_codegen_func->func_pseudoregs_count)/sizeof(int) == X86_TYPES_COUNT);

void x86_codegen_do_function(function_desc *function)
{
    x86_operand_type type;

    _curr_codegen_func = function;

    for (type = 0; type < X86_TYPES_COUNT; type++) {
        _curr_codegen_func->func_pseudoregs_count[type] = 1;
    }

    _place_float_constants_into_data_section();
    _generate_prolog();
    _walk_through_expressions();

    _curr_codegen_func = NULL;
}

