
#include "common.h"
#include "x86_bincode.h"
#include "x86_regalloc.h"
#include "x86_stack_frame.h"
#include "x86_opt_data_flow.h"


typedef struct register_map_decl {
    int real_registers_cnt;
    int real_registers_map[X86_MAX_REG];    // положительное число: псевдо-регистр,
                                            // -1:                  свободный регистр,
                                            // остальное:           ошибка
} register_map;

static register_map _dword_register_map;
static register_map _sse_register_map;


#define X86_DWORD_REGISTERS_COUNT   (6)
#define X86_SSE_REGISTERS_COUNT     (8)


//
// Конфликты регистров.
//
// Вытеснение регистров в стек:
// 1. на момент выхода из базового блока нужно восстановить все сохранённые регистры,
//    которые были выделены на момент входа в базовый блок, и которые являются живыми
//    на момент выхода из блока.
//
// Если в одной инструкции появляются конфликтующие регистры:
// 1. регистр результата имеет максимальный приоритет; он должен быть всегда выделен.
// 2. Зарезервированные регистры являются неприкосновенными.
// 3. read-only регистры из остальных операндов можно скопировать в другие регистры.
// 4. если регистр является read-only операндом, его можно заменить сохранённым значением из памяти
// 5. если инструкция коммутативная, а оба операнда являются регистрами, то в случае их конфликта
//    можно любой из них оставить в памяти.
//


//
// Вспомогательные функции аллокатора регистров.

int x86_get_max_register_count(x86_operand_type type)
{
    if (type == x86op_dword) {
        return X86_DWORD_REGISTERS_COUNT;
    } else if (type == x86op_float) {
        return X86_SSE_REGISTERS_COUNT;
    } else {
        ASSERT(FALSE);
    }
}

int _get_max_register_count(register_map *regmap)
{
    if (regmap == &_dword_register_map) {
        return X86_DWORD_REGISTERS_COUNT;
    } else if (regmap == &_sse_register_map) {
        return X86_SSE_REGISTERS_COUNT;
    } else {
        ASSERT(FALSE);
    }
}

x86_operand_type x86_encode_register_type(x86_operand_type type)
{
    switch (type) {
    case x86op_byte:
        return x86op_byte;
    case x86op_word:
        return x86op_word;
    case x86op_dword:
        return x86op_dword;

    case x86op_float:
    case x86op_double:
        return x86op_float;

    default:
        ASSERT(FALSE);
    }
}

BOOL x86_equal_types(x86_operand_type type1, x86_operand_type type2)
{
    return (type1 == type2 || type1 == x86op_float && type2 == x86op_double || type1 == x86op_double && type2 == x86op_float);
}

static BOOL _is_double_register(int pseudoreg, x86_pseudoreg_info *pseudoregs_map)
{
    x86_instruction *insn = pseudoregs_map[pseudoreg].reg_first_write;
    ASSERT(insn->in_op1.op_type == x86op_float || insn->in_op1.op_type == x86op_double);
    return (insn->in_op1.op_type == x86op_double);
}


//
// Хелперы, выполняющие фактическую аллокацию реальных регистров.

static void _clear_register_map(register_map *regmap)
{
    int i;

    regmap->real_registers_cnt = 0;

    for (i = 0; i < X86_MAX_REG; i++) {
        regmap->real_registers_map[i] = -1;
    }
}

static int _find_register_to_swap(function_desc *function, x86_instruction *insn, register_map *regmap)
{
    int i, j, regs[MAX_REGISTERS_PER_INSN], regs_cnt;
    x86_operand_type type       = (regmap == &_dword_register_map ? x86op_dword : x86op_float);
    int busy_regs[X86_MAX_REG]  = {0};
    int free_registers_count    = x86_get_max_register_count(type);
    int last_free_register      = 0;

    // Двигаемся вниз по коду функции и вычисляем регистр, который наиболее долго не потребуется.

    for (; insn && free_registers_count > 1; insn = insn->in_next) {
        bincode_extract_pseudoregs_from_insn_wo_dupes(insn, type, regs, &regs_cnt);

        for (i = 0; i < X86_MAX_REG; i++) {
            if (i == x86reg_ebp || i == x86reg_esp) continue;

            for (j = 0; j < regs_cnt; j++) {
                if (regs[j] == regmap->real_registers_map[i]) {
                    free_registers_count += (busy_regs[i] - 1);
                    busy_regs[i] = TRUE;
                }
            }
        }

        for (i = 0; ; i++) {
            if (type == x86op_dword && (i == x86reg_esp || i == x86reg_ebp)) {
                continue;
            } else if (!busy_regs[i]) {
                break;
            }
        }

        ASSERT(i < X86_MAX_REG);
        last_free_register = i;
    }

    return last_free_register;
}

static void _swap_register(function_desc *function, x86_instruction *insn, register_map *regmap,
    x86_pseudoreg_info *pseudoregs_map, int reg, int real_reg, x86_operand_type type)
{
    int conflict_reg = regmap->real_registers_map[real_reg];

    ASSERT(real_reg < X86_MAX_REG);
    if (regmap == &_dword_register_map) ASSERT(real_reg != x86reg_esp && real_reg != x86reg_ebp);

    if (conflict_reg > 0) {
        if (x86_dataflow_is_pseudoreg_alive_before(function, conflict_reg)) {
            int ofs = pseudoregs_map[conflict_reg].reg_stack_location;
            int dbl = (regmap == &_dword_register_map ? FALSE : _is_double_register(conflict_reg, pseudoregs_map));

            if (ofs == -1) {
                ofs = x86_stack_frame_alloc_tmp_var(function, (dbl ? 8 : 4));
                pseudoregs_map[conflict_reg].reg_stack_location = ofs;
            }

            if (regmap == &_dword_register_map) {
                bincode_insert_insn_ebp_offset_reg(function, insn, x86insn_int_mov, x86op_dword, ofs, ~real_reg);
            } else if (!dbl) {
                bincode_insert_insn_ebp_offset_reg(function, insn, x86insn_sse_movss, x86op_float, ofs, ~real_reg);
            } else {
                bincode_insert_insn_ebp_offset_reg(function, insn, x86insn_sse_movsd, x86op_double, ofs, ~real_reg);
            }
        }

        if (IS_DEFINING_INSN(insn->in_code, type) && !OP_IS_THIS_PSEUDO_REG(insn->in_op1, type, conflict_reg)) {
            pseudoregs_map[conflict_reg].reg_status = register_delayed_swapped;
        } else {
            pseudoregs_map[conflict_reg].reg_status = register_swapped;
        }

        regmap->real_registers_cnt--;
        regmap->real_registers_map[real_reg] = -1;
    }
}

