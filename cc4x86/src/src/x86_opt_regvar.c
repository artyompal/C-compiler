
#include "common.h"
#include "x86_bincode.h"
#include "x86_regalloc.h"
#include "x86_optimizer.h"


typedef struct x86_register_var_decl {
    symbol                      *sym;
    int                         pseudo_reg;
    BOOL                        is_parameter;
    struct x86_register_var_decl *next;
    struct x86_register_var_decl *prev;
} x86_register_var;

typedef struct x86_register_vars_list_decl {
    x86_register_var            *first;
    x86_register_var            *last;
} x86_register_vars_list;

static x86_register_vars_list   _register_vars_list;


typedef struct address_lookup_result_decl {
    symbol  *sym;
    BOOL    res;
} address_lookup_result;


//
// Упрощённая вставка элемента (без изменения next) для сортировки.
static void _insert_node(x86_register_vars_list *data, x86_register_var *k)
{
    k->prev     = data->last;

    if (!data->first) {
        data->first      = k;
    } else {
        data->last->next = k;
    }

    data->last   = k;
}

//
// Сортировка списка слиянием.
// Список разбивается на два равных подсписка, они рекурсивно сортируются и сливаются.
static void _merge_sort(x86_register_vars_list *data)
{
    int i, length;
    x86_register_var *n, *m;
    x86_register_vars_list left, right;


    // считаем число элементов.
    length = 1;

    for (n = data->first; n != data->last; n = n->next) {
        length++;
    }

    if (length < 2) {
        return;
    }


    // разбиваем на два подсписка: [0 .. length/2) и [length/2 .. length).
    for (i = 0, n = data->first; i < length / 2; i++, n = n->next) {
    }

    left.first  = data->first;
    left.last   = n->prev;
    right.first = n;
    right.last  = data->last;


    // рекурсивно сортируем подсписки
    _merge_sort(&left);
    _merge_sort(&right);


    // слияние
    data->first = data->last = NULL;
    n = left.first;
    m = right.first;

    for (;;) {
        if (n->sym->sym_usage_count >= m->sym->sym_usage_count) {
            // вставляем n в результат и продвигаем n
            _insert_node(data, n);
            n = n->next;
        } else {
            // вставляем m и продвигаем m
            _insert_node(data, m);
            m = m->next;
        }

        // если какой-то из списков кончился, вставляем остальные элементы второго списка
        if (n == left.last->next) {
            for (; m != right.last->next; m = m->next) {
                _insert_node(data, m);
            }

            break;
        } else if (m == right.last->next) {
            for (; n != left.last->next; n = n->next) {
                _insert_node(data, n);
            }

            break;
        }
    }

    data->last->next = NULL;
}


//
// Создаёт регистровую переменную и добавляет её в список.
static void _create_register_variable(symbol *sym)
{
    x86_register_var *res;

    res = allocator_alloc(allocator_per_function_pool, sizeof(x86_register_var));

    if (!_register_vars_list.first) {
        _register_vars_list.first = _register_vars_list.last = res;
    } else {
        _register_vars_list.last->next  = res;
        res->prev                       = _register_vars_list.last;
        _register_vars_list.last        = res;
    }

    res->sym            = sym;
    res->pseudo_reg     = 0;
    res->is_parameter   = (sym->sym_offset > 0); // у параметров положительное смещение относительно EBP
    res->next           = NULL;
}


//
// Коллбэк для следующей функции.
static void _search_for_addressing_or_int2float(expression *expr, void *result)
{
    address_lookup_result *res = result;

    if ((expr->data.arithm.opcode == op_get_address || expr->data.arithm.opcode == op_convert_int2float)
        && expr->data.arithm.operand1->expr_code == code_expr_symbol && expr->data.arithm.operand1->data.sym == res->sym) {
            res->res = TRUE;
        }
}

