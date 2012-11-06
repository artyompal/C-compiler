
#include "common.h"
#include "x86_bincode.h"
#include "x86_regalloc.h"
#include "x86_stack_frame.h"
#include "x86_opt_data_flow.h"
#include "x86_optimizer.h"


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
// Вспомогательные функции аллокатора регистров.

int x86_get_registers_count(x86_operand_type type)
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

static int _find_register_to_swap(x86_instruction *insn, register_map *regmap, x86_operand_type type)
{
    int i, j, regs[MAX_REGISTERS_PER_INSN], regs_cnt;
    int busy_regs[X86_MAX_REG]  = {0};
    int free_registers_count    = x86_get_registers_count(type);
    int last_free_register      = 0;

    // Двигаемся вниз по коду функции и вычисляем регистр, который наиболее долго не потребуется.

    for (; insn && free_registers_count > 1; insn = insn->in_next) {
        bincode_extract_pseudoregs_from_insn_wo_dupes(insn, type, regs, &regs_cnt);

        for (i = 0; i < x86_get_registers_count(type); i++) {
            for (j = 0; j < regs_cnt; j++) {
                if (regs[j] == regmap->real_registers_map[i]) {
                    free_registers_count += (busy_regs[i] - 1);
                    busy_regs[i] = TRUE;
                }
            }
        }

        for (i = 0; busy_regs[i]; i++) {
            ASSERT(i < x86_get_registers_count(type));
        }

        last_free_register = i;
    }

    return last_free_register;
}

static void _swap_register(function_desc *function, x86_instruction *insn, register_map *regmap,
    x86_pseudoreg_info *pseudoregs_map, int real_reg, x86_operand_type type)
{
    int conflict_reg = regmap->real_registers_map[real_reg];
    ASSERT(real_reg < x86_get_registers_count(type));

    if (conflict_reg > 0) {
        if (x86_dataflow_is_pseudoreg_alive_before(conflict_reg)) {
            int ofs = pseudoregs_map[conflict_reg].reg_stack_location;
            int dbl = (pseudoregs_map[conflict_reg].reg_content_type == x86op_double);

            if (ofs == -1) {
                ofs = x86_stack_frame_alloc_tmp_var(function, (dbl ? 8 : 4));
                pseudoregs_map[conflict_reg].reg_stack_location = ofs;
            }

            if (type == x86op_dword) {
                bincode_insert_insn_ebp_offset_reg(function, insn, x86insn_int_mov, x86op_dword, ofs, ~real_reg);
            } else if (!dbl) {
                bincode_insert_insn_ebp_offset_reg(function, insn, x86insn_sse_movss, x86op_float, ofs, ~real_reg);
            } else {
                bincode_insert_insn_ebp_offset_reg(function, insn, x86insn_sse_movsd, x86op_double, ofs, ~real_reg);
            }

            pseudoregs_map[conflict_reg].reg_status = register_swapped;
        } else if (!x86_dataflow_is_pseudoreg_alive_after(conflict_reg)) {
            pseudoregs_map[conflict_reg].reg_status = register_delayed_swapped;
        } else {
			pseudoregs_map[conflict_reg].reg_status = register_swapped;
        }

        regmap->real_registers_cnt--;
        regmap->real_registers_map[real_reg] = -1;
    }
}