static BOOL _is_real_register_free(register_map *regmap, int real_reg)
{
    ASSERT(real_reg >= 0 && real_reg < X86_MAX_REG);
    return (regmap->real_registers_map[real_reg] == -1);
}

static int _alloc_real_register_from_range(function_desc *function, x86_instruction *insn, register_map *regmap,
    x86_pseudoreg_info *pseudoregs_map, int pseudoreg, x86_operand_type type,
    int start_reg, int last_reg, int reg_step)
{
    int real_reg, pseudoreg2;


    // Ищем вышедшие из употребления регистры, чтобы их переиспользовать.
    for (real_reg = start_reg; real_reg != last_reg; real_reg += reg_step) {
        if (regmap == &_dword_register_map && (real_reg == x86reg_ebp || real_reg == x86reg_esp)) {
            continue;
        }

        if (IS_MUL_DIV_INSN(insn->in_code) && real_reg == x86reg_edx) {
            continue;
        }

        if (IS_SHIFT_INSN(insn->in_code) && OP_IS_PSEUDO_REG(insn->in_op2) && real_reg == x86reg_ecx) {
            continue;
        }

        pseudoreg2 = regmap->real_registers_map[real_reg];

        if (pseudoreg2 == -1) {
            continue;
        }

        if (!x86_dataflow_is_pseudoreg_alive_after(function, pseudoreg2)) {
            pseudoregs_map[pseudoreg2].reg_status = register_delayed_swapped;
            regmap->real_registers_map[real_reg] = pseudoreg;
            return real_reg;
        }
    }


    // Ищем просто свободный регистр.
    for (real_reg = start_reg; real_reg != last_reg; real_reg += reg_step) {
        if (regmap == &_dword_register_map && (real_reg == x86reg_ebp || real_reg == x86reg_esp)) {
            continue;
        }

        if (IS_MUL_DIV_INSN(insn->in_code) && real_reg == x86reg_edx) {
            continue;
        }

        if (IS_SHIFT_INSN(insn->in_code) && OP_IS_PSEUDO_REG(insn->in_op2) && real_reg == x86reg_ecx) {
            continue;
        }

        if (_is_real_register_free(regmap, real_reg)) {
            regmap->real_registers_cnt++;
            regmap->real_registers_map[real_reg] = pseudoreg;
            return real_reg;
        }
    }


    // Нет свободных регистров, ищем наименее нужный регистр и вытесняем его.
    ASSERT(regmap->real_registers_cnt == _get_max_register_count(regmap));

    real_reg = _find_register_to_swap(function, insn, regmap);
    _swap_register(function, insn, regmap, pseudoregs_map, pseudoreg, real_reg, type);

    regmap->real_registers_cnt++;
    regmap->real_registers_map[real_reg] = pseudoreg;
    return real_reg;
}

static int _alloc_real_register(function_desc *function, x86_instruction *insn, register_map *regmap,
    x86_pseudoreg_info *pseudoregs_map, int pseudoreg, x86_operand_type type)
{
    int start_reg   = (OP_IS_REGVAR(pseudoreg, type) ? X86_MAX_REG - 1 : 0);
    int last_reg    = (OP_IS_REGVAR(pseudoreg, type) ? -1 : X86_MAX_REG);
    int reg_step    = (OP_IS_REGVAR(pseudoreg, type) ? -1 : 1);

    return _alloc_real_register_from_range(function, insn, regmap, pseudoregs_map, pseudoreg, type,
        start_reg, last_reg, reg_step);
}

static void _reserve_real_register(x86_pseudoreg_info *pseudoregs_map, int pseudoreg, int real_reg)
{
    if (pseudoregs_map[pseudoreg].reg_status == register_reserved &&
        pseudoregs_map[pseudoreg].reg_location == real_reg)
            return;

    ASSERT(real_reg >= 0 && real_reg < X86_MAX_REG && pseudoregs_map[pseudoreg].reg_status == register_free);

    pseudoregs_map[pseudoreg].reg_status    = register_reserved;
    pseudoregs_map[pseudoreg].reg_location  = real_reg;
}

static void _commit_register_reservation(function_desc *function, x86_instruction *insn,
    register_map *regmap, x86_pseudoreg_info *pseudoregs_map, int pseudoreg, x86_operand_type type)
{
    int real_reg = pseudoregs_map[pseudoreg].reg_location;
    ASSERT(pseudoregs_map[pseudoreg].reg_status == register_reserved);

    if (regmap->real_registers_map[real_reg] != -1) {
        // регистр занят, освобождаем
        _swap_register(function, insn, regmap, pseudoregs_map, pseudoreg, real_reg, type);
    }

    regmap->real_registers_cnt++;
    regmap->real_registers_map[real_reg] = pseudoreg;
    pseudoregs_map[pseudoreg].reg_status = register_allocated;
}

