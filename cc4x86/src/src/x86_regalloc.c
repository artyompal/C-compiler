
#include "common.h"
#include "x86_bincode.h"
#include "x86_regalloc.h"
#include "x86_stack_frame.h"


typedef struct register_map_decl {
    int real_registers_cnt;
    int real_registers_map[X86_MAX_REG];    // ������������� �����: ������-�������,
                                            // -1:                  �������� �������,
                                            // ���������:           ������
} register_map;

static register_map _byte_register_map;
static register_map _word_register_map;
static register_map _dword_register_map;
static register_map _sse2_register_map;


static register_map *_get_register_map(x86_operand_type type)
{
    switch (type) {
    case x86op_byte:
        return &_byte_register_map;
    case x86op_word:
        return &_word_register_map;
    case x86op_dword:
        return &_dword_register_map;
    case x86op_float:
        return &_sse2_register_map;
    default:
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


static void _clear_register_map(register_map *regmap)
{
    int i;

    regmap->real_registers_cnt = 0;

    for (i = 0; i < X86_MAX_REG; i++) {
        regmap->real_registers_map[i] = -1;
    }
}

static BOOL _is_real_register_free(register_map *regmap, int real_reg)
{
    ASSERT(real_reg >= 0 && real_reg < X86_MAX_REG);
    return (regmap->real_registers_map[real_reg] == -1);
}

static void _reserve_real_register(register_map *regmap, int real_reg, int pseudoreg)
{
    ASSERT(real_reg >= 0 && real_reg < X86_MAX_REG && regmap->real_registers_map[real_reg] == -1);
    regmap->real_registers_map[real_reg] = pseudoreg;
    regmap->real_registers_cnt++;
}

static int _alloc_real_register(register_map *regmap, int pseudoreg)
{
    int reg;

    ASSERT(regmap->real_registers_cnt < X86_TMP_REGISTERS_COUNT);
    regmap->real_registers_cnt++;

    for (reg = 0; ; reg++) {
        if ((regmap == &_word_register_map || regmap == &_dword_register_map) &&
            (reg == x86reg_ebp || reg == x86reg_esp)) {
                continue;
        }
        UNIMPLEMENTED_ASSERT(reg < X86_MAX_REG);

        if (_is_real_register_free(regmap, reg)) {
            break;
        }
    }

    regmap->real_registers_map[reg] = pseudoreg;
    return reg;
}

static int _alloc_real_register_for_regvar(register_map *regmap, int pseudoreg)
{
    int reg;

    ASSERT(regmap->real_registers_cnt < X86_TMP_REGISTERS_COUNT);
    regmap->real_registers_cnt++;

    for (reg = X86_MAX_REG - 1; ; reg--) {
        if ((regmap == &_word_register_map || regmap == &_dword_register_map) &&
            (reg == x86reg_ebp || reg == x86reg_esp)) {
                continue;
            }

        UNIMPLEMENTED_ASSERT(reg >= 0);

        if (_is_real_register_free(regmap, reg)) {
            break;
        }
    }

    regmap->real_registers_map[reg] = pseudoreg;
    return reg;
}

static int _alloc_real_register_except_eax(register_map *regmap, int pseudoreg)
{
    int reg;

    ASSERT(regmap->real_registers_cnt < X86_TMP_REGISTERS_COUNT);
    regmap->real_registers_cnt++;

    for (reg = x86reg_ecx; ; reg++) {
        if ((regmap == &_word_register_map || regmap == &_dword_register_map) &&
            (reg == x86reg_ebp || reg == x86reg_esp)) {
                continue;
            }

        UNIMPLEMENTED_ASSERT(reg < X86_MAX_REG);

        if (_is_real_register_free(regmap, reg)) {
            break;
        }
    }

    regmap->real_registers_map[reg] = pseudoreg;
    return reg;
}

static void _free_real_register(register_map *regmap, int real_reg)
{
    ASSERT(regmap->real_registers_cnt > 0);
    regmap->real_registers_map[real_reg] = -1;
    regmap->real_registers_cnt--;
}


static void _analyze_registers_usage(function_desc *function, register_stat *stat, x86_operand_type type)
{
    x86_pseudoreg_info *pseudoregs_map;
    x86_instruction *insn;
    x86_register registers[MAX_REGISTERS_PER_INSN];
    int pseudoregs_cnt, registers_count, i, reg;
    register_map *regmap = _get_register_map(type);


    // ������� ����� �������������� ���������������.
    pseudoregs_cnt = 0;

    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        if (insn->in_op1.op_loc == x86loc_register) {
            x86_operand_type new_reg_type = x86_encode_register_type(insn->in_op1.op_type);

            if (new_reg_type == type && insn->in_op1.data.reg >= pseudoregs_cnt) {
                // ����� �������������� ����� ���������� ������ ��� ������ ������� ����������.
                ASSERT(insn->in_code == x86insn_int_mov || insn->in_code == x86insn_lea
                    || insn->in_code == x86insn_imul_const || insn->in_code == x86insn_movzx
                    || insn->in_code == x86insn_movsx || insn->in_code == x86insn_fpu_float2int
                    || IS_SET_INSN(insn->in_code));
                pseudoregs_cnt = insn->in_op1.data.reg + 1;
            }
        }
    }


    // �������� ������ ��� ����������.
    if (!stat->ptr || pseudoregs_cnt > stat->count) {
        if (stat->ptr) {
            allocator_free(allocator_persistent_pool, stat->ptr,
                sizeof(x86_pseudoreg_info) * stat->count);
        }

        pseudoregs_map = allocator_alloc(allocator_persistent_pool, sizeof(x86_pseudoreg_info) * pseudoregs_cnt);
        memset(pseudoregs_map, 0, sizeof(x86_pseudoreg_info) * pseudoregs_cnt);

        stat->ptr   = pseudoregs_map;
        stat->count  = pseudoregs_cnt;
    } else {
        pseudoregs_map = stat->ptr;

         // FIXME: ��� memset �� ������, ������, ���-�� �������� ������ �������������������� ������. Also, �� ������ � ������.
        memset(pseudoregs_map, 0, sizeof(x86_pseudoreg_info) * pseudoregs_cnt);
    }


    // ���������� ���������� ������������� ���������������.
    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        bincode_extract_pseudoregs_read_by_insn(insn, registers, &registers_count);

        for (i = 0; i < registers_count; i++) {
            if (x86_encode_register_type(registers[i].reg_type) != type) {
                continue;
            }

            reg = registers[i].reg_value;
            ASSERT(reg < pseudoregs_cnt);

            if (X86_IS_REGVAR(reg) && type == x86op_dword) {
                // FIXME: ���������, ��� ����������� ���������� ������������ �� ����� �������.
                // ��� ����� ������, ��� ������� ����� ������� ��� � ������� � �������������.
                pseudoregs_map[reg].reg_last_read = function->func_binary_code_end;
            } else {
                pseudoregs_map[reg].reg_last_read = insn;
            }
        }

        bincode_extract_pseudoregs_written_by_insn(insn, registers, &registers_count);

        for (i = 0; i < registers_count; i++) {
            if (x86_encode_register_type(registers[i].reg_type) != type) {
                continue;
            }

            reg = registers[i].reg_value;
            ASSERT(reg < pseudoregs_cnt);

            if (!pseudoregs_map[reg].reg_first_write) {
                pseudoregs_map[reg].reg_first_write     = insn;
            } else {
                pseudoregs_map[reg].reg_changes_value   = TRUE;
            }

            if (X86_IS_REGVAR(reg) && type == x86op_dword) {
                pseudoregs_map[reg].reg_last_read = function->func_binary_code_end;
            } else {
                pseudoregs_map[reg].reg_last_read = insn;
            }
        }
    }
}