// Добавляет переменную в список, если нигде не берётся её адрес.
static void _try_create_register_variable(function_desc *function, symbol *sym, x86_operand_type type)
{
    address_lookup_result address_taken;

    address_taken.sym = sym, address_taken.res = FALSE;

    // Проверка счётчика ссылок.
    if (sym->sym_usage_count <= 1) {
        return;
    }

    if (type == x86op_dword && !TYPE_IS_X86_DWORD(sym->sym_type)) {
        return;
    }

    if (type == x86op_float && !TYPE_IS_FLOATING(sym->sym_type)) {
        return;
    }

    // Проверяем, что нигде не берётся адрес этой переменной.
    expr_iterate_through_subexpressions(function->func_body, code_expr_arithmetic, EXPR_IT_APPLY_FILTER,
        _search_for_addressing_or_int2float, &address_taken);
    if (address_taken.res) {
        return;
    }

    // Добавляем в список.
    _create_register_variable(sym);
}

//
// Коллбэк для следующей функции.
static void _usage_counter(expression *sym_expr, void *unused)
{
    sym_expr->data.sym->sym_usage_count++;
}

//
// Вычисляет для каждой переменной число её использований.
// TODO: нужно давать больший приоритет переменным, использующимся во внутренних циклах.
static void _analyze_variables_usage(function_desc *function)
{
    symbol *var;
    parameter *param;
    data_type *func_type = function->func_sym->sym_type;
    x86_instruction *insn;

    for (var = function->func_locals.list_first; var; var = var->sym_next) {
        var->sym_usage_count = 0;
    }

    for (param = func_type->data.function.parameters_list->param_first; param; param = param->param_next) {
        if (param->param_code == code_symbol_parameter) {
            param->param_sym->sym_usage_count = 0;
        }
    }

    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        for (var = function->func_locals.list_first; var; var = var->sym_next) {
            if (OP_IS_SPEC_EBP_OFFSET(insn->in_op1, var->sym_offset)) {
                var->sym_usage_count++;
            } else if (OP_IS_SPEC_EBP_OFFSET(insn->in_op2, var->sym_offset)) {
                var->sym_usage_count++;
            }
        }

        for (param = func_type->data.function.parameters_list->param_first; param; param = param->param_next) {
            if (param->param_code == code_symbol_parameter) {
                if (OP_IS_SPEC_EBP_OFFSET(insn->in_op1, param->param_sym->sym_offset)) {
                    param->param_sym->sym_usage_count++;
                } else if (OP_IS_SPEC_EBP_OFFSET(insn->in_op2, param->param_sym->sym_offset)) {
                    param->param_sym->sym_usage_count++;
                }
            }
        }
    }
}


//
// Выявляет все переменные, которые можно сделать регистровыми, и сортирует их по частоте использования.
static void _choose_possible_register_variables(function_desc *function, x86_operand_type type)
{
    symbol *var;
    parameter *param;
    data_type *func_type = function->func_sym->sym_type;


    _analyze_variables_usage(function);
    _register_vars_list.first = _register_vars_list.last = NULL;

    for (var = function->func_locals.list_first; var; var = var->sym_next) {
        _try_create_register_variable(function, var, type);
    }

    for (param = func_type->data.function.parameters_list->param_first; param; param = param->param_next) {
        if (param->param_code == code_symbol_parameter) {
            _try_create_register_variable(function, param->param_sym, type);
        }
    }

    _merge_sort(&_register_vars_list);
}

//
// Вычисляет максимальное число одновременно выделенных регистров в данной функции.
static int _estimate_num_of_used_pseudo_registers(function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int max_registers, current_regs_cnt, regs_cnt, i;
    int regs[MAX_REGISTERS_PER_INSN];
    x86_pseudoreg_info *reg_info = unit_get_regstat(function, type)->ptr;


    max_registers = current_regs_cnt = 0;

    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        bincode_extract_pseudoregs_from_insn_wo_dupes(insn, type, regs, &regs_cnt);

        for (i = 0; i < regs_cnt; i++) {
            ASSERT(reg_info[regs[i]].reg_first_write && reg_info[regs[i]].reg_last_read);

            if (insn == reg_info[regs[i]].reg_first_write) {
                current_regs_cnt++;
            }
        }

        if (max_registers < current_regs_cnt) {
            max_registers = current_regs_cnt;
        }

        for (i = 0; i < regs_cnt; i++) {
            if (insn == reg_info[regs[i]].reg_last_read) {
                current_regs_cnt--;
                ASSERT(current_regs_cnt >= 0);
            }
        }
    }

    return max_registers;
}

