
#include "common.h"
#include "unit.h"
#include "x86_bincode.h"
#include "x86_stack_frame.h"
#include "x86_regalloc.h"


//
// Собирает статистику использования этой и других функций:
// - вычисляет длину этой функции в инструкциях;
// - инкрементирует счётчики использования всех функций, вызываемых из данной.
//
void x86_inlining_analyze_function(function_desc *function)
{
    x86_instruction *insn;
    function_desc *callee;

    function->func_insn_count = unit_get_instruction_count(function);

    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        if (insn->in_code == x86insn_call && insn->in_op1.op_loc == x86loc_symbol) {
            callee = unit_find_function(insn->in_op1.data.sym.name);
            if (callee && callee->func_usage_count != -1) {
                callee->func_usage_count++;
            }
        } else if (insn->in_op1.op_loc == x86loc_symbol || insn->in_op1.op_loc == x86loc_symbol_offset) {
            callee = unit_find_function(insn->in_op1.data.sym.name);
            if (callee) {
                callee->func_usage_count = -1;
            }
        } else if (insn->in_op2.op_loc == x86loc_symbol || insn->in_op2.op_loc == x86loc_symbol_offset) {
            callee = unit_find_function(insn->in_op2.data.sym.name);
            if (callee) {
                callee->func_usage_count = -1;
            }
        }
    }
}


//
// Корректирует стековый адрес в заинлайненной функции в данном операнде.
//
static void _fixup_stack_address(x86_operand *op, int params_ofs, int locals_ofs)
{
    if (op->op_loc == x86loc_address && op->data.address.base == ~x86reg_ebp) {
        op->data.address.offset += (op->data.address.offset > 0 ? params_ofs : locals_ofs);
    }
}

//
// Корректирует стековые адреса и псевдорегистры в данной инструкции.
//
static void _fixup_instruction(x86_instruction *inserted, int regs_ofs[X86_REGISTER_TYPES_COUNT],
    int params_ofs, int locals_ofs)
{
    int i, type, regs_cnt;
    x86_register_ref regs[MAX_REGISTERS_PER_INSN];

    for (type = 0; type < X86_REGISTER_TYPES_COUNT; type++) {
        bincode_extract_pseudoregs_from_insn(inserted, type, regs, &regs_cnt);

        for (i = 0; i < regs_cnt; i++) {
            *regs[i].reg_addr += regs_ofs[type];
        }
    }

    _fixup_stack_address(&inserted->in_op1, params_ofs, locals_ofs);
    _fixup_stack_address(&inserted->in_op2, params_ofs, locals_ofs);
}

//
// Генерирует код, возвращающий значение из заинлайненой функции.
//
static void _patch_retval(function_desc *caller, x86_instruction *inserted, int res_ofs)
{
    x86_operand op;

    ASSERT(OP_IS_REGISTER_OR_ADDRESS(inserted->in_op1));

    if (!OP_IS_FLOAT(inserted->in_op1)) {
        inserted->in_code   = x86insn_int_mov;

        if (inserted->in_op1.op_loc == x86loc_register) {
            inserted->in_op2    = inserted->in_op1;
            bincode_create_operand_addr_from_ebp_offset(&inserted->in_op1,
                inserted->in_op1.op_type, res_ofs);
        } else {
            bincode_create_operand_and_alloc_pseudoreg_in_function(
                caller, &op, inserted->in_op1.op_type);
            bincode_insert_instruction(caller, inserted, x86insn_int_mov, &op, &inserted->in_op1);

            inserted->in_op2    = op;
            bincode_create_operand_addr_from_ebp_offset(&inserted->in_op1,
                inserted->in_op1.op_type, res_ofs);
        }
    } else if (!option_use_sse2) {
        inserted->in_code = x86insn_fpu_stp;

        if (inserted->in_op1.op_loc == x86loc_register) {
            bincode_create_operand_addr_from_ebp_offset(&inserted->in_op1,
                inserted->in_op1.op_type, res_ofs);
        } else {
            bincode_insert_unary_instruction(caller, inserted, x86insn_fpu_ld, &inserted->in_op1);
            bincode_create_operand_addr_from_ebp_offset(&inserted->in_op1,
                inserted->in_op1.op_type, res_ofs);
        }
    } else {
        //  SSE-вариант для записи результата
        inserted->in_code = ENCODE_SSE_MOV(inserted->in_op1.op_type);

        if (inserted->in_op1.op_loc == x86loc_register) {
            inserted->in_op2 = inserted->in_op1;
            bincode_create_operand_addr_from_ebp_offset(&inserted->in_op1,
                inserted->in_op1.op_type, res_ofs);
        } else {
            bincode_create_operand_and_alloc_pseudoreg_in_function(caller, &op, inserted->in_op1.op_type);
            bincode_insert_instruction(caller, inserted, inserted->in_code, &op, &inserted->in_op1);
            bincode_create_operand_addr_from_ebp_offset(&inserted->in_op1,
                inserted->in_op1.op_type, res_ofs);
            inserted->in_op2 = op;
        }
    }
}