static int _alloc_byte_register(function_desc *function, x86_instruction *insn, x86_pseudoreg_info *pseudoregs_map, int pseudoreg)
{
    register_map *regmap = &_dword_register_map;
    return _alloc_real_register_from_range(function, insn, regmap, pseudoregs_map, pseudoreg, x86op_dword, x86reg_eax, x86reg_esp, 1);
}

static void _free_real_register(register_map *regmap, int real_reg)
{
    ASSERT(real_reg >= 0 && real_reg < X86_MAX_REG);
    ASSERT(regmap->real_registers_cnt > 0);

    regmap->real_registers_map[real_reg] = -1;
    regmap->real_registers_cnt--;
}

static void _free_all_dead_registers(function_desc *function, register_map *regmap)
{
    int real_reg, pseudoreg;

    for (real_reg = 0; real_reg != X86_MAX_REG; real_reg++) {
        pseudoreg = regmap->real_registers_map[real_reg];

        if (pseudoreg != -1 && !x86_dataflow_is_pseudoreg_alive_after(function, pseudoreg)) {
            _free_real_register(regmap, real_reg);
        }
    }
}


//
// Построение регистровой статистики.

static void _analyze_registers_usage(function_desc *function, register_stat *stat, x86_operand_type type)
{
    x86_pseudoreg_info *pseudoregs_map;
    x86_instruction *insn, *last;
    int reg_numbers[MAX_REGISTERS_PER_INSN];
    int pseudoregs_cnt, registers_count, i, reg;


    // Выделяем память под статистику.
    pseudoregs_cnt = function->func_pseudoregs_count[type];

    if (!stat->ptr || pseudoregs_cnt > stat->count) {
        if (stat->ptr) {
            allocator_free(allocator_global_pool, stat->ptr, sizeof(x86_pseudoreg_info) * stat->count);
        }

        stat->ptr = allocator_alloc(allocator_global_pool, sizeof(x86_pseudoreg_info) * pseudoregs_cnt);
    }

    stat->count     = pseudoregs_cnt;
    pseudoregs_map  = stat->ptr;

    for (i = 0; i < pseudoregs_cnt; i++)
    {
        pseudoregs_map[i].reg_changes_value = pseudoregs_map[i].reg_status          = 0;
        pseudoregs_map[i].reg_first_write   = pseudoregs_map[i].reg_last_read       = NULL;
        pseudoregs_map[i].reg_location      = pseudoregs_map[i].reg_stack_location  = -1;
    }


    // Составляем статистику использования псевдорегистров.
    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        bincode_extract_pseudoregs_read_by_insn(insn, type, reg_numbers, &registers_count);

        for (i = 0; i < registers_count; i++) {
            reg = reg_numbers[i];
            ASSERT(reg < pseudoregs_cnt);

            if (OP_IS_REGVAR(reg, type)) {
                // FIXME: считается, что регистровые переменные используются до конца функции.
                // Это нужно потому, что переход может вернуть нас в область её использования.
                pseudoregs_map[reg].reg_last_read = function->func_binary_code_end;
            } else {
                pseudoregs_map[reg].reg_last_read = insn;
            }
        }

        bincode_extract_pseudoregs_overwritten_by_insn(insn, type, reg_numbers, &registers_count);

        for (i = 0; i < registers_count; i++) {
            reg = reg_numbers[i];
            ASSERT(reg < pseudoregs_cnt);

            if (!pseudoregs_map[reg].reg_first_write) {
                pseudoregs_map[reg].reg_first_write = insn;
            } else {
                pseudoregs_map[reg].reg_changes_value = TRUE;
            }
        }

        bincode_extract_pseudoregs_modified_by_insn(insn, type, reg_numbers, &registers_count);

        for (i = 0; i < registers_count; i++) {
            reg = reg_numbers[i];
            ASSERT(reg < pseudoregs_cnt);

            ASSERT(pseudoregs_map[reg].reg_first_write);
            pseudoregs_map[reg].reg_changes_value = TRUE;

            if (!OP_IS_REGVAR(reg, type)) {
                pseudoregs_map[reg].reg_last_read = insn;
            }
        }

        if (type == x86op_dword) {
            // Для инструкций CDQ, XOR EDX,EDX: если остаток от деления (EDX) не используется,
            // ставим область использования EDX - до следующего DIV/IDIV.
            if (insn->in_code == x86insn_cdq) {
                ASSERT(OP_IS_REGISTER(insn->in_op1));
                reg = insn->in_op1.data.reg;
                ASSERT(pseudoregs_map[reg].reg_first_write == insn);

                if (pseudoregs_map[reg].reg_last_read == NULL) {
                    for (last = insn->in_next; last->in_code != x86insn_int_idiv; last = last->in_next) {}
                    pseudoregs_map[reg].reg_last_read = last;
                }
            } else if (insn->in_code == x86insn_xor_edx_edx) {
                ASSERT(OP_IS_REGISTER(insn->in_op1));
                reg = insn->in_op1.data.reg;
                ASSERT(pseudoregs_map[reg].reg_first_write == insn);

                if (pseudoregs_map[reg].reg_last_read == NULL) {
                    for (last = insn->in_next; last->in_code != x86insn_int_div; last = last->in_next) {}
                    pseudoregs_map[reg].reg_last_read = last;
                }
            }
        }
    }
}

void x86_analyze_registers_usage(function_desc *function)
{
    _analyze_registers_usage(function, &function->func_dword_regstat, x86op_dword);

    if (option_sse2) {
        _analyze_registers_usage(function, &function->func_sse_regstat, x86op_float);
    }
}


//
// Обслуживание FPU-стека.

static BOOL _type_is_func_returning_float(data_type *type)
{
    ASSERT(type->type_code == code_type_function);
    return (type->data.function.result_type->type_code == code_type_float);
}