void x86_analyze_registers_usage(function_desc *function)
{
    _analyze_registers_usage(function, &function->func_byte_regstat, x86op_byte);
    _analyze_registers_usage(function, &function->func_word_regstat, x86op_word);
    _analyze_registers_usage(function, &function->func_dword_regstat, x86op_dword);

    if (option_use_sse2) {
        _analyze_registers_usage(function, &function->func_sse2_regstat, x86op_float);
    }
}


// ������������ FPU-�����.

static BOOL _type_is_func_returning_float(data_type *type)
{
    ASSERT(type->type_code == code_type_function);
    return (type->data.function.result_type->type_code == code_type_float);
}

static void _maintain_fpu_stack(function_desc *function)
{
    x86_instruction *insn, *next_insn;
    int fp_registers_cnt = 0, i, last_pusha_count = 0, num, sz, tmp = 0;

    for (insn = function->func_binary_code; insn; insn = next_insn) {
        next_insn = insn->in_next;

        // ������� ���������� floating-point ���������: �� ������� ������� ���� ������� ��������.

        if (insn->in_code == x86insn_push_all && fp_registers_cnt) {
            // ��������� ���������� ����� PUSHA
            for (i = fp_registers_cnt; i > 0; i--) {
                bincode_insert_fp_esp_offset(function, insn, x86insn_fpu_stp, x86op_double, -8 * i);
            }

            last_pusha_count = fp_registers_cnt;
            bincode_insert_int_reg_const(function, insn, x86insn_int_sub, x86op_dword, ~x86reg_esp, last_pusha_count * 8);
        } else if (insn->in_code == x86insn_pop_all && last_pusha_count) {
            // ��������� ���������� ����� POPA
            ASSERT(last_pusha_count != 0);

            // ���� ������� ���������� float, �� ����� ��� � ���� �� ������ [esp-4],
            // � ����� ��������������� ��� FP-�������� �� �����. ��� ������������ ���������� ������� FP-�����.
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

            bincode_insert_int_reg_const(function, next_insn, x86insn_int_add, x86op_dword, ~x86reg_esp, last_pusha_count * 8);
            last_pusha_count = 0;
        } else if (insn->in_code == x86insn_fpu_int2float) {
            fp_registers_cnt++;

            ASSERT(OP_IS_REGISTER_OR_ADDRESS(insn->in_op1));
            insn->in_code = x86insn_fpu_ld_int;

            if (OP_IS_REGISTER(insn->in_op1)) {
                if (tmp == 0) {
                    tmp = x86_stack_frame_alloc_tmp_var(function, 4);
                }

                bincode_insert_int_ebp_offset_reg(function, insn, x86insn_int_mov, x86op_dword, tmp, insn->in_op1.data.reg);
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

                bincode_insert_int_reg_ebp_offset(function, next_insn, x86insn_int_mov, x86op_dword, insn->in_op1.data.reg, tmp);
                bincode_create_operand_addr_from_ebp_offset(&insn->in_op1, x86op_float, tmp);
            }
        } else if (insn->in_code == x86insn_push_arg && OP_IS_FLOAT(insn->in_op1)) {
            if (OP_IS_REGISTER(insn->in_op1)) {
                fp_registers_cnt--;
            }

            ASSERT(insn->in_op1.op_type == x86op_float || insn->in_op1.op_type == x86op_double)
            sz = (insn->in_op1.op_type == x86op_float ? 4 : 8);

            if (insn->in_op1.op_loc == x86loc_register) {
                bincode_insert_fp_esp_offset(function, insn, x86insn_fpu_stp, insn->in_op1.op_type, -sz);
                bincode_insert_int_reg_const(function, insn, x86insn_int_sub, x86op_dword, ~x86reg_esp, sz);
                bincode_erase_instruction(function, insn);
            } else if (insn->in_op1.op_loc == x86loc_address) {
                if (sz == 4) {
                    insn->in_code  = x86insn_push;
                } else {
                    bincode_insert_unary_instruction(function, insn, x86insn_fpu_ld, &insn->in_op1);
                    fp_registers_cnt++;
                    UNIMPLEMENTED_ASSERT(fp_registers_cnt < 8);

                    bincode_insert_fp_esp_offset(function, insn, x86insn_fpu_stp, insn->in_op1.op_type, -sz);
                    bincode_insert_int_reg_const(function, insn, x86insn_int_sub, x86op_dword, ~x86reg_esp, sz);
                    fp_registers_cnt--;

                    bincode_erase_instruction(function, insn);
                }
            } else {
                ASSERT(FALSE);
            }
        } else {
            // ��������� ������� FP-����� ����� ������� ����������
            if (insn->in_code == x86insn_fpu_ld || insn->in_code == x86insn_fpu_ld_int
                || IS_FLOAT_UNARY_ARITHM_INSN(insn->in_code)) {
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

        UNIMPLEMENTED_ASSERT(fp_registers_cnt < 8);
    }

    ASSERT(last_pusha_count == 0);

    if (_type_is_func_returning_float(function->func_sym->sym_type)) {
        ASSERT(fp_registers_cnt == 1);
    } else {
        ASSERT(fp_registers_cnt == 0);
    }
}

static BOOL _handle_special_instructions(function_desc *function, x86_instruction *insn, x86_pseudoreg_info *pseudoregs_map, x86_operand_type type)
{
    register_map *regmap = _get_register_map(type);
    int reg, reg2, real_reg, real_reg2;

    // MOV EAX/EDX,reg.
    // ���� �� ��� �� � ���� ��������, ������ ������������ ���� �� ��������, ��� XCHG ���� �� �����.
    // TODO: ��� MOV EAX/EDX,reg ������ ���-�������� � ������������ ���� ������������� � ��������� �������
    if (insn->in_code == x86insn_int_mov && OP_IS_REAL_REG(insn->in_op1) && OP_IS_PSEUDO_REG(insn->in_op2)) {
        real_reg    = ~insn->in_op1.data.reg;
        reg         = insn->in_op2.data.reg;

        ASSERT(pseudoregs_map[reg].reg_last_read == insn || X86_IS_REGVAR(reg) && type == x86op_dword);

        if (pseudoregs_map[reg].reg_location == real_reg) {
            bincode_erase_instruction(function, insn);
            _free_real_register(regmap, real_reg);
        } else if (_is_real_register_free(regmap, real_reg)) {
            insn->in_op2.data.reg              = ~pseudoregs_map[reg].reg_location;

            if (pseudoregs_map[reg].reg_last_read == insn)
                _free_real_register(regmap, pseudoregs_map[reg].reg_location);
        } else {
            reg2                                = regmap->real_registers_map[real_reg];
            real_reg2                           = pseudoregs_map[reg].reg_location;
            UNIMPLEMENTED_ASSERT(!X86_IS_REGVAR(reg2) || type != x86op_dword);

            insn->in_code                      = x86insn_int_xchg;
            insn->in_op2.data.reg              = ~real_reg2;

            pseudoregs_map[reg2].reg_location   = real_reg2;
            pseudoregs_map[reg].reg_location    = real_reg;

            _free_real_register(regmap, real_reg);
            _free_real_register(regmap, real_reg2);
            _reserve_real_register(regmap, real_reg2, reg2);
        }

        pseudoregs_map[reg].reg_status = register_unallocated;
        return TRUE;
    }

    // MOV reg,EAX/EDX.
    // ���� reg �� ����������� ����������, �������� ���� �������� ������� ��� reg, ������� ������������.
    else if (insn->in_code == x86insn_int_mov && OP_IS_PSEUDO_DWORD_REG(insn->in_op1) && OP_IS_REAL_DWORD_REG(insn->in_op2)) {
        reg         = insn->in_op1.data.reg;
        real_reg    = ~insn->in_op2.data.reg;

        if (!X86_IS_REGVAR(reg) || type != x86op_dword) {
            ASSERT(pseudoregs_map[reg].reg_first_write == insn);

            _reserve_real_register(regmap, real_reg, reg);
            pseudoregs_map[reg].reg_status      = register_allocated;
            pseudoregs_map[reg].reg_location    = real_reg;

            bincode_erase_instruction(function, insn);
            return TRUE;
        }
    }

    // CDQ.
    // �� ������ ���������� EDX.
    else if (insn->in_code == x86insn_cdq && type == x86op_dword) {
        if (!_is_real_register_free(regmap, x86reg_edx)) {
            reg         = regmap->real_registers_map[x86reg_edx];
            real_reg    = _alloc_real_register_except_eax(regmap, reg);
            ASSERT(!X86_IS_REGVAR(reg) || type != x86op_dword);

            ASSERT(pseudoregs_map[reg].reg_status == register_allocated);
            _free_real_register(regmap, pseudoregs_map[reg].reg_location);
            pseudoregs_map[reg].reg_location    = real_reg;

            bincode_insert_int_reg_reg(function, insn, x86insn_int_mov, x86op_dword, ~real_reg, ~x86reg_edx);
        }

        return TRUE;
    }

    // CALL � ������������� �����������.
    // �� ������ ���������� EAX.
    else if (insn->in_code == x86insn_call && OP_IS_INT(insn->in_op2) && type == x86op_dword) {
        if (!_is_real_register_free(regmap, x86reg_eax)) {
            reg         = regmap->real_registers_map[x86reg_eax];
            ASSERT(!X86_IS_REGVAR(reg) || type != x86op_dword);

            if (pseudoregs_map[reg].reg_last_read != insn) {
                real_reg    = _alloc_real_register_except_eax(regmap, reg);

                ASSERT(pseudoregs_map[reg].reg_status == register_allocated);
                _free_real_register(regmap, pseudoregs_map[reg].reg_location);
                pseudoregs_map[reg].reg_location    = real_reg;

                // �� �� ���������� MOV, ������ ��� CALL ��������� ������ ���� x86insn_push_all/x86insn_pop_all
                // � �������� ��������� ��� ��������� � �����.
            }
        }
    }

    return FALSE;
}

static void _allocate_registers(function_desc *function, register_stat *stat, x86_operand_type type)
{
    register_map        *regmap = _get_register_map(type);
    x86_pseudoreg_info  *pseudoregs_map = stat->ptr;
    x86_instruction     *insn, *next_insn;
    x86_register_ref    registers[MAX_REGISTERS_PER_INSN];
    int                 pseudoregs[MAX_REGISTERS_PER_INSN];
    int                 registers_count, i, reg, real_reg, max_save_reg;
    int                 saved_real_registers_map[X86_MAX_REG];


    LOG(("x86_allocate_registers(function=%s)\n", function->func_sym->sym_name));


    //
    // �������� �� ����������� ������� � �������� ��������.
    // ���� ��� ������������� �� ������� �������� �������, ��������.
    // ����� ����� �������� ��� ������ �� �������������� �� ��������������� �������� ��������.
    //
    // ��������� ��������� �� ������ �������� �������� �������� ��� �������������� ���������������,
    // ������� ���� ������� ������������� ����� ������ x86_analyze_registers_usage() � ����� ������ � ������ �������.
    //

    _clear_register_map(regmap);

    for (insn = function->func_binary_code; insn; insn = next_insn) {
        next_insn = insn->in_next;

        if (insn->in_code == x86insn_label || IS_JMP_INSN(insn->in_code)) {
            continue;
        }

        // ������������ ����������� ������.
        if (type == x86op_dword && _handle_special_instructions(function, insn, pseudoregs_map, type)) {
            continue;
        }

        // ��������� ����� ���������������, ������� ������������ �����������.
        bincode_extract_pseudoregs_from_insn(insn, type, registers, &registers_count);

        // ��������� ������ ���������������, ��� ��� ��� ����� ���������� ���������� �������� ���������.
        for (i = 0; i < registers_count; i++) {
            pseudoregs[i] = *registers[i].reg_addr;
        }

        // �������� ��� �������������� �� �������� ��������.
        for (i = 0; i < registers_count; i++) {
            reg = pseudoregs[i];

            if (pseudoregs_map[reg].reg_status == register_allocated) {
                // ��� ���� ������������� ��� ������� �������� �������, ��������� ��� � ����������
                real_reg                = pseudoregs_map[reg].reg_location;
                *registers[i].reg_addr  = ~real_reg;
            } else {
                // ����� ����� �������
                ASSERT(pseudoregs_map[reg].reg_status == register_unallocated);
                UNIMPLEMENTED_ASSERT(regmap->real_registers_cnt < X86_TMP_REGISTERS_COUNT);

                if (X86_IS_REGVAR(reg) && type == x86op_dword) {
                    real_reg = _alloc_real_register_for_regvar(regmap, reg);
                } else {
                    real_reg = _alloc_real_register(regmap, reg);
                }

                pseudoregs_map[reg].reg_status      = register_allocated;
                pseudoregs_map[reg].reg_location    = real_reg;
                *registers[i].reg_addr              = ~real_reg;
            }
        }

        // ����������� �������� �������� �� ���������������, ������� ������ �� �����.
        for (i = 0; i < registers_count; i++) {
            reg = pseudoregs[i];

            if (X86_IS_REGVAR(reg) && type == x86op_dword) continue;

            if (pseudoregs_map[reg].reg_last_read == insn && pseudoregs_map[reg].reg_status == register_allocated) {
                pseudoregs_map[reg].reg_status = register_unallocated;
                _free_real_register(regmap, pseudoregs_map[reg].reg_location);
            }
        }

        // ��������� ����������������, ��� ����� ��������� �������� ���������� ����� ����.
        max_save_reg = (type == x86op_byte ? x86reg_bh : x86reg_edx);

        if (insn->in_code == x86insn_push_all) {
            for (i = 0; i <= max_save_reg; i++) {
                if (regmap->real_registers_map[i] != -1) {
                    bincode_insert_push_reg(function, insn, type, ~i);
                }
            }

            memcpy(saved_real_registers_map, regmap->real_registers_map, sizeof(saved_real_registers_map));
        } else if (insn->in_code == x86insn_pop_all) {
            for (i = max_save_reg; i >= 0; i--) {
                if (saved_real_registers_map[i] != -1) {
                    bincode_insert_pop_reg(function, insn, type, ~i);
                }
            }
        }
    }

    // � ��������� ����� �������� ������ ���������� ����������� ����������.
    for (i = 0; i < X86_MAX_REG; i++) {
        reg = regmap->real_registers_map[i];
        ASSERT(reg == -1 || X86_IS_REGVAR(reg) && type == x86op_dword);
    }
}

static void _stack_handling(function_desc *function, x86_operand_type type)
{
    x86_instruction *insn, *next_insn;
    x86_register real_regs[MAX_REGISTERS_PER_INSN];
    int i, registers_count;

    BOOL real_regs_usage[X86_MAX_REG] = {0, 0, 0, 0, 0, 0, 0, 0, };
    AUX_CASSERT(sizeof(real_regs_usage) / sizeof(real_regs_usage[0]) == X86_MAX_REG);


    // �������� ���������� ������������� �������� ���������.
    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        bincode_extract_real_registers_from_insn(insn, type, real_regs, &registers_count);

        for (i = 0; i < registers_count; i++) {
            if (real_regs[i].reg_type == type)
                real_regs_usage[real_regs[i].reg_value] = TRUE;
        }
    }

    // ���������� ��� ������� � �������.
    for (insn = function->func_binary_code; insn; insn = next_insn) {
        next_insn = insn->in_next;

        if (insn->in_code == x86insn_create_stack_frame) {
            bincode_insert_push_reg(function, insn, x86op_dword, ~x86reg_ebp);
            bincode_insert_int_reg_reg(function, insn, x86insn_int_mov, x86op_dword, ~x86reg_ebp, ~x86reg_esp);

            if (function->func_local_vars_sz) {
                bincode_insert_int_reg_const(function, insn, x86insn_int_sub, x86op_dword, ~x86reg_esp, function->func_local_vars_sz);
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
                bincode_insert_int_reg_const(function, insn, x86insn_int_add, x86op_dword, ~x86reg_esp, function->func_local_vars_sz);
            }

            bincode_insert_pop_reg(function, insn, x86op_dword, ~x86reg_ebp);
        } else if (insn->in_code == x86insn_push_arg) {
            insn->in_code  = x86insn_push;
        } else if (insn->in_code == x86insn_restore_stack) {
            insn->in_code  = x86insn_int_add;
            insn->in_op2   = insn->in_op1;

            bincode_create_operand_from_register(&insn->in_op1, x86op_dword, x86reg_esp);
        }
    }
}

static void _remove_pseudo_instructions(function_desc *function)
{
    x86_instruction *insn, *next_insn;

    for (insn = function->func_binary_code; insn; insn = next_insn) {
        next_insn = insn->in_next;

        if (insn->in_code == x86insn_push_all || insn->in_code == x86insn_pop_all
            || insn->in_code == x86insn_create_stack_frame || insn->in_code == x86insn_destroy_stack_frame) {
                bincode_erase_instruction(function, insn);
            }
    }
}

void x86_allocate_registers(function_desc *function)
{
    if (!option_use_sse2) {
        // ������������ x86insn_push_all/x86insn_pop_all ��� ��������� FPU
        // � ���������� FPU-����.
        _maintain_fpu_stack(function);

        // ������ ���������������� FPU ����� �������� ������� ������������� �������� ���������.
        x86_analyze_registers_usage(function);
    }

    // TODO: ��� ��������� word ��������� ���� ��������� ��������, ������� byte; ��� ��������� dword ���� ��������� word
    _allocate_registers(function, &function->func_byte_regstat, x86op_byte);
    _allocate_registers(function, &function->func_word_regstat, x86op_word);
    _allocate_registers(function, &function->func_dword_regstat, x86op_dword);

    if (option_use_sse2) {
        _allocate_registers(function, &function->func_sse2_regstat, x86op_float);
    }

    // ��������� ��������� �������� EBX/ESI/EDI.
    _stack_handling(function, x86op_dword);

    // ������� �������� ����� ����������������.
    _remove_pseudo_instructions(function);
}

