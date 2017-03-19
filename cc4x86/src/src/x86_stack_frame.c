
#include "common.h"
#include "x86_bincode.h"
#include "x86_stack_frame.h"


//
//  Схема выделения памяти в стеке.
//
//  Допустим, у нас есть два формальных параметра "int x, y", локальные переменные "float a, b"
//  и временные переменные кодогенератора, тогда схема будет следующей:
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
        function->func_local_vars_sz    += type_calculate_sizeof(var->sym_type);
        var->sym_offset                 = -function->func_local_vars_sz;
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
    function->func_local_vars_sz = 0;

    _calculate_stack_offsets_for_locals(function);
    _calculate_stack_offsets_for_params(function);
}

int x86_stack_frame_alloc_tmp_var(function_desc *function, int size)
{
    function->func_local_vars_sz += size;
    return -function->func_local_vars_sz;
}