static void _maintain_fpu_stack(function_desc *function)
{
    x86_instruction *insn, *next_insn;
    int fp_registers_cnt = 0, i, last_pusha_count = 0, num, sz, tmp = 0;
    BOOL has_float_res = _type_is_func_returning_float(function->func_sym->sym_type);

    for (insn = function->func_binary_code; insn; insn = next_insn) {
        next_insn = insn->in_next;

        // Порядок сохранения floating-point регистров: по младшим адресам идут младшие регистры.

        if (insn->in_code == x86insn_push_all && fp_registers_cnt) {
            // вставляем инструкции перед PUSHA
            for (i = fp_registers_cnt; i > 0; i--) {
                bincode_insert_fp_esp_offset(function, insn, x86insn_fpu_stp, x86op_double, -8 * i);
            }

            last_pusha_count = fp_registers_cnt;
            bincode_insert_insn_reg_const(function, insn, x86insn_int_sub, x86op_dword, ~x86reg_esp, last_pusha_count * 8);
        } else if (insn->in_code == x86insn_pop_all && last_pusha_count) {
            // вставляем инструкции после POPA
            ASSERT(last_pusha_count != 0);

            // Если функция возвращает float, мы кладём его в стек по адресу [esp-4],
            // а потом восстанавливаем все FP-регистры из стека. Это обеспечивает правильный порядок FP-стека.
            if (last_pusha_count != fp_registers_cnt) {
                ASSERT(last_pusha_count + 1 == fp_registers_cnt);
                num = last_pusha_count + 1;
                bincode_insert_fp_esp_offset(function, next_insn, x86insn_fpu_stp, x86op_double, -8);
            } else {
                num = last_pusha_count;
            }

            for (i = last_pusha_count - 1; i >= last_pusha_count - num; i--) {
                bincode_insert_fp_esp_offset(function, next_insn, x86insn_fpu_ld, x86op_double, 8 * i);
            }

            bincode_insert_insn_reg_const(function, next_insn, x86insn_int_add, x86op_dword, ~x86reg_esp, last_pusha_count * 8);
            last_pusha_count = 0;
        } else if (insn->in_code == x86insn_fpu_int2float) {
            fp_registers_cnt++;

            ASSERT(OP_IS_REGISTER_OR_ADDRESS(insn->in_op1));
            insn->in_code = x86insn_fpu_ld_int;

            if (OP_IS_REGISTER(insn->in_op1)) {
                if (tmp == 0) {
                    tmp = x86_stack_frame_alloc_tmp_var(function, 4);
                }

                bincode_insert_insn_ebp_offset_reg(function, insn, x86insn_int_mov, x86op_dword, tmp, insn->in_op1.data.reg);
                bincode_create_operand_addr_from_ebp_offset(&insn->in_op1, x86op_dword, tmp);
            }
        } else if (insn->in_code == x86insn_fpu_float2int) {
            fp_registers_cnt--;

            ASSERT(OP_IS_REGISTER_OR_ADDRESS(insn->in_op1));
            insn->in_code = x86insn_fpu_stp_int;

            if (OP_IS_REGISTER(insn->in_op1)) {
                if (tmp == 0) {
                    tmp = x86_stack_frame_alloc_tmp_var(function, 4);
                }

                bincode_insert_insn_reg_ebp_offset(function, next_insn, x86insn_int_mov, x86op_dword, insn->in_op1.data.reg, tmp);
                bincode_create_operand_addr_from_ebp_offset(&insn->in_op1, x86op_float, tmp);
            }
        } else if (insn->in_code == x86insn_push_arg && OP_IS_FLOAT(insn->in_op1)) {
            insn->in_op2.op_loc = x86loc_none;

            if (OP_IS_REGISTER(insn->in_op1)) {
                fp_registers_cnt--;
            }

            ASSERT(insn->in_op1.op_type == x86op_float || insn->in_op1.op_type == x86op_double)
            sz = (insn->in_op1.op_type == x86op_float ? 4 : 8);

            if (insn->in_op1.op_loc == x86loc_register) {
                bincode_insert_fp_esp_offset(function, insn, x86insn_fpu_stp, insn->in_op1.op_type, -sz);
                bincode_insert_insn_reg_const(function, insn, x86insn_int_sub, x86op_dword, ~x86reg_esp, sz);
                bincode_erase_instruction(function, insn);
            } else if (insn->in_op1.op_loc == x86loc_address) {
                if (sz == 4) {
                    insn->in_code  = x86insn_push;
                } else {
                    bincode_insert_unary_instruction(function, insn, x86insn_fpu_ld, &insn->in_op1);
                    fp_registers_cnt++;
                    ASSERT(fp_registers_cnt == 1);

                    bincode_insert_fp_esp_offset(function, insn, x86insn_fpu_stp, insn->in_op1.op_type, -sz);
                    bincode_insert_insn_reg_const(function, insn, x86insn_int_sub, x86op_dword, ~x86reg_esp, sz);
                    fp_registers_cnt--;

                    bincode_erase_instruction(function, insn);
                }
            } else {
                ASSERT(FALSE);
            }
        } else {
            // вычисляем вершину FP-стека после текущей инструкции
            if (insn->in_code == x86insn_fpu_ld || insn->in_code == x86insn_fpu_ld_int
                || IS_FLOAT_UNARY_ARITHM_INSN(insn->in_code)
                || insn->in_code == x86insn_set_retval && has_float_res && OP_IS_ADDRESS(insn->in_op1)) {
                    fp_registers_cnt++;
            } else if (insn->in_code == x86insn_fpu_stp || insn->in_code == x86insn_fpu_stp_int
                || IS_FLOAT_BINARY_ARITHM_INSN(insn->in_code) && insn->in_op1.op_loc == x86loc_register) {
                    fp_registers_cnt--;
            } else if (insn->in_code == x86insn_fpu_cmp) {
                fp_registers_cnt -= 2;
            } else if (insn->in_code == x86insn_call && OP_IS_FLOAT(insn->in_op2)) {
                fp_registers_cnt++;
            }
        }

        ASSERT(fp_registers_cnt < 4); // так как все операции бинарные, в стеке не может быть больше трёх регистров
    }

    ASSERT(last_pusha_count == 0);

    if (has_float_res) {
        ASSERT(fp_registers_cnt == 1 || fp_registers_cnt == 0);
    } else {
        ASSERT(fp_registers_cnt == 0);
    }
}