static void _force_swap_register(function_desc *function, x86_instruction *insn, register_map *regmap,
    x86_pseudoreg_info *pseudoregs_map, int reg, x86_operand_type type)
{
	int real_reg = pseudoregs_map[reg].reg_location;

    ASSERT(real_reg < x86_get_registers_count(type));
    ASSERT(reg > 0);

	if (x86_dataflow_is_pseudoreg_alive_after(reg) && pseudoregs_map[reg].reg_dirty) {
        int ofs = pseudoregs_map[reg].reg_stack_location;
        int dbl = (pseudoregs_map[reg].reg_content_type == x86op_double);

        if (ofs == -1) {
            ofs = x86_stack_frame_alloc_tmp_var(function, (dbl ? 8 : 4));
            pseudoregs_map[reg].reg_stack_location = ofs;
        }

        if (type == x86op_dword) {
		    bincode_insert_insn_ebp_offset_reg(function, insn, x86insn_int_mov, x86op_dword, ofs, ~real_reg);
        } else if (!dbl) {
            bincode_insert_insn_ebp_offset_reg(function, insn, x86insn_sse_movss, x86op_float, ofs, ~real_reg);
        } else {
            bincode_insert_insn_ebp_offset_reg(function, insn, x86insn_sse_movsd, x86op_double, ofs, ~real_reg);
        }
    }

    pseudoregs_map[reg].reg_status = register_swapped;
    regmap->real_registers_cnt--;
    regmap->real_registers_map[real_reg] = -1;
}