//
// Эта функция должна:
// - вставить код вызываемой функции;
// - скорректировать смещения всех параметров и локальных переменных вызываемой функции;
// - скорректировать значения псевдо-регистров и меток;
// - пропатчить все ret на jump в конец функции;
// - пропатчить все set_retval на запись в результат.
//

static void _insert_function_code(x86_instruction *point, function_desc *callee, function_desc *caller,
    int params_ofs, int locals_ofs, int regs_ofs[X86_REGISTER_TYPES_COUNT], int labels_ofs, int res_ofs)
{
    x86_operand op;
    x86_instruction *insn, *inserted;
    int return_label;

    return_label = caller->func_labels_count++;

    for (insn = callee->func_binary_code; insn; insn = insn->in_next) {
        if (insn->in_code == x86insn_create_stack_frame || insn->in_code == x86insn_destroy_stack_frame) {
            continue;
        }

        if (insn->in_code == x86insn_ret && !insn->in_next) {
            break;
        }

        bincode_insert_instruction(caller, point, insn->in_code, &insn->in_op1, &insn->in_op2);
        inserted = point->in_prev;
        inserted->in_op3 = insn->in_op3;

        if (inserted->in_code == x86insn_ret) {
            inserted->in_code = x86insn_jmp;
            bincode_create_operand_from_label(&inserted->in_op1, return_label);
        } else if (inserted->in_code == x86insn_label) {
            inserted->in_op1.data.label += labels_ofs;
        } else if (IS_JMP_INSN(inserted->in_code)) {
            inserted->in_op1.data.label += labels_ofs;
        } else if (inserted->in_code == x86insn_set_retval) {
            _fixup_instruction(inserted, regs_ofs, params_ofs, locals_ofs);
            _patch_retval(caller, inserted, res_ofs);
        } else {
            _fixup_instruction(inserted, regs_ofs, params_ofs, locals_ofs);
        }
    }

    bincode_create_operand_from_label(&op, return_label);
    bincode_insert_unary_instruction(caller, point, x86insn_label, &op);
}