//
// Обрабатывает инструкции, требующие конкретных регистров:
// CDQ; IDIV reg/mem (затрагивают EAX, EDX)
// MUL reg/mem (затрагивает EAX, EDX)
// XOR EDX,EDX; DIV reg/mem (затрагивает EAX, EDX)
// SHL reg,cl (затрагивает ECX)

static void _reserve_special_registers(function_desc *function, x86_pseudoreg_info *pseudoregs_map)
{
    x86_instruction *insn;

    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        if (insn->in_code == x86insn_cdq || insn->in_code == x86insn_xor_edx_edx) {
            ASSERT(OP_IS_PSEUDO_REG(insn->in_op1) && insn->in_op2.op_loc == x86loc_none);
            _reserve_real_register(pseudoregs_map, insn->in_op1.data.reg, x86reg_edx);
        } else if (IS_MUL_DIV_INSN(insn->in_code)) {
            ASSERT(OP_IS_PSEUDO_REG(insn->in_op1) && insn->in_op2.op_loc != x86loc_none);
            _reserve_real_register(pseudoregs_map, insn->in_op1.data.reg, x86reg_eax);
        } else if (IS_SHIFT_INSN(insn->in_code) && OP_IS_PSEUDO_REG(insn->in_op2)) {
            _reserve_real_register(pseudoregs_map, insn->in_op2.data.reg, x86reg_ecx);
        } else if (insn->in_code == x86insn_read_retval) { // insn->in_code == x86insn_set_retval???
            ASSERT(OP_IS_PSEUDO_REG(insn->in_op1));
            _reserve_real_register(pseudoregs_map, insn->in_op1.data.reg, x86reg_eax);
        }
    }
}

static BOOL _handle_byte_registers(function_desc *function, x86_instruction *insn, x86_pseudoreg_info *pseudoregs_map)
{
    int reg, real_reg;

    // SETcc с байтовым регистром. Мы должны выделить 32-битный регистр EAX/ECX/EDX/EBX,
    // поместить в младшие биты результат и пропатчить следующую инструкцию, которая должна быть MOVZX.
    if (IS_SET_INSN(insn->in_code)) {
        ASSERT(insn->in_op1.data.reg > 0 && insn->in_op1.op_type == x86op_byte);
        ASSERT(insn->in_next->in_code == x86insn_movzx);
        ASSERT(insn->in_next->in_op1.data.reg > 0 && insn->in_next->in_op1.op_type == x86op_dword);
        ASSERT(insn->in_next->in_op2.data.reg > 0 && insn->in_next->in_op2.op_type == x86op_byte);

        reg = insn->in_next->in_op1.data.reg;
        real_reg = _alloc_byte_register(function, insn, pseudoregs_map, reg);


        insn->in_op1.data.reg = ~real_reg;
        insn->in_next->in_op1.data.reg = ~real_reg;
        insn->in_next->in_op2.data.reg = ~real_reg;

        pseudoregs_map[reg].reg_status      = register_allocated;
        pseudoregs_map[reg].reg_location    = real_reg;

        return TRUE;
    }

    return FALSE;
}

// TODO: регистры FPU также необходимо сохранять при вызовах функций.

static void _emulate_push_all(function_desc *function, x86_instruction *insn, x86_operand_type type,
    register_map *regmap, x86_pseudoreg_info *pseudoregs_map, int saved_real_registers_map[X86_MAX_REG])
{
    int i, insn_counter, reg, ofs;
    x86_instruction *pop_all;

    for (insn_counter = 0, pop_all = insn; pop_all->in_code != x86insn_pop_all; insn_counter++) {
        pop_all = pop_all->in_next;
    }

    x86_dataflow_step_insn_forward(function, type, insn_counter);
    memset(saved_real_registers_map, 0, sizeof(int)*X86_MAX_REG);

    if (type == x86op_dword) {
        // Нам нужно сохранить те из регистров EAX/ECX/EDX, которые в данный момент используются.
        for (i = 0; i <= x86reg_edx; i++) {
            reg = regmap->real_registers_map[i];

            if (reg != -1 && x86_dataflow_is_pseudoreg_alive_after(function, reg)) {
                saved_real_registers_map[i] = TRUE;
                ofs = pseudoregs_map[reg].reg_stack_location;

                if (ofs == -1) {
                    ofs = x86_stack_frame_alloc_tmp_var(function, 4);
                    pseudoregs_map[reg].reg_stack_location = ofs;
                }

                bincode_insert_insn_ebp_offset_reg(function, insn, x86insn_int_mov, x86op_dword, ofs, ~i);
            }
        }
    } else {
        ASSERT(type == x86op_float);

        for (i = 0; i < X86_MAX_REG; i++) {
            reg = regmap->real_registers_map[i];

            if (reg != -1 && x86_dataflow_is_pseudoreg_alive_after(function, reg)) {
                if (!_is_double_register(reg, pseudoregs_map)) {
                    saved_real_registers_map[i] = 1;
                    ofs = pseudoregs_map[reg].reg_stack_location;

                    if (ofs == -1) {
                        ofs = x86_stack_frame_alloc_tmp_var(function, 4);
                        pseudoregs_map[reg].reg_stack_location = ofs;
                    }

                    bincode_insert_insn_ebp_offset_reg(function, insn, x86insn_sse_movss, x86op_float, ofs, ~i);
                } else {
                    saved_real_registers_map[i] = 2;
                    ofs = pseudoregs_map[reg].reg_stack_location;

                    if (ofs == -1) {
                        ofs = x86_stack_frame_alloc_tmp_var(function, 8);
                        pseudoregs_map[reg].reg_stack_location = ofs;
                    }

                    bincode_insert_insn_ebp_offset_reg(function, insn, x86insn_sse_movsd, x86op_double, ofs, ~i);
                }
            }
        }
    }

    x86_dataflow_step_insn_backward(function, type, insn_counter);
}

