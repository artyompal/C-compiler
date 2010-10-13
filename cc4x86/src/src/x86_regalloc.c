
#include "common.h"
#include "x86_bincode.h"
#include "x86_regalloc.h"


static int _real_registers_cnt;
static int _real_registers_map[x86reg_count];   // positive - pseudo-register, -1 - free, otherwise - invalid


static void clear_register_map(void)
{
    int i;

    _real_registers_cnt = 0;

    for (i = 0; i < x86reg_count; i++) {
        _real_registers_map[i] = -1;
    }
}

static BOOL _is_real_register_free(int real_reg)
{
    ASSERT(real_reg >= 0 && real_reg < x86reg_count);
    return (_real_registers_map[real_reg] == -1);
}

static void _reserve_real_register(int real_reg, int pseudoreg)
{
    ASSERT(real_reg >= 0 && real_reg < x86reg_count && _real_registers_map[real_reg] == -1);
    _real_registers_map[real_reg] = pseudoreg;
    _real_registers_cnt++;
}

static int _alloc_real_register(int pseudoreg)
{
    int reg;

    ASSERT(_real_registers_cnt < X86_TMP_REGISTERS_COUNT);
    _real_registers_cnt++;

    for (reg = 0; ; reg++) {
        if (reg == x86reg_esp) {
            reg++;      // skip ESP and EBP
            continue;
        }

        UNIMPLEMENTED_ASSERT(reg < x86reg_count);

        if (_is_real_register_free(reg)) {
            break;
        }
    }

    _real_registers_map[reg] = pseudoreg;
    return reg;
}

static int _alloc_real_register_for_regvar(int pseudoreg)
{
    int reg;

    ASSERT(_real_registers_cnt < X86_TMP_REGISTERS_COUNT);
    _real_registers_cnt++;

    for (reg = x86reg_count - 1; ; reg--) {
        if (reg == x86reg_ebp) {
            reg--;      // skip ESP and EBP
            continue;
        }

        UNIMPLEMENTED_ASSERT(reg >= 0);

        if (_is_real_register_free(reg)) {
            break;
        }
    }

    _real_registers_map[reg] = pseudoreg;
    return reg;
}

static int _alloc_real_register_except_eax(int pseudoreg)
{
    int reg;

    ASSERT(_real_registers_cnt < X86_TMP_REGISTERS_COUNT);
    _real_registers_cnt++;

    // skip also EAX
    for (reg = 1; ; reg++) {
        if (reg == x86reg_esp) {
            reg++;      // skip ESP and EBP
            continue;
        }

        UNIMPLEMENTED_ASSERT(reg < x86reg_count);

        if (_is_real_register_free(reg)) {
            break;
        }
    }

    _real_registers_map[reg] = pseudoreg;
    return reg;
}

static void _free_real_register(int real_reg)
{
    ASSERT(_real_registers_cnt > 0);
    _real_registers_map[real_reg] = -1;
    _real_registers_cnt--;
}