//
// Эта функция инлайнит все вхождения данной функции, если они есть.
// Если обнаружено хотя бы одно вхождение, то в стеке выделяется место
// под все локальные переменые и параметры функции, и под результат, если он есть.
// Затем каждое вхождение заменяется кодом вызываемой функции.
//
static void _inline_function_if_used(function_desc *callee, function_desc *caller)
{
    x86_instruction *insn, *next_insn, *prev_insn;
    BOOL was = FALSE;
    int params_total_sz = 0, params_ofs = 0, locals_ofs = 0, ofs, sz, type, labels_ofs, res_ofs = 0;
    int regs_ofs[X86_REGISTER_TYPES_COUNT];
    x86_operand tmp;
    symbol *sym, *sym_copy;
    parameter *param;


    for (insn = caller->func_binary_code; insn; insn = next_insn) {
        next_insn = insn->in_next;

        // Если это не вызов интересующей функции, пропускаем.
        if (insn->in_code != x86insn_call || insn->in_op1.op_loc != x86loc_symbol
            || !symbol_equal(insn->in_op1.data.sym.name, callee->func_sym)) {
                continue;
        }

        // Если это первое вхождение, маппим локальные переменные и параметры.
        if (!was) {
            was = TRUE;

            ASSERT(insn->in_code == x86insn_call);

            if (next_insn->in_code == x86insn_restore_stack) {
                // если есть параметры, выделяем место в стеке
                params_total_sz = next_insn->in_op1.data.int_val;
                params_ofs      = x86_stack_frame_alloc_tmp_var(caller, params_total_sz) - 8;

                // для каждого параметра создаём локальную переменную
                param   = callee->func_sym->sym_type->data.function.parameters_list->param_first;
                ofs     = params_ofs + 8;

                for (; param; param = param->param_next) {
                    sym             = unit_create_temporary_variable(caller, param->param_sym->sym_type);
                    sym->sym_offset = ofs;
                    sz              = type_calculate_sizeof(param->param_sym->sym_type);
                    ofs             += sz;
                }
            }

            if (callee->func_local_vars_sz) {
                // если есть локальные переменные, выделяем под них место в стеке
                locals_ofs = x86_stack_frame_alloc_tmp_var(caller, callee->func_local_vars_sz)
                    + callee->func_local_vars_sz;

                // для каждой из них создаём локальную переменную в стеке вызывающей функции
                for (sym = callee->func_locals.list_first; sym; sym = sym->sym_next) {
                    sym_copy = unit_create_temporary_variable(caller, sym->sym_type);
                    sym_copy->sym_offset = sym->sym_offset + locals_ofs;
                }
            }

            if (insn->in_op2.op_type != x86op_unused) {
                // если есть возвращаемое значение, выделяем под него место в стеке
                res_ofs = x86_stack_frame_alloc_tmp_var(caller,
                    type_calculate_sizeof(callee->func_sym->sym_type->data.function.result_type));

                // создаём локальную переменную для результата
                sym = unit_create_temporary_variable(caller, callee->func_sym->sym_type->data.function.result_type);
                sym->sym_offset = res_ofs;
            }
        }


        // Патчим запись параметров и удаляем остальной код вызова.
        next_insn = insn->in_next;
        prev_insn = insn->in_prev;
        ofs = 8;

        ASSERT(insn->in_code == x86insn_call);
        bincode_erase_instruction(caller, insn);

        for (insn = prev_insn; insn->in_code != x86insn_push_all; insn = prev_insn) {
            prev_insn = insn->in_prev;
            if (insn->in_code != x86insn_push_arg) continue;

            ASSERT(insn->in_op2.op_loc == x86loc_int_constant)
            sz = insn->in_op2.data.int_val;
            insn->in_op2 = insn->in_op1;

            // патчим push_arg на специфичную для типа данных инструкцию
            if (insn->in_op1.op_loc == x86loc_register) {
                if (!OP_IS_FLOAT(insn->in_op1)) {
                    insn->in_code       = x86insn_int_mov;
                    bincode_create_operand_addr_from_ebp_offset(&insn->in_op1, insn->in_op2.op_type, ofs + params_ofs);
                } else if (!option_use_sse2) {
                    insn->in_code       = x86insn_fpu_stp;
                    insn->in_op2.op_loc = x86loc_none;
                    bincode_create_operand_addr_from_ebp_offset(&insn->in_op1, insn->in_op2.op_type, ofs + params_ofs);
                } else {
                    insn->in_code       = ENCODE_SSE_MOV(insn->in_op1.op_type);
                    bincode_create_operand_addr_from_ebp_offset(&insn->in_op1, insn->in_op2.op_type, ofs + params_ofs);
                }
            } else if (insn->in_op1.op_loc == x86loc_address || insn->in_op1.op_loc == x86loc_symbol) {
                if (!OP_IS_FLOAT(insn->in_op1)) {
                    insn->in_code       = x86insn_int_mov;
                    bincode_create_operand_and_alloc_pseudoreg_in_function(caller, &insn->in_op1, x86op_dword);
                    bincode_create_operand_addr_from_ebp_offset(&tmp, x86op_dword, ofs + params_ofs);
                    bincode_insert_instruction(caller, insn->in_next, x86insn_int_mov, &tmp, &insn->in_op1);
                } else if (!option_use_sse2) {
                    insn->in_code       = x86insn_fpu_ld;
                    insn->in_op2.op_loc = x86op_none;

                    bincode_create_operand_addr_from_ebp_offset(&tmp, insn->in_op1.op_type, ofs + params_ofs);
                    bincode_insert_unary_instruction(caller, insn->in_next, x86insn_fpu_stp, &tmp);
                } else {
                    insn->in_code       = ENCODE_SSE_MOV(insn->in_op1.op_type);
                    bincode_create_operand_and_alloc_pseudoreg_in_function(caller, &insn->in_op1, insn->in_op2.op_type);
                    bincode_create_operand_addr_from_ebp_offset(&tmp, insn->in_op2.op_type, ofs + params_ofs);
                    bincode_insert_instruction(caller, insn->in_next, insn->in_code, &tmp, &insn->in_op1);
                }
            } else if (insn->in_op1.op_loc == x86loc_int_constant || insn->in_op1.op_loc == x86loc_symbol_offset) {
                ASSERT(OP_IS_INT(insn->in_op1));
                insn->in_code       = x86insn_int_mov;
                bincode_create_operand_addr_from_ebp_offset(&insn->in_op1, insn->in_op1.op_type, ofs + params_ofs);
            } else {
                ASSERT(FALSE);
            }

            ofs += sz;
        }

        bincode_insert_comment(caller, insn, "start of inline function", callee->func_sym->sym_name);

        ASSERT(insn->in_code == x86insn_push_all);
        bincode_erase_instruction(caller, insn);
        insn = next_insn;

        if (insn->in_code == x86insn_restore_stack) {
            next_insn = insn->in_next;
            bincode_erase_instruction(caller, insn);
            insn = next_insn;
        }

        ASSERT(insn->in_code == x86insn_pop_all);
        next_insn = next_insn->in_next;
        bincode_erase_instruction(caller, insn);
        insn = next_insn;


        // Вставляем код функции с коррекцией локальных переменных и параметров, и обработкой return.
        for (type = 0; type < X86_REGISTER_TYPES_COUNT; type++) {
            regs_ofs[type] = caller->func_pseudoregs_count[type];
            caller->func_pseudoregs_count[type] += callee->func_pseudoregs_count[type];
        }

        labels_ofs = caller->func_labels_count;
        caller->func_labels_count += callee->func_labels_count;

        _insert_function_code(insn, callee, caller, params_ofs, locals_ofs, regs_ofs, labels_ofs, res_ofs);
        bincode_insert_comment(caller, insn, "end of inline function", callee->func_sym->sym_name);


        if (res_ofs != 0) {
            // Патчим последующее чтение результата (максимум, одну инструкцию).
            for (; insn && insn->in_code != x86insn_call; insn = insn->in_next) {
                if (insn->in_code != x86insn_read_retval) continue;

                ASSERT(OP_IS_REGISTER(insn->in_op1));

                if (!OP_IS_FLOAT(insn->in_op1)) {
                    insn->in_code = x86insn_int_mov;
                    bincode_create_operand_addr_from_ebp_offset(&insn->in_op2, insn->in_op1.op_type, res_ofs);
                } else if (!option_use_sse2) {
                    insn->in_code = x86insn_fpu_ld;
                    bincode_create_operand_addr_from_ebp_offset(&insn->in_op1, insn->in_op1.op_type, res_ofs);
                } else {
                    insn->in_code = ENCODE_SSE_MOV(insn->in_op1.op_type);
                    bincode_create_operand_addr_from_ebp_offset(&insn->in_op2, insn->in_op1.op_type, res_ofs);
                }

                break;
            }
        }
    }

    if (was) {
        // Мы создали новые псевдо-регистры, поэтому мы должны перестроить регистровую статистику.
        x86_analyze_registers_usage(caller);
    }
}


//
// Пытается заинлайнить какие-нибудь вызовы функций в коде данной функции.
//
void x86_inlining_process_function(function_desc *function)
{
    function_desc *callee;

    for (callee = unit_get_functions_list(); callee; callee = callee->func_next) {
        if (callee->func_insn_count < option_max_inline_insn ||
            callee->func_is_static && callee->func_usage_count == 1) {
                _inline_function_if_used(callee, function);
        }
    }

    function->func_insn_count = unit_get_instruction_count(function);
}