static void _restore_register(function_desc *function, x86_instruction *insn,
    x86_pseudoreg_info *pseudoregs_map, int reg, int real_reg, x86_operand_type type)
{
    int ofs = pseudoregs_map[reg].reg_stack_location;

    if (x86_dataflow_is_pseudoreg_alive_before(reg)) {
        ASSERT(ofs != -1);

        if (type == x86op_dword) {
            bincode_insert_insn_reg_ebp_offset(function, insn, x86insn_int_mov, x86op_dword, ~real_reg, ofs);
        } else if (pseudoregs_map[reg].reg_content_type != x86op_double) {
            bincode_insert_insn_reg_ebp_offset(function, insn, x86insn_sse_movss, x86op_float, ~real_reg, ofs);
        } else {
            bincode_insert_insn_reg_ebp_offset(function, insn, x86insn_sse_movsd, x86op_double, ~real_reg, ofs);
        }

        pseudoregs_map[reg].reg_dirty = FALSE;
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
        if (IS_MUL_DIV_INSN(insn->in_code) && real_reg == x86reg_edx) {
            continue;
        }

        if (IS_SHIFT_INSN(insn->in_code) && OP_IS_PSEUDO_REG(insn->in_op2, type) && real_reg == x86reg_ecx) {
            continue;
        }

        pseudoreg2 = regmap->real_registers_map[real_reg];

        if (pseudoreg2 == -1) {
            continue;
        }

        if (!x86_dataflow_is_pseudoreg_alive_after(pseudoreg2)) { // FIXME: тут не хватает x86_dataflow_is_pseudoreg_alive_before
            pseudoregs_map[pseudoreg2].reg_status = register_delayed_swapped;
            regmap->real_registers_map[real_reg] = pseudoreg;
            return real_reg;
        }
    }


    // Ищем просто свободный регистр.
    for (real_reg = start_reg; real_reg != last_reg; real_reg += reg_step) {
        if (IS_MUL_DIV_INSN(insn->in_code) && real_reg == x86reg_edx) {
            continue;
        }

        if (IS_SHIFT_INSN(insn->in_code) && OP_IS_PSEUDO_REG(insn->in_op2, type) && real_reg == x86reg_ecx) {
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

    real_reg = _find_register_to_swap(insn, regmap, type);
    _swap_register(function, insn, regmap, pseudoregs_map, real_reg, type);

    regmap->real_registers_cnt++;
    regmap->real_registers_map[real_reg] = pseudoreg;
    return real_reg;
}

static int _alloc_real_register(function_desc *function, x86_instruction *insn, register_map *regmap,
    x86_pseudoreg_info *pseudoregs_map, int pseudoreg, x86_operand_type type)
{
    int start_reg   = (OP_IS_REGVAR(pseudoreg, type) ? x86_get_registers_count(type) - 1 : 0);
    int last_reg    = (OP_IS_REGVAR(pseudoreg, type) ? -1 : x86_get_registers_count(type));
    int reg_step    = (OP_IS_REGVAR(pseudoreg, type) ? -1 : 1);

    return _alloc_real_register_from_range(function, insn, regmap, pseudoregs_map, pseudoreg, type,
        start_reg, last_reg, reg_step);
}

static void _reserve_real_register(x86_pseudoreg_info *pseudoregs_map, int pseudoreg, int real_reg)
{
    if (pseudoregs_map[pseudoreg].reg_status == register_reserved &&
        pseudoregs_map[pseudoreg].reg_location == real_reg)
            return;

    ASSERT(real_reg >= 0 && real_reg < X86_MAX_REG && pseudoregs_map[pseudoreg].reg_status == register_unallocated);

    pseudoregs_map[pseudoreg].reg_status    = register_reserved;
    pseudoregs_map[pseudoreg].reg_location  = real_reg;
}

static void _commit_register_reservation(function_desc *function, x86_instruction *insn,
    register_map *regmap, x86_pseudoreg_info *pseudoregs_map, int pseudoreg, x86_operand_type type)
{
    int real_reg = pseudoregs_map[pseudoreg].reg_location;
    ASSERT(pseudoregs_map[pseudoreg].reg_status == register_reserved);

    // если регистр занят, освобождаем
    _swap_register(function, insn, regmap, pseudoregs_map, real_reg, type);

    regmap->real_registers_cnt++;
    regmap->real_registers_map[real_reg] = pseudoreg;
    pseudoregs_map[pseudoreg].reg_status = register_allocated;
}

static int _alloc_byte_register(function_desc *function, x86_instruction *insn, x86_pseudoreg_info *pseudoregs_map, int pseudoreg)
{
    register_map *regmap = &_dword_register_map;
    return _alloc_real_register_from_range(function, insn, regmap, pseudoregs_map, pseudoreg, x86op_dword, x86reg_eax, x86reg_esi, 1);
}

static void _free_real_register(register_map *regmap, int real_reg)
{
    ASSERT(real_reg >= 0 && real_reg < X86_MAX_REG);
    ASSERT(regmap->real_registers_cnt > 0);

    regmap->real_registers_map[real_reg] = -1;
    regmap->real_registers_cnt--;
}

static void _free_all_dead_registers(register_map *regmap)
{
    int real_reg, pseudoreg;

    for (real_reg = 0; real_reg != X86_MAX_REG; real_reg++) {
        pseudoreg = regmap->real_registers_map[real_reg];

        if (pseudoreg != -1 && !x86_dataflow_is_pseudoreg_alive_after(pseudoreg)) {
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
        pseudoregs_map[i].reg_status            = register_unallocated;
        pseudoregs_map[i].reg_stack_location    = -1;
        pseudoregs_map[i].reg_dirty             = FALSE;
        pseudoregs_map[i].reg_location          = -1;
        pseudoregs_map[i].reg_content_type      = x86op_none;

        pseudoregs_map[i].reg_first_write       = NULL;
        pseudoregs_map[i].reg_last_read         = NULL;
        pseudoregs_map[i].reg_changes_value     = FALSE;
    }


    // Инициализируем reg_stack_location для регистровых переменных.
    x86_setup_offset_for_register_variables(function, type);


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

            ASSERT(OP_IS_THIS_PSEUDO_REG(insn->in_op1, type, reg));
            pseudoregs_map[reg].reg_content_type = insn->in_op1.op_type;

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
                ASSERT(OP_IS_REGISTER(insn->in_op1, type));
                reg = insn->in_op1.data.reg;
                ASSERT(pseudoregs_map[reg].reg_first_write == insn);

                if (pseudoregs_map[reg].reg_last_read == NULL) {
                    for (last = insn->in_next; last->in_code != x86insn_int_idiv; last = last->in_next) {}
                    pseudoregs_map[reg].reg_last_read = last;
                }
            } else if (insn->in_code == x86insn_xor_edx_edx) {
                ASSERT(OP_IS_REGISTER(insn->in_op1, type));
                reg = insn->in_op1.data.reg;
                ASSERT(pseudoregs_map[reg].reg_first_write == insn);

                if (pseudoregs_map[reg].reg_last_read == NULL) {
                    for (last = insn->in_next; last->in_code != x86insn_int_div; last = last->in_next) {}
                    pseudoregs_map[reg].reg_last_read = last;
                }
            } else if(insn->in_code == x86insn_rep_movsb || insn->in_code == x86insn_rep_movsd) {
                // Для инструкций REP MOVSB/MOVSD: ставим область использования ECX до этой инструкции,
                // если он не используется после; ставим также флаг модификации, чтобы защитить регистр от оптимизации.
                ASSERT(OP_IS_REGISTER(insn->in_prev->in_op1, type));
                reg = insn->in_prev->in_op1.data.reg;

                if (pseudoregs_map[reg].reg_last_read == NULL) {
                    pseudoregs_map[reg].reg_last_read = insn;
                }

                pseudoregs_map[reg].reg_changes_value = TRUE;
            }
        }
    }
}