void x86_analyze_registers_usage(function_desc *function)
{
    x86_pseudoreg_info *pseudoregs_map;
    x86_instruction *instr, *last;
    int pseudoregs_cnt, registers[MAX_REGISTERS_PER_INSTR], registers_count, i, reg;


    // Считаем число использованных псевдорегистров.
    pseudoregs_cnt      = 0;

    for (instr = function->func_binary_code; instr; instr = instr->in_next) {
        if (instr->in_op1.op_type == x86op_int_register && instr->in_op1.data.reg >= pseudoregs_cnt) {
            // Новые псевдорегистры могут появляться только как первый операнд инструкции.
            ASSERT(instr->in_code == x86instr_int_mov || instr->in_code == x86instr_lea
                || instr->in_code == x86instr_imul_const || instr->in_code == x86instr_movzx_al);
            pseudoregs_cnt = instr->in_op1.data.reg + 1;
        }
    }


    // Выделяем память под статистику.
    if (function->func_pseudoregs_map) {
        allocator_free(allocator_persistent_pool, function->func_pseudoregs_map,
            sizeof(x86_pseudoreg_info) * function->func_pseudoregs_cnt);
    }

    pseudoregs_map = allocator_alloc(allocator_persistent_pool, sizeof(x86_pseudoreg_info) * pseudoregs_cnt);
    memset(pseudoregs_map, 0, sizeof(x86_pseudoreg_info) * pseudoregs_cnt);

    function->func_pseudoregs_map  = pseudoregs_map;
    function->func_pseudoregs_cnt  = pseudoregs_cnt;


    // Находим последнюю инструкцию
    for (last = function->func_binary_code; last->in_next; last = last->in_next) {
    }


    // Составляем статистику использования псевдорегистров.
    for (instr = function->func_binary_code; instr; instr = instr->in_next) {
        bincode_extract_pseudoregs_read_by_instr(instr, registers, &registers_count);

        for (i = 0; i < registers_count; i++) {
            reg = registers[i];
            ASSERT(reg < pseudoregs_cnt);

            if (REG_IS_REGVAR(reg)) {
                // FIXME: считается, что регистровые переменные используются до конца функции.
                // Это нужно потому, что переход может вернуть нас в область её использования.
                pseudoregs_map[reg].reg_last_read = last;
            } else {
                pseudoregs_map[reg].reg_last_read = instr;
            }
        }

        bincode_extract_pseudoregs_written_by_instr(instr, registers, &registers_count);

        for (i = 0; i < registers_count; i++) {
            reg = registers[i];
            ASSERT(reg < pseudoregs_cnt);

            if (!pseudoregs_map[reg].reg_first_write) {
                pseudoregs_map[reg].reg_first_write     = instr;
            } else {
                pseudoregs_map[reg].reg_changes_value   = TRUE;
            }

            if (REG_IS_REGVAR(reg)) {
                pseudoregs_map[reg].reg_last_read = last;
            } else {
                pseudoregs_map[reg].reg_last_read = instr;
            }
        }
    }
}


// FPU stack maintaining.

static BOOL _type_is_func_returning_float(data_type *type)
{
    ASSERT(type->type_code == code_type_function);
    return (type->data.function.result_type->type_code == code_type_float);
}

static void _maintain_fpu_stack(function_desc *function)
{
    x86_instruction *instr, *next_instr;
    int fp_registers_cnt = 0, i, last_pusha_count = 0, num;

    for (instr = function->func_binary_code; instr; instr = instr->in_next) {
        // Порядок сохранения floating-point регистров: по младшим адресам идут младшие регистры.

        if (instr->in_code == x86instr_push_all && fp_registers_cnt) {
            // вставляем инструкции перед PUSHA
            for (i = fp_registers_cnt; i > 0; i--) {
                bincode_insert_fp_esp_offset(function, instr, x86instr_float_stp, -4 * i);
            }

            last_pusha_count = fp_registers_cnt;
            bincode_insert_int_reg_const(function, instr, x86instr_int_sub, ~x86reg_esp, last_pusha_count * 4);
        } else if (instr->in_code == x86instr_pop_all && last_pusha_count) {
            // вставляем инструкции после POPA
            next_instr = instr->in_next;
            ASSERT(last_pusha_count != 0);

            // Если функция возвращает float, мы кладём его в стек по адресу [esp-4],
            // а потом восстанавливаем все FP-регистры из стека. Это обеспечивает правильный порядок FP-стека.
            if (last_pusha_count != fp_registers_cnt) {
                ASSERT(last_pusha_count + 1 == fp_registers_cnt);
                num = last_pusha_count + 1;
                bincode_insert_fp_esp_offset(function, next_instr, x86instr_float_stp, -4);
            } else {
                num = last_pusha_count;
            }

            for (i = last_pusha_count - 1; i >= last_pusha_count - num; i--) {
                bincode_insert_fp_esp_offset(function, next_instr, x86instr_float_ld, 4 * i);
            }

            bincode_insert_int_reg_const(function, next_instr, x86instr_int_add, ~x86reg_esp, last_pusha_count * 4);
            last_pusha_count = 0;
            instr = next_instr->in_prev;
        } else {
            // вычисляем вершину FP-стека после текущей инструкции
            if (instr->in_code == x86instr_float_ld || instr->in_code == x86instr_float_ld_int
                || IS_FLOAT_UNARY_ARITHM_INSTR(instr->in_code)) {
                    fp_registers_cnt++;
            } else if (instr->in_code == x86instr_float_stp || IS_FLOAT_STP_INSTR(instr->in_code)
                || IS_FLOAT_BINARY_ARITHM_INSTR(instr->in_code) && instr->in_op1.op_type == x86op_float_register) {
                    fp_registers_cnt--;
            } else if (instr->in_code == x86instr_float_cmp) {
                fp_registers_cnt -= 2;
            } else if (instr->in_code == x86instr_call_float) {
                fp_registers_cnt++;
            }
        }

        UNIMPLEMENTED_ASSERT(fp_registers_cnt < 8);
    }

    ASSERT(last_pusha_count == 0);

    if (_type_is_func_returning_float(function->func_sym->sym_type)) {
        ASSERT(fp_registers_cnt == 1);
    } else {
        ASSERT(fp_registers_cnt == 0);
    }
}


