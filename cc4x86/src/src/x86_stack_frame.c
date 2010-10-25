
#include "common.h"
#include "x86_bincode.h"
#include "x86_stack_frame.h"


static int _local_vars_size;


//
//  Схема выделения памяти в стеке.
//
//  Допустим, у нас есть два формальных параметра "int x, y", локальные переменные "float a, b"
//  и временные переменные кодогенератора
//
//  offset  content
//  +12     y
//  +8      x
//  +4      return address
//  0       saved EBP
//  -4      b
//  -8      a
//  -12     tmp. float
//


static void _calculate_stack_offsets_for_locals(function_desc *function)
{
    symbol *var;

    for (var = function->func_locals.list_first; var; var = var->sym_next) {
        _local_vars_size    += type_calculate_sizeof(var->sym_type);
        var->sym_offset     = -_local_vars_size;
    }
}

static void _calculate_stack_offsets_for_params(function_desc *function)
{
    data_type *func_type    = function->func_sym->sym_type;
    int stack_base          = 8;    // 4 байта для сохранённого EBP и 4 байта для адреса возврата
    int parameters_total_sz = 0;
    parameter *param;

    for (param = func_type->data.function.parameters_list->param_first; param; param = param->param_next) {
        int sz = type_calculate_sizeof(param->param_type);

        if (param->param_code == code_symbol_parameter) {
            param->param_sym->sym_offset = stack_base + parameters_total_sz;
        }

        parameters_total_sz += sz;
    }

    function->func_parameters_sz = parameters_total_sz;
}


//
// Внешний интерфейс.
//

void x86_stack_frame_begin_function(function_desc *function)
{
    _local_vars_size = 0;

    _calculate_stack_offsets_for_locals(function);
    _calculate_stack_offsets_for_params(function);
}

void x86_stack_frame_end_function(function_desc *function)
{
    x86_instruction *instr;

    // если были локальные переменные, корректируем код пролога и эпилога
    if (_local_vars_size) {
        instr = function->func_binary_code;

        ASSERT(instr->in_code == x86instr_create_stack_frame && instr->in_op1.op_loc == x86loc_int_constant);
        instr->in_op1.data.int_val = _local_vars_size;

        for (instr = function->func_binary_code; instr; instr = instr->in_next) {
            if (instr->in_code == x86instr_destroy_stack_frame) {
                instr->in_op1.data.int_val = _local_vars_size;
            }
        }
    }

    function->func_local_vars_sz = _local_vars_size;
}

int x86_stack_frame_alloc_tmp_var(int size)
{
    _local_vars_size += size;
    return -_local_vars_size;
}