void x86_analyze_registers_usage(function_desc *function)
{
    _analyze_registers_usage(function, &function->func_dword_regstat, x86op_dword);
    _analyze_registers_usage(function, &function->func_sse_regstat, x86op_float);
}

//
// Обрабатывает инструкции, требующие конкретных регистров:
// CDQ; IDIV reg/mem (затрагивают EAX, EDX)
// MUL reg/mem (затрагивает EAX, EDX)
// XOR EDX,EDX; DIV reg/mem (затрагивает EAX, EDX)
// SHL reg,cl (затрагивает ECX)
// MOVSB/MOVSD (затрагивают ECX, ESI, EDI)
static void _reserve_special_registers(function_desc *function, x86_operand_type type)
{
    x86_pseudoreg_info  *pseudoregs_map = unit_get_regstat(function, type)->ptr;
    x86_instruction *insn;

    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        // инструкции для всех регистров
        if (insn->in_code == x86insn_read_retval && x86_equal_types(insn->in_op1.op_type, type)) {
            ASSERT(OP_IS_PSEUDO_REG(insn->in_op1, insn->in_op1.op_type));
            _reserve_real_register(pseudoregs_map, insn->in_op1.data.reg, x86reg_eax);
        }

        // специфичные инструкции для 32-битных регистров
        if (type == x86op_dword) {
            if (insn->in_code == x86insn_cdq) {
                ASSERT(OP_IS_PSEUDO_REG(insn->in_op1, type) && OP_IS_PSEUDO_REG(insn->in_op2, type));
                _reserve_real_register(pseudoregs_map, insn->in_op1.data.reg, x86reg_edx);
		    } else if (insn->in_code == x86insn_xor_edx_edx) {
                ASSERT(OP_IS_PSEUDO_REG(insn->in_op1, type) && insn->in_op2.op_loc == x86loc_none);
                _reserve_real_register(pseudoregs_map, insn->in_op1.data.reg, x86reg_edx);
            } else if (IS_MUL_DIV_INSN(insn->in_code)) {
                ASSERT(OP_IS_PSEUDO_REG(insn->in_op1, type) && insn->in_op2.op_loc != x86loc_none);
                _reserve_real_register(pseudoregs_map, insn->in_op1.data.reg, x86reg_eax);
            } else if (IS_SHIFT_INSN(insn->in_code) && OP_IS_PSEUDO_REG(insn->in_op2, type)) {
                _reserve_real_register(pseudoregs_map, insn->in_op2.data.reg, x86reg_ecx);
            } else if (insn->in_code == x86insn_rep_movsb || insn->in_code == x86insn_rep_movsd) {
                ASSERT(insn->in_prev && OP_IS_PSEUDO_REG(insn->in_prev->in_op1, type));
                ASSERT(OP_IS_PSEUDO_REG(insn->in_op1, type) && OP_IS_PSEUDO_REG(insn->in_op2, type));

                _reserve_real_register(pseudoregs_map, insn->in_prev->in_op1.data.reg, x86reg_ecx);
                _reserve_real_register(pseudoregs_map, insn->in_op1.data.reg, x86reg_edi);
                _reserve_real_register(pseudoregs_map, insn->in_op2.data.reg, x86reg_esi);
            }
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

static void _emulate_push_all(function_desc *function, x86_instruction *insn, x86_operand_type type, register_map *regmap,
    x86_pseudoreg_info *pseudoregs_map)
{
    int i, reg;
    x86_instruction *pop_all;

    for (pop_all = insn; pop_all->in_code != x86insn_pop_all; ) {
        pop_all = pop_all->in_next;
    }

    x86_dataflow_set_current_insn(function, type, pop_all);

    if (type == x86op_dword) {
        // Нам нужно сохранить те из регистров EAX/ECX/EDX, которые используются на момент x86insn_pop_all.
        for (i = x86reg_eax; i <= x86reg_edx; i++) {
            reg = regmap->real_registers_map[i];

            if (reg != -1 && x86_dataflow_is_pseudoreg_alive_after(reg)) {
				_force_swap_register(function, insn, regmap, pseudoregs_map, reg, type);
            }
        }
    } else {
        ASSERT(type == x86op_float);

        for (i = 0; i < X86_MAX_REG; i++) {
            reg = regmap->real_registers_map[i];

            if (reg != -1 && x86_dataflow_is_pseudoreg_alive_after(reg)) {
				_force_swap_register(function, insn, regmap, pseudoregs_map, reg, type);
            }
        }
    }

    x86_dataflow_set_current_insn(function, type, insn);
}

static void _merge_register_states(function_desc *function, x86_instruction *insn, register_map *new_regmap, register_map *old_regmap,
    x86_pseudoreg_info *pseudoregs_map, x86_operand_type type)
{
    int real_reg, reg;

    for (real_reg = 0; real_reg < x86_get_registers_count(type); real_reg++) {
        if (new_regmap->real_registers_map[real_reg] != old_regmap->real_registers_map[real_reg]) {
            _swap_register(function, insn, new_regmap, pseudoregs_map, real_reg, type);

            reg = old_regmap->real_registers_map[real_reg];
            ASSERT(reg < function->func_pseudoregs_count[type]);

            if (reg != -1) {
                new_regmap->real_registers_cnt++;
                new_regmap->real_registers_map[real_reg] = reg;

                _restore_register(function, insn, pseudoregs_map, reg, real_reg, type);
            }
        }
    }
}


static void _allocate_registers(function_desc *function, register_stat *stat, register_map *regmap, x86_operand_type type)
{
    x86_pseudoreg_info  *pseudoregs_map = stat->ptr;
    x86_instruction     *insn, *next_insn;
    int                 *registers[MAX_REGISTERS_PER_INSN];
    int                 registers_count, i, reg, real_reg, conflict_reg, result, label;
    register_map        *labels_register_state;


    //
    // Строим таблицу соответствия меток и переходов на них.
    // На каждую метку должно быть не более одного перехода вперёд (назад - сколько угодно).
    labels_register_state   = allocator_alloc(allocator_per_function_pool, sizeof(register_map) * function->func_labels_count);
    memset(labels_register_state, -1, sizeof(register_map) * function->func_labels_count);


    //
    // Проходим по инструкциям функции и заменяем псевдорегистры на соответствующие реальные регистры.
    // Если под псевдорегистр не выделен реальный регистр, выделяем.

    _clear_register_map(regmap);
    x86_dataflow_prepare_function(function, type);

    for (insn = function->func_binary_code; insn; insn = next_insn) {
        next_insn = insn->in_next;
        x86_dataflow_set_current_insn(function, type, insn);

        // Обрабатываем метки и переходы: мы должны смержить стейты.
        if (insn->in_code == x86insn_label || IS_JMP_INSN(insn->in_code)) {
            label = insn->in_op1.data.label;
            ASSERT(label < function->func_labels_count);

            if (labels_register_state[label].real_registers_cnt == -1) {
                memcpy(&labels_register_state[label], regmap, sizeof(register_map));
            } else {
                _merge_register_states(function, insn, regmap, &labels_register_state[label], pseudoregs_map, type);
            }
        }

        // Если мы проходим через метку, мы вынуждены считать, что все выделенные регистры могли быть изменены.
        // TODO: более точный анализ того, были ли какие-либо регистры изменены.
        if (insn->in_code == x86insn_label) {
            for (i = 0; i < x86_get_registers_count(type); i++) {
                reg = regmap->real_registers_map[i];

                if (reg != -1) {
                    pseudoregs_map[reg].reg_dirty = TRUE;
                }
            }
        }

		// Обрабатываем инструкции, использующие байтовые регистры.
        if (type == x86op_dword && _handle_byte_registers(function, insn, pseudoregs_map)) {
            continue;
        }

        result = (OP_IS_REGISTER(insn->in_op1, type) ? insn->in_op1.data.reg : -1);

        // Извлекаем набор псевдорегистров, который используется инструкцией.
        bincode_extract_pseudoregs_from_insn(insn, type, registers, &registers_count);

        // Заменяем все псевдорегистры на истинные регистры.
        for (i = 0; i < registers_count; i++) {
            reg = *registers[i];

            if (pseudoregs_map[reg].reg_status == register_allocated || pseudoregs_map[reg].reg_status == register_delayed_swapped) {
                // под этот псевдорегистр уже выделен истинный регистр, пробиваем его в инструкцию
                real_reg                        = pseudoregs_map[reg].reg_location;
            } else if (pseudoregs_map[reg].reg_status == register_reserved) {
                // под этот псевдорегистр зарезервирован реальный регистр
                _commit_register_reservation(function, insn, regmap, pseudoregs_map, reg, type);

                real_reg                        = pseudoregs_map[reg].reg_location;
                pseudoregs_map[reg].reg_status  = register_allocated;
            } else if (pseudoregs_map[reg].reg_status == register_swapped) {
                // регистр был вытеснен
                real_reg        = pseudoregs_map[reg].reg_location;
                conflict_reg    = regmap->real_registers_map[real_reg];

                if (conflict_reg != reg) {
                    if (OP_IS_THIS_PSEUDO_REG(insn->in_op2, type, reg) && OP_IS_REGISTER(insn->in_op1, type) &&
                        insn->in_code != x86insn_cdq) {
                            // Если второй операнд является выгруженным регистром, оставить его в памяти.
                            ASSERT(pseudoregs_map[reg].reg_stack_location != -1);
                            bincode_create_operand_addr_from_reg_offset(&insn->in_op2, insn->in_op2.op_type, ~x86reg_ebp,
                                pseudoregs_map[reg].reg_stack_location);
                            continue;
                    } else if (OP_IS_THIS_PSEUDO_REG(insn->in_op1, type, reg) &&
                        (insn->in_op2.op_loc == x86loc_none || insn->in_code == x86insn_push_arg)) {
                            // Для однооперандной инструкции, если первый операнд является выгруженным регистром,
                            // его можно оставить в памяти.
                            ASSERT(pseudoregs_map[reg].reg_stack_location != -1);
                            bincode_create_operand_addr_from_reg_offset(&insn->in_op1, insn->in_op1.op_type, ~x86reg_ebp,
                                pseudoregs_map[reg].reg_stack_location);
                            continue;
                    } else if (reg == result && OP_IS_THIS_PSEUDO_REG(insn->in_op2, type, conflict_reg) && IS_MOV_INSN(insn->in_code)) {
                        // Если два операнда MOV претендуют на один регистр, присваиваем регистр и удаляем инструкцию.
                        regmap->real_registers_map[real_reg] = reg;
                        insn->in_op1.data.reg = insn->in_op2.data.reg = ~real_reg;

                        pseudoregs_map[reg].reg_status          = register_allocated;
                        pseudoregs_map[conflict_reg].reg_status = register_swapped;
                        break;
                    } else if (reg == result || conflict_reg != result) {
                        // Вытесняем конфликтующий регистр в стек и загружаем сохранённое значение из стека.
                        _swap_register(function, insn, regmap, pseudoregs_map, real_reg, type);

                        regmap->real_registers_cnt++;
                        regmap->real_registers_map[real_reg] = reg;

                        _restore_register(function, insn, pseudoregs_map, reg, real_reg, type);
                        pseudoregs_map[reg].reg_status = register_allocated;
                    } else {
						// Копируем сохранённое значение в другой регистр.
                        real_reg = _alloc_real_register(function, insn, regmap, pseudoregs_map, reg, type);
                        _restore_register(function, insn, pseudoregs_map, reg, real_reg, type);
                        _free_real_register(regmap, real_reg);
                    }
                }
            } else {
                // нужен новый регистр
                ASSERT(pseudoregs_map[reg].reg_status == register_unallocated);
                real_reg = _alloc_real_register(function, insn, regmap, pseudoregs_map, reg, type);

                pseudoregs_map[reg].reg_location    = real_reg;
                pseudoregs_map[reg].reg_status      = register_allocated;
            }

            *registers[i] = ~real_reg;
        }

        // Эмулируем псевдоинструкции, для этого вставляем реальные инструкции перед ними.
        // push_all/pop_all сохраняют те регистры, которые являются живыми на момент call-а.
        if (insn->in_code == x86insn_push_all) {
            _emulate_push_all(function, insn, type, regmap, pseudoregs_map);
        }

        // Если регистр изменён, запоминаем этот факт для случая, когда регистр придётся выгружать.
        if (IS_VOLATILE_INSN(insn->in_code, type) && result > 0 && OP_IS_REGISTER(insn->in_op1, type) &&
            !(IS_MOV_INSN(insn->in_code) && OP_IS_SPEC_EBP_OFFSET(insn->in_op2, pseudoregs_map[result].reg_stack_location))) {
                pseudoregs_map[result].reg_dirty = TRUE;
            }

        // Удаляем тривиальные присваивания (тривиальная оптимизация).
        if (IS_MOV_INSN(insn->in_code) && OP_IS_REGISTER(insn->in_op1, type) && OP_IS_REGISTER(insn->in_op2, type)
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
    _free_all_dead_registers(regmap);
    ASSERT(regmap->real_registers_cnt == 0 || function->func_binary_code_end->in_code == x86insn_jmp);

    allocator_free(allocator_per_function_pool, labels_register_state, sizeof(register_map) * function->func_labels_count);
}

static void _handle_pseudo_instructions(function_desc *function)
{
    x86_instruction *insn, *next_insn;
    int real_regs[MAX_REGISTERS_PER_INSN];
    int i, registers_count, sz;
    x86_operand tmp;

    BOOL real_regs_usage[X86_MAX_REG] = {0, 0, 0, 0, 0, 0, 0, 0, };
    AUX_CASSERT(sizeof(real_regs_usage) / sizeof(real_regs_usage[0]) == X86_MAX_REG);


    // Собираем статистику использования реальных регистров.
    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        bincode_extract_real_registers_from_insn(insn, x86op_dword, real_regs, &registers_count);

        for (i = 0; i < registers_count; i++) {
            real_regs_usage[real_regs[i]] = TRUE;
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
        } else if (insn->in_code == x86insn_cdq || insn->in_code == x86insn_rep_movsb || insn->in_code == x86insn_rep_movsd) {
            insn->in_op1.op_loc = x86loc_none;
            insn->in_op2.op_loc = x86loc_none;
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
    // Обрабатываем инструкции, требующие фиксированных регистров.
    _reserve_special_registers(function, x86op_dword);
    _reserve_special_registers(function, x86op_float);

    // Запускаем аллокатор регистров для 32-битных регистров.
    _allocate_registers(function, &function->func_dword_regstat, &_dword_register_map, x86op_dword);

    // Запускаем аллокатор регистров для SSE-регистров.
    _allocate_registers(function, &function->func_sse_regstat, &_sse_register_map, x86op_float);

    // Обрабатываем псевдо-инструкции и сохраняем изменённые регистры EBX/ESI/EDI.
    _handle_pseudo_instructions(function);
}