//
// Заменяет все вхождения регистровой переменной на регистр.
static void _replace_variable_with_register(function_desc *function, x86_register_var *reg_var, x86_operand_type type)
{
    x86_instruction *insn;
    int var_offset  = reg_var->sym->sym_offset;
    int var_reg     = reg_var->pseudo_reg;

    insn = function->func_binary_code;
    ASSERT(insn->in_code == x86insn_create_stack_frame);
    insn = insn->in_next;

    if (var_offset > 0) {
        bincode_insert_int_reg_ebp_offset(function, insn,
            (type == x86op_dword ? x86insn_int_mov : ENCODE_SSE_MOV(type)), type, var_reg, var_offset);
    }

    for (; insn; insn = insn->in_next) {
        if (OP_IS_SPEC_EBP_OFFSET(insn->in_op1, var_offset)) {
            bincode_create_operand_from_pseudoreg(&insn->in_op1, type, var_reg);
        } else if (OP_IS_SPEC_EBP_OFFSET(insn->in_op2, var_offset)) {
            bincode_create_operand_from_pseudoreg(&insn->in_op2, type, var_reg);
        }
    }

    // TODO: если переменная находится только в регистре, надо не выделять место в стеке для неё.
}

//
// Создаёт столько регистровых переменных заданного типа, сколько возможно,
// с приоритетом по частоте использования.
static void _create_register_variables_for_type(function_desc *function, x86_operand_type type)
{
    int free_registers, last_pseudo_register;
    x86_register_var *reg_var;
    register_stat *regstat = unit_get_regstat(function, type);

    // FIXME: код подсчёта числа свободных регистров является deprecated. Нужно пытаться поместить все переменные в регистры.
    free_registers = x86_get_max_register_count(type) - _estimate_num_of_used_pseudo_registers(function, type);
    if (free_registers <= 0) {
        // Нет свободных регистров.
        return;
    }

    _choose_possible_register_variables(function, type);
    if (!_register_vars_list.first) {
        // Нет потенциальных регистровых переменных.
        return;
    }

    last_pseudo_register                    = regstat->count+1;
    function->func_pseudoregs_count[type]++;
    function->func_start_of_regvars[type]   = last_pseudo_register;
    reg_var                                 = _register_vars_list.first;

    do {
        // Создаём регистровые переменные, начиная с более приоритетных.
        for (; reg_var && free_registers; reg_var = reg_var->next, free_registers--) {
            reg_var->pseudo_reg = last_pseudo_register++;
            function->func_pseudoregs_count[type]++;
            _replace_variable_with_register(function, reg_var, type);
        }

        // Мы создали новые псевдо-регистры, поэтому мы должны перестроить регистровую статистику.
        x86_analyze_registers_usage(function);

        // Выкидываем ненужные псевдорегистры.
        x86_optimization_after_regvar_allocation(function);


        // Если ещё остались переменные и освободились регистры, повторяем.
        if (!reg_var) {
            return;
        }

        free_registers = x86_get_max_register_count(type) - _estimate_num_of_used_pseudo_registers(function, type);
    } while (free_registers > 0);
}


//
// Глобальная точка входа в аллокатор регистровых переменных.
void x86_create_register_variables(function_desc *function)
{
    _create_register_variables_for_type(function, x86op_dword);

    if (option_sse2) {
        _create_register_variables_for_type(function, x86op_float);
    }
}