static void _emulate_pop_all(function_desc *function, x86_instruction *insn, x86_operand_type type,
    register_map *regmap, x86_pseudoreg_info *pseudoregs_map, int saved_real_registers_map[X86_MAX_REG])
{
    int i, reg, ofs;

    if (type == x86op_dword) {
        for (i = x86reg_edx; i >= 0; i--) {
            if (saved_real_registers_map[i]) {
                reg = regmap->real_registers_map[i];
                ofs = pseudoregs_map[reg].reg_stack_location;

                bincode_insert_insn_reg_ebp_offset(function, insn, x86insn_int_mov, x86op_dword, ~i, ofs);
            }
        }
    } else {
        ASSERT(type == x86op_float);

        for (i = X86_MAX_REG-1; i >= 0; i--) {
            if (saved_real_registers_map[i] == 1) {
                reg = regmap->real_registers_map[i];
                ofs = pseudoregs_map[reg].reg_stack_location;

                bincode_insert_insn_reg_ebp_offset(function, insn, x86insn_sse_movss, x86op_float, ~i, ofs);
            } else if (saved_real_registers_map[i] == 2) {
                reg = regmap->real_registers_map[i];
                ofs = pseudoregs_map[reg].reg_stack_location;

                bincode_insert_insn_reg_ebp_offset(function, insn, x86insn_sse_movsd, x86op_double, ~i, ofs);
            }
        }
    }
}

static void _allocate_registers(function_desc *function, register_stat *stat, register_map *regmap, x86_operand_type type)
{
    x86_pseudoreg_info  *pseudoregs_map = stat->ptr;
    x86_instruction     *insn, *next_insn;
    x86_register_ref    registers[MAX_REGISTERS_PER_INSN];
    int                 registers_count, i, reg, real_reg, ofs, conflict_reg, result;
    int                 saved_real_registers_map[X86_MAX_REG];


    //
    // Проходим по инструкциям функции и заменяем псевдорегистры на соответствующие реальные регистры.
    // Если под псевдорегистр не выделен реальный регистр, выделяем.

    _clear_register_map(regmap);
    x86_dataflow_prepare_function(function, type);

    if (type == x86op_dword) {
        // Обрабатываем инструкции, требующие фиксированных регистров.
        _reserve_special_registers(function, pseudoregs_map);
    }


    for (insn = function->func_binary_code; insn; insn = next_insn) {
        next_insn = insn->in_next;
        x86_dataflow_step_insn_forward(function, type, 1);

        if (insn->in_code == x86insn_label || IS_JMP_INSN(insn->in_code)) {
            continue;
        }

        // Обрабатываем инструкции, использующие байтовые регистры.
        if (type == x86op_dword && _handle_byte_registers(function, insn, pseudoregs_map)) {
            continue;
        }

        result = (OP_IS_REGISTER(insn->in_op1) ? insn->in_op1.data.reg : -1);

        // Извлекаем набор псевдорегистров, который используется инструкцией.
        bincode_extract_pseudoregs_from_insn(insn, type, registers, &registers_count);

        // Заменяем все псевдорегистры на истинные регистры.
        for (i = 0; i < registers_count; i++) {
            reg = *registers[i].reg_addr;

            if (pseudoregs_map[reg].reg_status == register_allocated || pseudoregs_map[reg].reg_status == register_delayed_swapped) {
                // под этот псевдорегистр уже выделен истинный регистр, пробиваем его в инструкцию
                real_reg                        = pseudoregs_map[reg].reg_location;
                pseudoregs_map[reg].reg_status  = register_allocated;
            } else if (pseudoregs_map[reg].reg_status == register_reserved) {
                // под этот псевдорегистр зарезервирован реальный регистр
                _commit_register_reservation(function, insn, regmap, pseudoregs_map, reg, type);

                real_reg                        = pseudoregs_map[reg].reg_location;
                pseudoregs_map[reg].reg_status  = register_allocated;
            } else if (pseudoregs_map[reg].reg_status == register_swapped) {
                // регистр был вытеснен
                ofs             = pseudoregs_map[reg].reg_stack_location;
                real_reg        = pseudoregs_map[reg].reg_location;
                conflict_reg    = regmap->real_registers_map[real_reg];

                if (reg == result || conflict_reg != result) {
                    // Вытесняем конфликтующий регистр в стек и загружаем сохранённое значение из стека.
                    _swap_register(function, insn, regmap, pseudoregs_map, reg, real_reg, type);

                    regmap->real_registers_cnt++;
                    regmap->real_registers_map[real_reg] = reg;
                    pseudoregs_map[reg].reg_status = register_allocated;

                    if ((!IS_DEFINING_INSN(insn->in_code, type) || !OP_IS_THIS_PSEUDO_REG(insn->in_op1, type, reg)) && ofs != -1) {
                        // Загружаем сохранённое значение из стека.
                        if (type == x86op_dword) {
                            bincode_insert_insn_reg_ebp_offset(function, insn, x86insn_int_mov, x86op_dword, ~real_reg, ofs);
                        } else if (!_is_double_register(reg, pseudoregs_map)) {
                            bincode_insert_insn_reg_ebp_offset(function, insn, x86insn_sse_movss, x86op_float, ~real_reg, ofs);
                        } else {
                            bincode_insert_insn_reg_ebp_offset(function, insn, x86insn_sse_movsd, x86op_double, ~real_reg, ofs);
                        }
                    }

                    pseudoregs_map[reg].reg_status = register_allocated;
                } else {
                    // Копируем сохранённое значение в другой регистр.
                    real_reg = _alloc_real_register(function, insn, regmap, pseudoregs_map, reg, type);

                    if (ofs != -1) { // FIXME: не должно ли место в стеке быть гарантировано выделено???
                        if (type == x86op_dword) {
                            bincode_insert_insn_reg_ebp_offset(function, insn, x86insn_int_mov, x86op_dword, ~real_reg, ofs);
                        } else if (!_is_double_register(reg, pseudoregs_map)) {
                            bincode_insert_insn_reg_ebp_offset(function, insn, x86insn_sse_movss, x86op_float, ~real_reg, ofs);
                        } else {
                            bincode_insert_insn_reg_ebp_offset(function, insn, x86insn_sse_movsd, x86op_double, ~real_reg, ofs);
                        }
                    }

                    _free_real_register(regmap, real_reg);
                }

                // TODO: заменять read-only операнд на чтение из памяти
                //else if (OP_IS_THIS_PSEUDO_REG(insn->in_op2, type, reg) ||
                //    OP_IS_THIS_PSEUDO_REG(insn->in_op1, type, reg) && insn->in_op2.op_loc == x86loc_none) {
                //        // заменить операнд на чтение из памяти
            } else {
                // нужен новый регистр
                ASSERT(pseudoregs_map[reg].reg_status == register_free);

                real_reg = _alloc_real_register(function, insn, regmap, pseudoregs_map, reg, type);
                pseudoregs_map[reg].reg_location    = real_reg;
                pseudoregs_map[reg].reg_status      = register_allocated;
            }

            *registers[i].reg_addr          = ~real_reg;
        }

        // Эмулируем псевдоинструкции, для этого вставляем реальные инструкции перед ними.
        // push_all/pop_all сохраняют те регистры, которые являются живыми на момент call-а.
        if (insn->in_code == x86insn_push_all) {
            _emulate_push_all(function, insn, type, regmap, pseudoregs_map, saved_real_registers_map);
        } else if (insn->in_code == x86insn_pop_all) {
            _emulate_pop_all(function, insn, type, regmap, pseudoregs_map, saved_real_registers_map);
        }

        // Удаляем тривиальные присваивания (тривиальная оптимизация).
        if (IS_MOV_INSN(insn->in_code) && OP_IS_REGISTER(insn->in_op1) && OP_IS_REGISTER(insn->in_op2)
            && insn->in_op1.data.reg == insn->in_op2.data.reg) {
                bincode_erase_instruction(function, insn);
            }

        // Регистры, ставшие мёртвыми в текущей инструкции и переиспользованные, помечаются как swapped.
        for (reg = 1; reg < function->func_pseudoregs_count[type]; reg++) {
            if (pseudoregs_map[reg].reg_status == register_delayed_swapped) {
                pseudoregs_map[reg].reg_status = register_swapped;
                real_reg = pseudoregs_map[reg].reg_location;
                ASSERT(regmap->real_registers_map[real_reg] != reg);
            }
        }
    }

    // Если последняя инструкция - jmp, могут оставаться живые регистры; иначе их не должно быть.
    _free_all_dead_registers(function, regmap);
    ASSERT(regmap->real_registers_cnt == 0 || function->func_binary_code_end->in_code == x86insn_jmp);
}