void x86_allocate_registers(function_desc *function)
{
    x86_pseudoreg_info  *pseudoregs_map = function->func_pseudoregs_map;
    x86_instruction     *instr, *next_instr;
    int                 *registers[MAX_REGISTERS_PER_INSTR];
    int                 pseudoregs[MAX_REGISTERS_PER_INSTR], real_regs[MAX_REGISTERS_PER_INSTR];
    int                 registers_count, i, reg, reg2, real_reg, real_reg2;
    int                 saved_real_registers_map[x86reg_count];

    BOOL                real_regs_usage[x86reg_count] = {0, 0, 0, 0, 0, 0, 0, 0, };
    AUX_CASSERT(sizeof(real_regs_usage) / sizeof(real_regs_usage[0]) == x86reg_count);


    LOG(("x86_allocate_registers(function=%s)\n", function->func_sym->sym_name));

    // Обрабатываем x86instr_push_all/x86instr_pop_all для регистров FPU и валидируем FPU-стек.
    _maintain_fpu_stack(function);


    //
    // Проходим по инструкциям функции и заменяем регистры. Если псевдорегистр уже выделен, то заменяем его
    // на регистр. Если он сохранён в переменную, его нужно восстановить. Иначе нужно выделить новый регистр.
    // Потом нужно заменить все ссылки на этот псевдорегистр из этой инструкции на выделенный регистр.
    // При этом, если нужно сохранить/восстановить регистр, то нужно вставить инструкцию MOV.
    //
    // Аллокатор регистров не должен выделять реальные регистры для неиспользуемых псевдорегистров,
    // которые были удалены оптимизатором после вызова x86_analyze_registers_usage() и перед входом в данную функцию.
    //

    clear_register_map();

    for (instr = function->func_binary_code; instr; instr = next_instr) {
        next_instr = instr->in_next;

        if (instr->in_code == x86instr_label || IS_JMP_INSTR(instr->in_code)) {
            continue;
        }


        // Обрабатываем специальные случаи.

        // MOV EAX/EDX,reg.
        // Если мы ещё не в этом регистре, делаем присваивание если он свободен, или XCHG если он занят.
        if (instr->in_code == x86instr_int_mov && OP_IS_REAL_REG(instr->in_op1) && OP_IS_PSEUDO_REG(instr->in_op2)) {
            real_reg    = ~instr->in_op1.data.reg;
            reg         = instr->in_op2.data.reg;

            ASSERT(pseudoregs_map[reg].reg_last_read == instr || REG_IS_REGVAR(reg));

            if (pseudoregs_map[reg].reg_location == real_reg) {
                bincode_erase_instruction(function, instr);
                _free_real_register(real_reg);
            } else if (_is_real_register_free(real_reg)) {
                instr->in_op2.data.reg              = ~pseudoregs_map[reg].reg_location;

                if (pseudoregs_map[reg].reg_last_read == instr)
                    _free_real_register(pseudoregs_map[reg].reg_location);
            } else {
                reg2                                = _real_registers_map[real_reg];
                real_reg2                           = pseudoregs_map[reg].reg_location;
                UNIMPLEMENTED_ASSERT(!REG_IS_REGVAR(reg2));

                instr->in_code                      = x86instr_int_xchg;
                instr->in_op2.data.reg              = ~real_reg2;

                pseudoregs_map[reg2].reg_location   = real_reg2;
                pseudoregs_map[reg].reg_location    = real_reg;

                _free_real_register(real_reg);
                _free_real_register(real_reg2);
                _reserve_real_register(real_reg2, reg2);
            }

            pseudoregs_map[reg].reg_status      = register_unallocated;
            continue;
        }

        // MOV reg,EAX/EDX.
        // Если reg не регистровая переменная, выделяем этот реальный регистр для reg, удаляем присваивание.
        if (instr->in_code == x86instr_int_mov && OP_IS_PSEUDO_REG(instr->in_op1) && OP_IS_REAL_REG(instr->in_op2)) {
            reg         = instr->in_op1.data.reg;
            real_reg    = ~instr->in_op2.data.reg;

            if (!REG_IS_REGVAR(reg)) {
                ASSERT(pseudoregs_map[reg].reg_first_write == instr);

                _reserve_real_register(real_reg, reg);
                pseudoregs_map[reg].reg_status      = register_allocated;
                pseudoregs_map[reg].reg_location    = real_reg;

                bincode_erase_instruction(function, instr);
                continue;
            }
        }

        // CDQ.
        // Мы должны освободить EDX.
        if (instr->in_code == x86instr_cdq) {
            if (!_is_real_register_free(x86reg_edx)) {
                reg         = _real_registers_map[x86reg_edx];
                real_reg    = _alloc_real_register_except_eax(reg);
                ASSERT(!REG_IS_REGVAR(reg));

                ASSERT(pseudoregs_map[reg].reg_status == register_allocated);
                _free_real_register(pseudoregs_map[reg].reg_location);
                pseudoregs_map[reg].reg_location    = real_reg;

                bincode_insert_int_reg_reg(function, instr, x86instr_int_mov, ~real_reg, ~x86reg_edx);
            }

            continue;
        }

        // SETcc.
        // Мы должны освободить EAX.
        if (IS_SET_INSTR(instr->in_code)) {
            if (!_is_real_register_free(x86reg_eax)) {
                reg         = _real_registers_map[x86reg_eax];
                real_reg    = _alloc_real_register_except_eax(reg);
                ASSERT(!REG_IS_REGVAR(reg));

                ASSERT(pseudoregs_map[reg].reg_status == register_allocated);
                _free_real_register(pseudoregs_map[reg].reg_location);
                pseudoregs_map[reg].reg_location    = real_reg;

                bincode_insert_int_reg_reg(function, instr, x86instr_int_mov, ~real_reg, ~x86reg_eax);
            }

            continue;
        }

        // CALL с целочисленным результатом.
        // Мы должны освободить EAX.
        if (instr->in_code == x86instr_call_int) {
            if (!_is_real_register_free(x86reg_eax)) {
                reg         = _real_registers_map[x86reg_eax];
                ASSERT(!REG_IS_REGVAR(reg));

                if (pseudoregs_map[reg].reg_last_read != instr) {
                    real_reg    = _alloc_real_register_except_eax(reg);

                    ASSERT(pseudoregs_map[reg].reg_status == register_allocated);
                    _free_real_register(pseudoregs_map[reg].reg_location);
                    pseudoregs_map[reg].reg_location    = real_reg;

                    // Мы не генерируем MOV, потому что CALL находится внутри пары x86instr_push_all/x86instr_pop_all
                    // и значения регистров уже сохранены в стеке.
                }
            }
        }


        // Извлекаем набор псевдорегистров, который используется инструкцией.
        bincode_extract_pseudoregs_from_instr(instr, registers, &registers_count);

        // Сохраняем номера псевдорегистров, так как они будут переписаны значениями реальных регистров.
        for (i = 0; i < registers_count; i++) {
            pseudoregs[i] = *registers[i];
        }

        // Заменяем все псевдорегистры на истинные регистры.
        for (i = 0; i < registers_count; i++) {
            reg = pseudoregs[i];

            if (pseudoregs_map[reg].reg_status == register_allocated) {
                // под этот псевдорегистр уже выделен истинный регистр, пробиваем его в инструкцию
                real_reg        = pseudoregs_map[reg].reg_location;
                *registers[i]   = ~real_reg;
            } else {
                // нужен новый регистр, и возможно, нужно его загрузить из памяти.
                ASSERT(pseudoregs_map[reg].reg_status == register_unallocated);
                UNIMPLEMENTED_ASSERT(_real_registers_cnt < X86_TMP_REGISTERS_COUNT);

                if (REG_IS_REGVAR(reg)) {
                    real_reg                        = _alloc_real_register_for_regvar(reg);
                } else {
                    real_reg                        = _alloc_real_register(reg);
                }

                pseudoregs_map[reg].reg_status      = register_allocated;
                pseudoregs_map[reg].reg_location    = real_reg;
                *registers[i]                       = ~real_reg;
            }
        }

        // Освобождаем реальные регистры от псевдорегистров, которые больше не нужны.
        for (i = 0; i < registers_count; i++) {
            reg = pseudoregs[i];

            if (REG_IS_REGVAR(reg)) {
                continue;
            }

            if (pseudoregs_map[reg].reg_last_read == instr && pseudoregs_map[reg].reg_status == register_allocated) {
                pseudoregs_map[reg].reg_status = register_unallocated;
                _free_real_register(pseudoregs_map[reg].reg_location);
            }
        }

        // Эмулируем псевдоинструкции, для этого вставляем реальные инструкции перед ними.
        if (instr->in_code == x86instr_push_all) {
            for (i = 0; i <= x86reg_edx; i++) {
                if (_real_registers_map[i] != -1) {
                    bincode_insert_push_reg(function, instr, ~i);
                }
            }

            memcpy(saved_real_registers_map, _real_registers_map, sizeof(saved_real_registers_map));
        } else if (instr->in_code == x86instr_pop_all) {
            for (i = x86reg_edx; i >= 0; i--) {
                if (saved_real_registers_map[i] != -1) {
                    bincode_insert_pop_reg(function, instr, ~i);
                }
            }
        }
    }


    // Собираем статистику использования реальных регистров.
    for (instr = function->func_binary_code; instr; instr = instr->in_next) {
        bincode_extract_real_registers_from_instr(instr, real_regs, &registers_count);

        for (i = 0; i < registers_count; i++) {
            real_regs_usage[real_regs[i]] = TRUE;
        }
    }

    // Генерируем код пролога и эпилога.
    for (instr = function->func_binary_code; instr; instr = next_instr) {
        next_instr = instr->in_next;

        if (instr->in_code == x86instr_create_stack_frame) {
            bincode_insert_push_reg(function, instr, ~x86reg_ebp);
            bincode_insert_int_reg_reg(function, instr, x86instr_int_mov, ~x86reg_ebp, ~x86reg_esp);

            if (instr->in_op1.data.int_val) {
                bincode_insert_int_reg_const(function, instr, x86instr_int_sub, ~x86reg_esp, instr->in_op1.data.int_val);
            }

            if (real_regs_usage[x86reg_edi]) {
                bincode_insert_push_reg(function, instr, ~x86reg_edi);
            }

            if (real_regs_usage[x86reg_esi]) {
                bincode_insert_push_reg(function, instr, ~x86reg_esi);
            }

            if (real_regs_usage[x86reg_ebx]) {
                bincode_insert_push_reg(function, instr, ~x86reg_ebx);
            }
        } else if (instr->in_code == x86instr_destroy_stack_frame) {
            if (real_regs_usage[x86reg_ebx]) {
                bincode_insert_pop_reg(function, instr, ~x86reg_ebx);
            }

            if (real_regs_usage[x86reg_esi]) {
                bincode_insert_pop_reg(function, instr, ~x86reg_esi);
            }

            if (real_regs_usage[x86reg_edi]) {
                bincode_insert_pop_reg(function, instr, ~x86reg_edi);
            }

            if (instr->in_op1.data.int_val) {
                bincode_insert_int_reg_const(function, instr, x86instr_int_add, ~x86reg_esp, instr->in_op1.data.int_val);
            }

            bincode_insert_pop_reg(function, instr, ~x86reg_ebp);
        }
    }

    // Удаляем ненужные более псевдоинструкции.
    for (instr = function->func_binary_code; instr; instr = next_instr) {
        next_instr = instr->in_next;

        if (instr->in_code == x86instr_push_all || instr->in_code == x86instr_pop_all
            || instr->in_code == x86instr_create_stack_frame || instr->in_code == x86instr_destroy_stack_frame) {
                bincode_erase_instruction(function, instr);
            }
    }

    // В регистрах могут остаться только глобальные регистровые переменные.
    for (i = 0; i < x86reg_count; i++) {
        reg = _real_registers_map[i];
        ASSERT(reg == -1 || REG_IS_REGVAR(reg));
    }
}

