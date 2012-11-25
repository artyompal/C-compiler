
#include "common.h"
#include "x86_bincode.h"
#include "x86_regalloc.h"
#include "x86_optimizer.h"


typedef struct x86_register_var_decl {
    symbol                      *sym;
    int                         pseudo_reg;
    x86_operand_type            type;
    struct x86_register_var_decl *next;
    struct x86_register_var_decl *prev;
} x86_register_var;

typedef struct x86_register_vars_list_decl {
    x86_register_var            *first;
    x86_register_var            *last;
} x86_register_vars_list;

typedef struct address_lookup_result_decl {
    symbol  *sym;
    BOOL    res;
} address_lookup_result;


static x86_register_vars_list   _register_vars_list;


//
// Создаёт регистровую переменную и добавляет её в список.
static void _create_register_variable(symbol *sym, x86_operand_type type)
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
    res->type           = type;
    res->next           = NULL;
}

//
// Коллбэк для следующей функции.
static void _search_for_addressing_or_int2float(expression *expr, void *result)
{
    address_lookup_result *res = result;

    if (expr->data.arithm.opcode == op_get_address
        && expr->data.arithm.operand1->expr_code == code_expr_symbol && expr->data.arithm.operand1->data.sym == res->sym) {
            res->res = TRUE;
        }
}

// Добавляет переменную в список, если нигде не берётся её адрес.
static void _try_create_register_variable(function_desc *function, symbol *sym, x86_operand_type type)
{
    address_lookup_result address_taken;
    address_taken.sym = sym, address_taken.res = FALSE;

    // проверяем размер переменной
    if (type == x86op_dword && !TYPE_IS_X86_DWORD(sym->sym_type) || type == x86op_float && !TYPE_IS_FLOATING(sym->sym_type)) {
        return;
    }

    // проверяем, что нигде не берётся адрес этой переменной
    expr_iterate_through_subexpressions(function->func_body, code_expr_arithmetic, EXPR_IT_APPLY_FILTER,
        _search_for_addressing_or_int2float, &address_taken);
    if (address_taken.res) {
        return;
    }

    // добавляем в список.
    _create_register_variable(sym, type);
}

//
// Выявляет все переменные, которые можно сделать регистровыми.
static void _choose_possible_register_variables(function_desc *function, x86_operand_type type)
{
    symbol *var;
    parameter *param;
    data_type *func_type = function->func_sym->sym_type;

    for (var = function->func_locals.list_first; var; var = var->sym_next) {
        _try_create_register_variable(function, var, type);
    }

    for (param = func_type->data.function.parameters_list->param_first; param; param = param->param_next) {
        if (param->param_code == code_symbol_parameter) {
            _try_create_register_variable(function, param->param_sym, type);
        }
    }
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
        bincode_insert_insn_reg_ebp_offset(function, insn,
            (type == x86op_dword ? x86insn_int_mov : ENCODE_SSE_MOV(type)), type, var_reg, var_offset);
    }

    for (; insn; insn = insn->in_next) {
        if (OP_IS_SPEC_EBP_OFFSET(insn->in_op1, var_offset)) {
            bincode_create_operand_from_pseudoreg(&insn->in_op1, bincode_encode_type(reg_var->sym->sym_type), var_reg);
        } else if (OP_IS_SPEC_EBP_OFFSET(insn->in_op2, var_offset)) {
            bincode_create_operand_from_pseudoreg(&insn->in_op2, bincode_encode_type(reg_var->sym->sym_type), var_reg);
        }
    }
}

//
// Сохраняет ссылку на аллоцированное место в стеке для регистровой переменной.
static void _link_stack_var_to_register_var(function_desc *function, x86_pseudoreg_info *info, x86_register_var *reg_var, x86_operand_type type)
{
    int var_offset  = reg_var->sym->sym_offset;
    int var_reg     = reg_var->pseudo_reg;

    ASSERT(var_reg < function->func_pseudoregs_count[type]);
    info[var_reg].reg_stack_location = var_offset;
}

//
// Создаёт все возможные регистровые переменные.
static void _create_register_variables_for_type(function_desc *function, x86_operand_type type)
{
    int last_pseudo_register;
    x86_register_var *reg_var;

    // составляем список переменых
    _choose_possible_register_variables(function, type);

    // регистры нумеруются с единицы
    function->func_pseudoregs_count[type]++;

    last_pseudo_register                    = function->func_pseudoregs_count[type];
    function->func_start_of_regvars[type]   = last_pseudo_register;


    // создаём все возможные регистровые переменные
    for (reg_var = _register_vars_list.first; reg_var; reg_var = reg_var->next) {
        if (reg_var->type == type) {
            reg_var->pseudo_reg = last_pseudo_register++;
            function->func_pseudoregs_count[type]++;
            _replace_variable_with_register(function, reg_var, type);
        }
    }
}


//
// Инициализация списка регистровых переменных.
void x86_regvars_init()
{
    _register_vars_list.first = _register_vars_list.last = NULL;
}

//
// Глобальная точка входа в аллокатор регистровых переменных.
void x86_regvars_create(function_desc *function)
{
    _create_register_variables_for_type(function, x86op_dword);
    _create_register_variables_for_type(function, x86op_float);

    // делаем оптимизации, ставшие теперь возможными
    x86_local_optimization_pass(function);
}

//
// Заполняет поле reg_stack_location смещением стековой переменой для всех регистровых переменных.
void x86_regvars_setup_offset(function_desc *function, x86_pseudoreg_info *info, x86_operand_type type)
{
    x86_register_var *reg_var;

    // сохраняем стековые смещения для каждой переменной, чтобы не аллоцировать лишнее место в стеке
    for (reg_var = _register_vars_list.first; reg_var; reg_var = reg_var->next) {
        if (reg_var->type == type) {
            _link_stack_var_to_register_var(function, info, reg_var, type);
        }
    }
}