static void _handle_pseudo_instructions(function_desc *function)
{
    x86_instruction *insn, *next_insn;
    x86_register real_regs[MAX_REGISTERS_PER_INSN];
    int i, registers_count, sz;
    x86_operand tmp;

    BOOL real_regs_usage[X86_MAX_REG] = {0, 0, 0, 0, 0, 0, 0, 0, };
    AUX_CASSERT(sizeof(real_regs_usage) / sizeof(real_regs_usage[0]) == X86_MAX_REG);


    // Собираем статистику использования реальных регистров.
    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        bincode_extract_real_registers_from_insn(insn, x86op_dword, real_regs, &registers_count);

        for (i = 0; i < registers_count; i++) {
            real_regs_usage[real_regs[i].reg_value] = TRUE;
        }
    }

    // Обрабатываем все псевдоинструкции.
    for (insn = function->func_binary_code; insn; insn = next_insn) {
        next_insn = insn->in_next;

        if (insn->in_code == x86insn_create_stack_frame) {
            bincode_insert_push_reg(function, insn, x86op_dword, ~x86reg_ebp);
            bincode_insert_insn_reg_reg(function, insn, x86insn_int_mov, x86op_dword, ~x86reg_ebp, ~x86reg_esp);

            if (function->func_local_vars_sz) {
                bincode_insert_insn_reg_const(function, insn, x86insn_int_sub, x86op_dword, ~x86reg_esp, function->func_local_vars_sz);
            }

            if (real_regs_usage[x86reg_edi]) {
                bincode_insert_push_reg(function, insn, x86op_dword, ~x86reg_edi);
            }

            if (real_regs_usage[x86reg_esi]) {
                bincode_insert_push_reg(function, insn, x86op_dword, ~x86reg_esi);
            }

            if (real_regs_usage[x86reg_ebx]) {
                bincode_insert_push_reg(function, insn, x86op_dword, ~x86reg_ebx);
            }
        } else if (insn->in_code == x86insn_destroy_stack_frame) {
            if (real_regs_usage[x86reg_ebx]) {
                bincode_insert_pop_reg(function, insn, x86op_dword, ~x86reg_ebx);
            }

            if (real_regs_usage[x86reg_esi]) {
                bincode_insert_pop_reg(function, insn, x86op_dword, ~x86reg_esi);
            }

            if (real_regs_usage[x86reg_edi]) {
                bincode_insert_pop_reg(function, insn, x86op_dword, ~x86reg_edi);
            }

            if (function->func_local_vars_sz) {
                bincode_insert_insn_reg_const(function, insn, x86insn_int_add, x86op_dword, ~x86reg_esp, function->func_local_vars_sz);
            }

            bincode_insert_pop_reg(function, insn, x86op_dword, ~x86reg_ebp);
        } else if (insn->in_code == x86insn_push_arg) {
            if (!OP_IS_FLOAT(insn->in_op1) || insn->in_op1.op_type == x86op_float && OP_IS_ADDRESS(insn->in_op1)) {
                insn->in_code       = x86insn_push;
                insn->in_op2.op_loc = x86loc_none;
            } else {
                sz              = (insn->in_op1.op_type == x86op_float ? 4 : 8);
                ASSERT(sz == insn->in_op2.data.int_val);

                insn->in_code   = ENCODE_SSE_MOV(insn->in_op1.op_type);
                insn->in_op2    = insn->in_op1;
                ASSERT(OP_IS_REGISTER_OR_ADDRESS(insn->in_op2));

                if (OP_IS_ADDRESS(insn->in_op2)) {
                    bincode_create_operand_from_register(&insn->in_op1, insn->in_op2.op_type, 0);
                    bincode_insert_instruction(function, insn, insn->in_code, &insn->in_op1, &insn->in_op2);
                    insn->in_op2    = insn->in_op1;
                }

                bincode_create_operand_addr_from_esp_offset(&insn->in_op1, insn->in_op2.op_type, -sz);
                bincode_insert_insn_reg_const(function, insn->in_next, x86insn_int_sub, x86op_dword, ~x86reg_esp, sz);
            }
        } else if (insn->in_code == x86insn_restore_stack) {
            insn->in_code  = x86insn_int_add;
            insn->in_op2   = insn->in_op1;

            bincode_create_operand_from_register(&insn->in_op1, x86op_dword, x86reg_esp);
        } else if (insn->in_code == x86insn_set_retval) {
            UNIMPLEMENTED_ASSERT(insn->in_op1.op_type != x86op_qword);

            if (OP_IS_INT(insn->in_op1)) {
                if (insn->in_op1.op_loc != x86loc_register || insn->in_op1.data.reg != ~x86reg_eax) {
                    bincode_create_operand_from_register(&tmp, insn->in_op1.op_type, x86reg_eax);
                    bincode_insert_instruction(function, insn, x86insn_int_mov, &tmp, &insn->in_op1);
                }
            } else if (!option_sse2 && insn->in_op1.op_loc == x86loc_address) {
                bincode_insert_unary_instruction(function, insn, x86insn_fpu_ld, &insn->in_op1);
            } else if (!option_sse2) {
                // результат уже находится в st(0)
            } else if (insn->in_op1.op_loc != x86loc_register || insn->in_op1.data.reg != ~0) {
                // результат в xmm0
                bincode_create_operand_from_register(&tmp, insn->in_op1.op_type, 0);
                bincode_insert_instruction(function, insn, ENCODE_SSE_MOV(insn->in_op1.op_type),
                    &tmp, &insn->in_op1);
            }
        } else if (insn->in_code == x86insn_read_retval) {
            if (OP_IS_INT(insn->in_op1)) {
                if (insn->in_op1.op_loc != x86loc_register || insn->in_op1.data.reg != ~x86reg_eax) {
                    insn->in_code = x86insn_int_mov;
                    bincode_create_operand_from_register(&insn->in_op2, insn->in_op1.op_type, x86reg_eax);
                }
            } else if (!option_sse2) {
                // результат уже находится в st(0)
            } else if (insn->in_op1.op_loc != x86loc_register || insn->in_op1.data.reg != ~0) {
                // результат в xmm0
                insn->in_code = ENCODE_SSE_MOV(insn->in_op1.op_type);
                bincode_create_operand_from_register(&insn->in_op2, insn->in_op1.op_type, 0);
            }
        }
    }

    for (insn = function->func_binary_code; insn; insn = next_insn) {
        next_insn = insn->in_next;

        if (insn->in_code == x86insn_push_all || insn->in_code == x86insn_pop_all
            || insn->in_code == x86insn_create_stack_frame || insn->in_code == x86insn_destroy_stack_frame
            || insn->in_code == x86insn_set_retval || insn->in_code == x86insn_read_retval) {
                bincode_erase_instruction(function, insn);
        } else if (insn->in_code == x86insn_cdq) {
            insn->in_op1.op_loc = x86loc_none;
        } else if (insn->in_code == x86insn_xor_edx_edx) {
            insn->in_code       = x86insn_int_xor;
            insn->in_op2        = insn->in_op1;
        } else if (IS_MUL_DIV_INSN(insn->in_code)) {
            insn->in_op1    = insn->in_op2;
            insn->in_op2.op_loc = x86loc_none;
        } else if (IS_SHIFT_INSN(insn->in_code)) {
            insn->in_op2.op_type = x86op_byte;
        }
    }
}


void x86_allocate_registers(function_desc *function)
{
    if (!option_sse2) {
        // Обрабатываем FPU-инструкции, работающие со стеком, и валидируем FPU-стек.
        _maintain_fpu_stack(function);

        // Замена псевдоинструкций FPU может изменить регионы использования адресных регистров.
        x86_analyze_registers_usage(function);
    }

    // Запускаем аллокатор регистров для 32-битных регистров.
    _allocate_registers(function, &function->func_dword_regstat, &_dword_register_map, x86op_dword);

    if (option_sse2) {
        // Запускаем аллокатор регистров для SSE-регистров.
        _allocate_registers(function, &function->func_sse_regstat, &_sse_register_map, x86op_float);
    }

    // Обрабатываем псевдо-инструкции и сохраняем изменённые регистры EBX/ESI/EDI.
    _handle_pseudo_instructions(function);
}

