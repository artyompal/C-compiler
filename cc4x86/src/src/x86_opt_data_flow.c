
#include "common.h"
#include "x86_bincode.h"
#include "x86_opt_data_flow.h"
#include "x86_opt_data_flow_inc.h"
#include "x86_regalloc.h"
#include "x86_optimizer.h"


// ����� ������.
static basic_blocks_vector  _basic_blocks;                  // ����� ��������� ����� ���������� ������ � �������


// ������� ����� ���������.
static set_vector           _alivereg_in;                   // ����� �������� ����� ���������� ������ � �������;
static set_vector           _alivereg_out;                  // ����� ��������� � ������ ��������� ����� ����� ���������������

static set                  _alivereg_after_current_insn;   // ����� ��������� � ������ ��������� ����� ����� ���������������
static set                  _alivereg_before_current_insn;  // ����� ��������� � ������ ��������� ����� ����� ���������������

static int                  _current_block;
static x86_instruction *    _current_insn;


// ������� ����������� �����������.
static insn_vector          _definitions_table;             // ����� ��������� ����� ����� ���������� � �������

static set_vector           _reachingdef_in;                // ����� �������� ����� ���������� ������ � �������;
static set_vector           _reachingdef_out;               // ����� ��������� � ������ ��������� ����� ����� ���������������


// ������� ������������� �������������.
static insn_vector          _exposeduse_table;              // ����� ��������� ����� ����� ��������� ������������� �������������
static int_vector           _exposeduse_reg2idx;            // ����� ��������� � ������ ��������� ����� ����� ���������������+1

static set_vector           _exposeduses_in;                // ����� �������� ����� ���������� ������ � �������;
static set_vector           _exposeduses_out;               // ����� ��������� ����� ����� ��������� ������������� �������������

// ������� ������������ ���������� �����������.
static insn_vector          _redundantcopies_table;         // ����� ��������� ����� ����� �������� ���������� �����������
static set_vector           _redundantcopies_in;            // ����� �������� ����� ���������� ������ � �������;
static set_vector           _redundantcopies_out;           // ����� ��������� ����� ����� ��������� ���������� �����������



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ����� ������� ��������� �������� ������.
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

static int _is_leader(x86_instruction *insn)
{
    return (insn->in_code == x86insn_label ||
        (insn->in_prev && (IS_JMP_INSN(insn->in_prev->in_code) || insn->in_prev->in_code == x86insn_ret)));
}

//
// ������ ������ ������� ������ ��� ������ �������.
static void _detect_basic_blocks(function_desc *function)
{
    x86_instruction *insn, *block_leader, *prev_insn;
    int estimated_count = 1;
    int current_index = 0, leader_index = 0;

    // ������� ������� ������ ��� ����� ��������� ������
    for (insn = function->func_binary_code->in_next; insn; insn = insn->in_next)
        estimated_count += _is_leader(insn);

    // �������� ������
    _basic_blocks.blocks_base = allocator_alloc(allocator_per_function_pool, estimated_count * sizeof(basic_block));
    _basic_blocks.blocks_count = 0;

    // ������ ������ ������
    for (insn = function->func_binary_code; insn; ) {
        block_leader    = insn;
        leader_index    = current_index;

        do {
            insn->in_block  = &_basic_blocks.blocks_base[_basic_blocks.blocks_count];
            prev_insn       = insn;
            insn            = insn->in_next;

            current_index++;
        } while (insn && !_is_leader(insn));

        // insn - ����� ����� ���� NULL
        _basic_blocks.blocks_base[_basic_blocks.blocks_count].block_leader      = block_leader;
        _basic_blocks.blocks_base[_basic_blocks.blocks_count].block_length      = current_index - leader_index;
        _basic_blocks.blocks_base[_basic_blocks.blocks_count].block_last_insn   = prev_insn;
        _basic_blocks.blocks_count++;
        ASSERT(_basic_blocks.blocks_count <= estimated_count);
    }
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ������ ����� ���������. ������������ ����������� ���������.
//
// �������� x ���������� ����� � ����� p, ���� ��� �������� � ����� p ����� ���� ������������ ����� ����������,
// ������������� � p ���� ����� ������. ����� �� �������� dead.
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//
// ��������� ��������� def ��� ������� �����,
// �.�. ��������� ���������������, ������� �������������� �� �� �������������.
static void _alivereg_build_def(set *def, basic_block *block, function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int j, regs_cnt, reg, regs[MAX_REGISTERS_PER_INSN];
    set used;

    ASSERT(def->set_count == function->func_pseudoregs_count[type]);
    set_clear_to_zeros(def);

    SET_ALLOCA(used, def->set_count);
    set_clear_to_zeros(&used);

    // �������� ��� ����������
    for (insn = block->block_leader; insn != block->block_last_insn->in_next; insn = insn->in_next) {
        // ��������� ��� �������������� ��������
        bincode_extract_pseudoregs_overwritten_by_insn(insn, type, regs, &regs_cnt);

        for (j = 0; j < regs_cnt; j++) {
            reg = regs[j];
            ASSERT(reg < function->func_pseudoregs_count[type]);

            // ���� ������� �� ������������� �����, ������ ��� �� ���������
            if (!BIT_TEST(used, reg)) {
                BIT_RAISE(*def, reg);
            }
        }

        // ��������� ��� �������� ��������
        bincode_extract_pseudoregs_read_by_insn(insn, type, regs, &regs_cnt);

        for (j = 0; j < regs_cnt; j++) {
            reg = regs[j];
            ASSERT(reg < function->func_pseudoregs_count[type]);

            // �������� �� ��� ��������������
            BIT_RAISE(used, reg);
        }
    }
}

//
// ��������� ��������� use ��� ������� �����,
// �.�. ��������� ���������������, ������� ����� �������������� �� �� �����������.
static void _alivereg_build_use(set *use, basic_block *block, function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int j, regs_cnt, reg, regs[MAX_REGISTERS_PER_INSN];
    set defined;

    ASSERT(use->set_count == function->func_pseudoregs_count[type]);
    set_clear_to_zeros(use);

    SET_ALLOCA(defined, use->set_count);
    set_clear_to_zeros(&defined);

    // �������� ��� ����������
    for (insn = block->block_leader; insn != block->block_last_insn->in_next; insn = insn->in_next) {
        // ��������� ��� �������� ��������
        bincode_extract_pseudoregs_read_by_insn(insn, type, regs, &regs_cnt);

        for (j = 0; j < regs_cnt; j++) {
            reg = regs[j];
            ASSERT(reg < function->func_pseudoregs_count[type]);

            // ���� ������� �� �������� � ������ �����, ������ ��� �� ���������
            if (!BIT_TEST(defined, reg)) {
                BIT_RAISE(*use, reg);
            }
        }

        // ��������� ��� �������������� ��������
        bincode_extract_pseudoregs_overwritten_by_insn(insn, type, regs, &regs_cnt);

        for (j = 0; j < regs_cnt; j++) {
            reg = regs[j];
            ASSERT(reg < function->func_pseudoregs_count[type]);

            // �������� �� ��� �����������
            BIT_RAISE(defined, reg);
        }
    }
}

//
// ������ ��� ������� �������� ����� ��������� in/out � ������ ����� ���������.
// ������, �������� 10.4.
static void _alivereg_build_inout(function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int changed, block, j, label;
    set tmp, old_in;

    setvec_resize(&_alivereg_in, _basic_blocks.blocks_count, function->func_pseudoregs_count[type]);
    setvec_resize(&_alivereg_out, _basic_blocks.blocks_count, function->func_pseudoregs_count[type]);

    SET_ALLOCA(tmp, function->func_pseudoregs_count[type]);
    SET_ALLOCA(old_in, function->func_pseudoregs_count[type]);

    // ��� in ������ ������� �����������.
    for (block = 0; block < _basic_blocks.blocks_count; block++)
        set_clear_to_zeros(&_alivereg_in.vec_base[block]);

    // ����, ���� �������� ��������� ���� �� � ���� �� ������ in.
    do {
        changed = FALSE;

        for (block = _basic_blocks.blocks_count-1; block >= 0; block--) {
            //
            // 1. out[B] = ����������� ���� in[����������� B].
            //

            set_clear_to_zeros(&_alivereg_out.vec_base[block]);
            insn = _basic_blocks.blocks_base[block].block_last_insn;

            if (insn->in_code != x86insn_ret && insn->in_code != x86insn_jmp) {
                ASSERT(insn->in_next);
                ASSERT(block+1 < _basic_blocks.blocks_count);
                ASSERT(_basic_blocks.blocks_base[block+1].block_leader == insn->in_next);

                set_unite(&_alivereg_out.vec_base[block], &_alivereg_in.vec_base[block+1]);
            }

            if (IS_JMP_INSN(insn->in_code)) {
                ASSERT(insn->in_op1.op_loc == x86loc_label);
                label = insn->in_op1.data.label;

                // ���� ������� ����, �� ������ ���������� �������� �������� �������.
                for (j = 0; ; j++) {
                    ASSERT(j < _basic_blocks.blocks_count);

                    if (_basic_blocks.blocks_base[j].block_leader->in_code == x86insn_label &&
                        _basic_blocks.blocks_base[j].block_leader->in_op1.data.label == label) {
                            break;
                        }
                }

                set_unite(&_alivereg_out.vec_base[block], &_alivereg_in.vec_base[j]);
            }


            //
            // 2. in[B] = use[B] + (out[B] - def[B])
            //
            set_swap(&old_in, &_alivereg_in.vec_base[block]);
            set_assign(&_alivereg_in.vec_base[block], &_alivereg_out.vec_base[block]);

            _alivereg_build_def(&tmp, &_basic_blocks.blocks_base[block], function, type);
            set_subtract(&_alivereg_in.vec_base[block], &tmp);

            _alivereg_build_use(&tmp, &_basic_blocks.blocks_base[block], function, type);
            set_unite(&_alivereg_in.vec_base[block], &tmp);

            changed |= !set_equal(&_alivereg_in.vec_base[block], &old_in);
        }
    } while (changed);
}

//
// ������������� ������� ��� ������ ����������.
static void _alivereg_update_tables(x86_operand_type type)
{
    x86_instruction *insn;
    int j, regs_cnt, regs[MAX_REGISTERS_PER_INSN];

    // ��������� ������� _alivereg_after_current_insn (��������� ���������������, �������� ����� ���� ����������).
    set_assign(&_alivereg_after_current_insn, &_alivereg_out.vec_base[_current_block]);

    for (insn = _basic_blocks.blocks_base[_current_block].block_last_insn; insn != _current_insn; insn = insn->in_prev) {
		ASSERT(insn);

        // ��������� ��� �������������� ��������
        bincode_extract_pseudoregs_overwritten_by_insn(insn, type, regs, &regs_cnt);

        // �������� ��� ��� �������� �� ���������
        for (j = 0; j < regs_cnt; j++)
            BIT_CLEAR(_alivereg_after_current_insn, regs[j]);

        // ��������� ��� �������� ��������
        bincode_extract_pseudoregs_read_by_insn(insn, type, regs, &regs_cnt);

        // ��������� ������ ������� �� ���������
        for (j = 0; j < regs_cnt; j++)
            BIT_RAISE(_alivereg_after_current_insn, regs[j]);
    }

    // �������� ��������� "�����" � ��������� "��",
    // � ��������� ���������, �������� ������� �����������.
    set_assign(&_alivereg_before_current_insn, &_alivereg_after_current_insn);

    // ��������� ��� �������������� ��������
    bincode_extract_pseudoregs_overwritten_by_insn(_current_insn, type, regs, &regs_cnt);

    // �������� ��� ��� �������� �� ���������
    for (j = 0; j < regs_cnt; j++)
        BIT_CLEAR(_alivereg_before_current_insn, regs[j]);

    // ��������� ��� �������� ��������
    bincode_extract_pseudoregs_read_by_insn(_current_insn, type, regs, &regs_cnt);

    // ��������� ������ ������� �� ���������
    for (j = 0; j < regs_cnt; j++)
        BIT_RAISE(_alivereg_before_current_insn, regs[j]);
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ������������� �������������. ����������� ��� ����, ����� ����� ��� ������������� ������� �����������.
//
// �������������� ��������� ����������, ������� ������ �������� ��������.
// �������������� ��������� �� �� ���, ����� �������� � ������ ������� ����� ��� ���������������� ���������� ��� ����� ��������.
// ������������� ������������� �������� ���������������� �� ��������.
// � _exposeduse_reg2idx �������� ������ ������� ������������� ������� �������� � ���� �������.
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//
// ������ ������ �� ���� ������������� �������������.
static void _exposeduses_build_table(function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int approx_count, reg, j, regs_cnt, regs[MAX_REGISTERS_PER_INSN];


    // ������� ������������ ����� ���������.
    approx_count = function->func_insn_count * MAX_REGISTERS_PER_INSN;


    // �������� ������.
    _exposeduse_table.insn_base  = allocator_alloc(allocator_per_function_pool, sizeof(x86_instruction)*approx_count);
    _exposeduse_table.insn_count = 0;

    _exposeduse_reg2idx.int_base    = allocator_alloc(allocator_per_function_pool, sizeof(int)*(function->func_pseudoregs_count[type]+1));
    _exposeduse_reg2idx.int_count   = function->func_pseudoregs_count[type]+1;


    // �������� �� ���� ���������, � ��� ������� ������� ��� ������������ ��� ������������� � ������ �� � �������.
    for (reg = 1; reg < function->func_pseudoregs_count[type]; reg++) {
        _exposeduse_reg2idx.int_base[reg]   = _exposeduse_table.insn_count;

        for (insn = function->func_binary_code; insn; insn = insn->in_next) {
            bincode_extract_pseudoregs_read_by_insn(insn, type, regs, &regs_cnt);

            for (j = 0; j < regs_cnt; j++) {
                if (reg == regs[j]) {
                    _exposeduse_table.insn_base[_exposeduse_table.insn_count++] = insn;
                    ASSERT(_exposeduse_table.insn_count <= approx_count);
                }
            }
        }
    }

    // ���������� ������ ����� ������������� ��� ���������� ��������.
    _exposeduse_reg2idx.int_base[reg] = _exposeduse_table.insn_count;
}

//
// ��������� ��������� use ��� ������� ����� (��������� ������������� �������������),
// �.�. ��������� ��� (s,x) : s - ����������, ������������ ������� x, ������ �������������� ����������� x � ������ ����� ���.
static void _exposeduses_build_use(set *use, basic_block *block, function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int j, reg, idx, regs_cnt, regs[MAX_REGISTERS_PER_INSN];
    set defined_registers;

    ASSERT(use->set_count == _exposeduse_table.insn_count);
    set_clear_to_zeros(use);

    SET_ALLOCA(defined_registers, function->func_pseudoregs_count[type]);
    set_clear_to_zeros(&defined_registers);

    // �������� �� ���� ����������� ������� �����.
    for (insn = block->block_leader; insn != block->block_last_insn->in_next; insn = insn->in_next) {
        bincode_extract_pseudoregs_read_by_insn(insn, type, regs, &regs_cnt);

        for (j = 0; j < regs_cnt; j++) {
            reg = regs[j];

            if (!BIT_TEST(defined_registers, reg)) {
                // ������� ������ ���� ���������� � ������� _exposeduse_table.
                for (idx = _exposeduse_reg2idx.int_base[reg]; idx < _exposeduse_reg2idx.int_base[reg+1]; idx++) {
                    if (_exposeduse_table.insn_base[idx] == insn) {
                        BIT_RAISE(*use, idx);
                        break;
                    }
                }
            }
        }

        bincode_extract_pseudoregs_modified_by_insn(insn, type, regs, &regs_cnt);

        for (j = 0; j < regs_cnt; j++) {
            reg = regs[j];
            BIT_RAISE(defined_registers, reg);
        }
    }
}

//
// ��������� ��������� def ��� ������� �����,
// �.�. ��������� ��� (s,x) : s - ����������, ������������ ������� x, ������ s �� �� ������� �����,
// � x ������������ � ������ �����.
static void _exposeduses_build_def(set *def, basic_block *block, function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int *defined_registers, defined_registers_count = 0;
    int i, idx, reg, regs_cnt, regs[MAX_REGISTERS_PER_INSN];

    ASSERT(def->set_count == _exposeduse_table.insn_count);
    set_clear_to_zeros(def);

    defined_registers = allocator_alloc(allocator_per_function_pool, sizeof(int)*block->block_length*MAX_REGISTERS_PER_INSN);

    // ������� ��� ��������, ������� �������������� � ������ �����.
    for (insn = block->block_leader; insn != block->block_last_insn->in_next; insn = insn->in_next) {
        bincode_extract_pseudoregs_modified_by_insn(insn, type, regs, &regs_cnt);
        memcpy(defined_registers+defined_registers_count, regs, sizeof(int)*regs_cnt);
        defined_registers_count += regs_cnt;
    }

    // ��������� ������������� ��������.
    aux_sort_int(defined_registers, defined_registers_count);
    defined_registers_count = aux_unique_int(defined_registers, defined_registers_count);

    // �������� �� ���� ����������� �������, ����� ������� �����, � ������ �� ��������� ��, ������� ���������� �������� �� ������.
    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        if (insn == block->block_leader) {
            insn = block->block_last_insn;
            continue;
        }

        bincode_extract_pseudoregs_read_by_insn(insn, type, regs, &regs_cnt);

        for (i = 0; i < regs_cnt; i++) {
            reg = regs[i];

            if (aux_binary_search(defined_registers, defined_registers_count, reg) >= 0) {
                // ������� ������ ���� ���������� � ������� _exposeduse_table.
                for (idx = _exposeduse_reg2idx.int_base[reg]; _exposeduse_table.insn_base[idx] != insn; idx++) {
                    ASSERT(idx < _exposeduse_reg2idx.int_base[reg+1]);
                }

                BIT_RAISE(*def, idx);
            }
        }
    }

    allocator_free(allocator_per_function_pool, defined_registers, sizeof(int)*block->block_length*MAX_REGISTERS_PER_INSN);
}

//
// ������ ��� ������� �������� ����� ��������� in/out � ������ ��-�������.
// ������, �������� 10.4.
static void _exposeduses_build_inout(function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int changed, block, j, label;
    set tmp, old_in;

    setvec_resize(&_exposeduses_in, _basic_blocks.blocks_count, _exposeduse_table.insn_count);
    setvec_resize(&_exposeduses_out, _basic_blocks.blocks_count, _exposeduse_table.insn_count);

    SET_ALLOCA(tmp, _exposeduse_table.insn_count);
    SET_ALLOCA(old_in, _exposeduse_table.insn_count);

    // ��� in ������ ������� �����������.
    for (block = 0; block < _basic_blocks.blocks_count; block++)
        set_clear_to_zeros(&_exposeduses_in.vec_base[block]);

    // ����, ���� �������� ��������� ���� �� � ���� �� ������ in.
    do {
        changed = FALSE;

        for (block = _basic_blocks.blocks_count-1; block >= 0; block--) {
            //
            // 1. out[B] = ����������� ���� in[����������� B].
            //

            set_clear_to_zeros(&_exposeduses_out.vec_base[block]);
            insn = _basic_blocks.blocks_base[block].block_last_insn;

            if (insn->in_code != x86insn_ret && insn->in_code != x86insn_jmp) {
                ASSERT(insn->in_next);
                ASSERT(block+1 < _basic_blocks.blocks_count);
                ASSERT(_basic_blocks.blocks_base[block+1].block_leader == insn->in_next);

                set_unite(&_exposeduses_out.vec_base[block], &_exposeduses_in.vec_base[block+1]);
            }

            if (IS_JMP_INSN(insn->in_code)) {
                ASSERT(insn->in_op1.op_loc == x86loc_label);
                label = insn->in_op1.data.label;

                // ���� ������� ����, �� ������ ���������� �������� �������� �������.
                for (j = 0; ; j++) {
                    ASSERT(j < _basic_blocks.blocks_count);

                    if (_basic_blocks.blocks_base[j].block_leader->in_code == x86insn_label &&
                        _basic_blocks.blocks_base[j].block_leader->in_op1.data.label == label) {
                            break;
                        }
                }

                set_unite(&_exposeduses_out.vec_base[block], &_exposeduses_in.vec_base[j]);
            }


            //
            // 2. in[B] = use[B] + (out[B] - def[B])
            //
            set_swap(&old_in, &_exposeduses_in.vec_base[block]);
            set_assign(&_exposeduses_in.vec_base[block], &_exposeduses_out.vec_base[block]);

            _exposeduses_build_def(&tmp, &_basic_blocks.blocks_base[block], function, type);
            set_subtract(&_exposeduses_in.vec_base[block], &tmp);

            _exposeduses_build_use(&tmp, &_basic_blocks.blocks_base[block], function, type);
            set_unite(&_exposeduses_in.vec_base[block], &tmp);

            changed |= !set_equal(&_exposeduses_in.vec_base[block], &old_in);
        }
    } while (changed);
}

//
// ���������� ��� ������������� ������� ����������� � ������ ������� (��-������� ������� �����������).
//
// �������� � �������� ������� �� ����� ����� �� ������������� �����������.
// ���� ������ ����������� ���, �� ������� ������� �� ��������� out ���� ������������� � ������ �����.
// ���� ����������� ������ �����������, �� ������� ������� �� �������������, ����������� �����
// ��������������� ������������ � ��������� ������������.
//
static void _exposeduses_find_all_usages_of_definition(int reg, x86_instruction *def, x86_operand_type type,
                                                       x86_instruction **res_arr, int *res_count, int res_max_count)
{
    x86_instruction *test;
    int i, block;
    BOOL reached_def = FALSE;

    block = def->in_block - _basic_blocks.blocks_base;
    *res_count = 0;

    // ��������� ��� ������������� � �������� ������� �����
    for (test = def->in_next; test != def->in_block->block_last_insn->in_next; test = test->in_next) {
        if (bincode_is_pseudoreg_overwritten_by_insn(test, type, reg)) {
            reached_def = TRUE;
            break;
        } else if (bincode_is_pseudoreg_read_by_insn(test, type, reg)) {
            res_arr[*res_count] = test;
            ++*res_count;
            ASSERT(*res_count < res_max_count);
        }
    }

    if (!reached_def) {
        // ��������� ������������� �� ��������� out ������� �����
        for (i = _exposeduse_reg2idx.int_base[reg]; i < _exposeduse_reg2idx.int_base[reg + 1]; i++) {
            if (BIT_TEST(_exposeduses_out.vec_base[block], i)) {
                res_arr[*res_count] = _exposeduse_table.insn_base[i];
                ++*res_count;
                ASSERT(*res_count < res_max_count);
            }
        }
    }

    // ������������ ������������
    aux_sort_int((int*)res_arr, *res_count);
    *res_count = aux_unique_int((int*)res_arr, *res_count);
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ������ ����������� �����������. ����������� ��� ����, ����� ����� ��� �������������� ����������,
// �������� �� �������� �������� � ������ �����.
//
// �� ������� ������������� ����� ������������ ���������� (� ����������������, � ��������������).
// �� �������, ��� ����������� d ��������� ����� p, ���� ������� ���� �� �����, ��������������� ��������� �� d, � p,
// �����, ��� d �� ������������ ����� ����� ����.
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//
// ������ ������� ����������� � ������ ������� (�.�. ������ �������������� ����������).
static void _reachingdef_build_table(function_desc *function, x86_operand_type type)
{
    int max_count = function->func_insn_count;
    int count = 0, block = 0;
    x86_instruction *insn;

    // �������� ������ ��� ����� ���������� � �������
    _definitions_table.insn_base = allocator_alloc(allocator_per_function_pool, max_count * sizeof(x86_instruction *));
    _basic_blocks.blocks_base[block].block_first_def = 0;

    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        // ��������� ��� ������� ����� ������ � ���������� ����������� � ���
        if (insn != function->func_binary_code && _is_leader(insn)) {
            _basic_blocks.blocks_base[block].block_end_def = count;
            block++;
            _basic_blocks.blocks_base[block].block_first_def = count;
        }

        // ��������� ��������� ����������� � �������
        if (IS_VOLATILE_INSN(insn->in_code) && OP_IS_PSEUDO_REG(insn->in_op1, type)) {
            _definitions_table.insn_base[count++] = insn;
        }
    }

    ASSERT(count <= max_count);
    _basic_blocks.blocks_base[block].block_end_def = count;
    _definitions_table.insn_count = count;
}

//
// ��������� ��������� gen ��� ������� ����� � ������ ����������� �����������,
// �.�. ��������� �����������, ����������� � ������ �����, ����������� � �������������.
// "�� �����, ����� ����������� d ���������� � gen[S], ���� d ��������� ����� S,
// ���������� �� ����, ��������� �� ��� ������ S ��� ���."
static void _reachingdef_build_gen(set *gen, function_desc *function, basic_block *block, x86_operand_type type)
{
    int *reg_definitions_table = alloca(sizeof(int)*function->func_pseudoregs_count[type]);
    x86_instruction *insn;
    int def, reg, i, regs[MAX_REGISTERS_PER_INSN], regs_cnt;

    ASSERT(gen->set_count == _definitions_table.insn_count);
    set_clear_to_zeros(gen);
    memset(reg_definitions_table, -1, sizeof(int)*function->func_pseudoregs_count[type]);

    // ������� ��� ������� �������� ��������� ����������� �����������, ������������ � ����.
    for (def = block->block_first_def; def < block->block_end_def; def++) {
        insn = _definitions_table.insn_base[def];
        bincode_extract_pseudoregs_overwritten_by_insn(insn, type, regs, &regs_cnt);

        for (i = 0; i < regs_cnt; i++) {
            reg_definitions_table[regs[i]] = def;
        }
    }

    // ������ ��������� ����������� ����������� ��� ������� �������� � ��������� gen.
    for (reg = 0; reg < function->func_pseudoregs_count[type]; reg++) {
        def = reg_definitions_table[reg];

        if (def != -1) {
            BIT_RAISE(*gen, def);

            // � ����� ������ ��� ������������� �����������, ��������� ����� ������� � �� ����� �������� �����.
            for (; def != block->block_end_def; def++) {
                insn = _definitions_table.insn_base[def];

                if (bincode_is_pseudoreg_modified_by_insn(insn, type, reg)) {
                    BIT_RAISE(*gen, def);
                }
            }
        }
    }
}

//
// ��������� ��������� kill ��� ������� ����� � ������ ����������� �����������,
// �.�. ��������� ����������� �� ����� ���� �������, ��������� ������� ��������� ���������.
// "kill[S] ������������ ����� ��������� �����������, ������� ������� �� ��������� ����� S,
// ���� ���� ��������� ��� ������."
static void _reachingdef_build_kill(set *kill, function_desc *function, basic_block *block, x86_operand_type type)
{
    x86_instruction *insn;
    set modified_regs;
    int def, reg, i, regs[MAX_REGISTERS_PER_INSN], regs_cnt;

    ASSERT(kill->set_count == _definitions_table.insn_count);
    set_clear_to_zeros(kill);

    SET_ALLOCA(modified_regs, function->func_pseudoregs_count[type]);
    set_clear_to_zeros(&modified_regs);

    // ������� ��� ������� �������� ��������� �����������, ������������ � ����.
    for (def = block->block_first_def; def < block->block_end_def; def++) {
        insn = _definitions_table.insn_base[def];
        bincode_extract_pseudoregs_modified_by_insn(insn, type, regs, &regs_cnt);

        for (i = 0; i < regs_cnt; i++) {
            BIT_RAISE(modified_regs, regs[i]);
        }
    }

    // ��� ������� ����������� ��������: �� ��� ���� �������, ����� ������� �����,
    // ������� ��� ����������� ������� �������� � ������ �� � ���������.
    for (reg = 1; reg < function->func_pseudoregs_count[type]; reg++) {
        if (BIT_TEST(modified_regs, reg)) {
            for (def = 0; def < _definitions_table.insn_count; def++) {
                if (def == block->block_first_def) {
                    def = block->block_end_def - 1;
                    continue;
                }

                insn = _definitions_table.insn_base[def];
                bincode_extract_pseudoregs_modified_by_insn(insn, type, regs, &regs_cnt);

                for (i = 0; i < regs_cnt; i++) {
                    if (regs[i] == reg) {
                        BIT_RAISE(*kill, def);
                    }
                }
            }
        }
    }
}

//
// ���������� ����������� �����������.
// ������ ��������� in/out ��� ������� ����� (������, �������� 10.2).
static void _reachingdef_build_inout(function_desc *function, x86_operand_type type)
{
    int block, prev, start_label;
    BOOL change;
    x86_instruction *insn;
    set tmp, old_out;

    setvec_resize(&_reachingdef_in, _basic_blocks.blocks_count, _definitions_table.insn_count);
    setvec_resize(&_reachingdef_out, _basic_blocks.blocks_count, _definitions_table.insn_count);

    SET_ALLOCA(tmp, _definitions_table.insn_count);
    SET_ALLOCA(old_out, _definitions_table.insn_count);

    // �������������� ��� out[B] ��������������� gen[B].
    for (block = 0; block < _basic_blocks.blocks_count; block++) {
        // out[block] = gen[block]
        _reachingdef_build_gen(&_reachingdef_out.vec_base[block], function, &_basic_blocks.blocks_base[block], type);
    }

    do {
        change = FALSE;

        // ���� �� ���� ������
        for (block = _basic_blocks.blocks_count-1; block >= 0; block--) {
            set_clear_to_zeros(&_reachingdef_in.vec_base[block]);

            // ���� ���� ���������� � �����
            if (_basic_blocks.blocks_base[block].block_leader->in_code == x86insn_label) {
                start_label = _basic_blocks.blocks_base[block].block_leader->in_op1.data.label;

                // ���� �� ���� ������, ���� jump �� ������ �����
                for (prev = 0; prev < _basic_blocks.blocks_count; prev++) {
                    insn = _basic_blocks.blocks_base[prev].block_last_insn;

                    if (IS_JMP_INSN(insn->in_code) && insn->in_op1.data.label == start_label) {
                        // in[block] += out[prev]
                        set_unite(&_reachingdef_in.vec_base[block], &_reachingdef_out.vec_base[prev]);
                    }
                }
            }

            // ��������� ��������������� ���������� ����
            if (block > 0) {
                prev = block - 1;
                insn = _basic_blocks.blocks_base[prev].block_last_insn;
                ASSERT(insn->in_next == _basic_blocks.blocks_base[block].block_leader);

                if (insn->in_code != x86insn_jmp) {
                    // in[block] += out[prev]
                    set_unite(&_reachingdef_in.vec_base[block], &_reachingdef_out.vec_base[prev]);
                }
            }

            // old_out = out[block]
            set_swap(&old_out, &_reachingdef_out.vec_base[block]);

            // out[block] = in[block]
            set_assign(&_reachingdef_out.vec_base[block], &_reachingdef_in.vec_base[block]);

            // out[block] -= kill[block]
            _reachingdef_build_kill(&tmp, function, &_basic_blocks.blocks_base[block], type);
            set_subtract(&_reachingdef_out.vec_base[block], &tmp);

            // out[block] += gen[block]
            _reachingdef_build_gen(&tmp, function, &_basic_blocks.blocks_base[block], type);
            set_unite(&_reachingdef_out.vec_base[block], &tmp);

            change |= !set_equal(&_reachingdef_out.vec_base[block], &old_out);
        }
    } while (change);
}

//
// ������ ��-������� ��� ������ ���������� � ������� ��������,
// �� ���� ���������� ��� �����������, �������� �� �������� ������� �������� � ������ �����.
static void _reachingdef_find_all_definitions(int reg, x86_instruction *insn, x86_operand_type type,
                                             x86_instruction **res_arr, int *res_count, int res_max_count)
{
    basic_block *block = insn->in_block;
    x86_instruction *test;
    int def_idx;

    *res_count = 0;

    // �������� ��� ����������� ������ ������� ����� � �������� �������
    for (test = insn->in_prev; test != block->block_leader->in_prev; test = test->in_prev) {
        // ���� ������� ����������� �����������, �� �� ���� ����� �������������
        if (bincode_is_pseudoreg_overwritten_by_insn(test, type, reg)) {
            ASSERT(*res_count < res_max_count);
            res_arr[*res_count] = test;
            ++*res_count;
            return;
        }

        if (bincode_is_pseudoreg_modified_by_insn(test, type, reg)) {
            ASSERT(*res_count < res_max_count);
            res_arr[*res_count] = test;
            ++*res_count;
        }
    }

    // ���������� ��� ����������� �� ��������� in
    for (def_idx = 0; def_idx != _definitions_table.insn_count; def_idx++) {
        if (_definitions_table.insn_base[def_idx] && BIT_TEST(_reachingdef_in.vec_base[block-_basic_blocks.blocks_base], def_idx)) {
            if (bincode_is_pseudoreg_modified_by_insn(_definitions_table.insn_base[def_idx], type, reg)) {
                ASSERT(*res_count < res_max_count);
                res_arr[*res_count] = _definitions_table.insn_base[def_idx];
                ++*res_count;
            }
        }
    }

    // ������������ ������������
    aux_sort_int((int*)res_arr, *res_count);
    *res_count = aux_unique_int((int*)res_arr, *res_count);
}

//
// ���������, �������� �� ����������� def ��� ���������� insn
// (�������� �� ��������� ���������� insn � ��-������� ������� �����������).
static BOOL _reachingdef_is_definition_available(int reg, x86_instruction *def, x86_instruction *insn, x86_operand_type type)
{
    x86_instruction **def_arr = alloca(sizeof(void *) * _definitions_table.insn_count);
    int def_count;

    _reachingdef_find_all_definitions(reg, insn, type, def_arr, &def_count, _definitions_table.insn_count);
    return (aux_binary_search((int*)def_arr, def_count, (int)def) >= 0);
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ������ ���������� �����������. ����� ��� ����������� ��������������� �����������.
//
// ���������� ������������ � ������ ����� ���������� ���������� x = y, �����, ��� ������ ���� �� ���������� ����
// � ������ � ����� B �������� ��� ����������, � ����� ���������� ��������� ���� ���������� y �� ����������.
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//
// �������� ���������� �����������. ��� �������� ���������������� �� ��������� � �������.
static void _redundantcopies_build_table(function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int count = 0;

    // ���������� ������� ���� �����������
    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        if (IS_MOV_INSN(insn->in_code) && OP_IS_PSEUDO_REG(insn->in_op1, type) && OP_IS_PSEUDO_REG(insn->in_op2, type)) {
            count++;
        }
    }

    _redundantcopies_table.insn_base    = allocator_alloc(allocator_per_function_pool, count * sizeof(x86_instruction*));
    _redundantcopies_table.insn_count   = 0;

    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        if (IS_MOV_INSN(insn->in_code) && OP_IS_PSEUDO_REG(insn->in_op1, type) && OP_IS_PSEUDO_REG(insn->in_op2, type)) {
            _redundantcopies_table.insn_base[_redundantcopies_table.insn_count++] = insn;
        }
    }

    aux_sort_int((int*)_redundantcopies_table.insn_base, _redundantcopies_table.insn_count);
}

//
// "�� �������, ��� ���������� ����������� s: x = y ������������ � ����� B, ���� s ��������� � ����� B,
// � � �������� B ��� ������������ ������������ ���������� y."
static void _redundantcopies_build_gen(set *gen, function_desc *function, basic_block *block, x86_operand_type type)
{
    x86_instruction *insn;
    set modified_regs;
    int idx, i, regs[MAX_REGISTERS_PER_INSN], regs_cnt;

    SET_ALLOCA(modified_regs, function->func_pseudoregs_count[type]);
    set_clear_to_zeros(&modified_regs);

    ASSERT(gen->set_count == _redundantcopies_table.insn_count);
    set_clear_to_zeros(gen);

    for (insn = block->block_last_insn; insn != block->block_leader->in_prev; insn = insn->in_prev) {
        if (IS_MOV_INSN(insn->in_code) && OP_IS_PSEUDO_REG(insn->in_op1, type) && OP_IS_PSEUDO_REG(insn->in_op2, type)
            && !BIT_TEST(modified_regs, insn->in_op2.data.reg)) {
                idx = aux_binary_search((int*)_redundantcopies_table.insn_base, _redundantcopies_table.insn_count, (int)insn);
                ASSERT(idx >= 0);

                BIT_RAISE(*gen, idx);
            }

        bincode_extract_pseudoregs_modified_by_insn(insn, type, regs, &regs_cnt);

        for (i = 0; i < regs_cnt; i++) {
            BIT_RAISE(modified_regs, regs[i]);
        }
    }
}

//
// "�� �������, ��� s: x = y ������������ � ����� B, ���� s ��������� ��� �����, � � ����� ����������� ������������ x ��� y."
static void _redundantcopies_build_kill(set *kill, function_desc *function, basic_block *block, x86_operand_type type)
{
    x86_instruction *insn;
    set modified_regs;
    int idx, i, regs[MAX_REGISTERS_PER_INSN], regs_cnt;

    SET_ALLOCA(modified_regs, function->func_pseudoregs_count[type]);
    set_clear_to_zeros(&modified_regs);

    ASSERT(kill->set_count == _redundantcopies_table.insn_count);
    set_clear_to_zeros(kill);

    // �������� ��� ���������������� � ���� ����� ��������
    for (insn = block->block_leader; insn != block->block_last_insn->in_next; insn = insn->in_next) {
        bincode_extract_pseudoregs_modified_by_insn(insn, type, regs, &regs_cnt);

        for (i = 0; i < regs_cnt; i++) {
            BIT_RAISE(modified_regs, regs[i]);
        }
    }

    // �������� ��� ���������� ���� �������, ����� ����� �����
    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        if (insn == block->block_leader) {
            insn = block->block_last_insn;
            continue;
        }

        if (IS_MOV_INSN(insn->in_code) && OP_IS_PSEUDO_REG(insn->in_op1, type) && OP_IS_PSEUDO_REG(insn->in_op2, type)
            && (BIT_TEST(modified_regs, insn->in_op1.data.reg) || BIT_TEST(modified_regs, insn->in_op2.data.reg))) {
                idx = aux_binary_search((int*)_redundantcopies_table.insn_base, _redundantcopies_table.insn_count, (int)insn);
                ASSERT(idx >= 0);

                BIT_RAISE(*kill, idx);
        }
    }
}

//
// ������ ��������� in/out ��� ���������� ����������� (������, ��������� 10.12, �������� 10.3).
static void _redundantcopies_build_inout(function_desc *function, x86_operand_type type)
{
    int block, prev, start_label;
    BOOL change;
    x86_instruction *insn;
    set tmp, old_out;

    setvec_resize(&_redundantcopies_in, _basic_blocks.blocks_count, _redundantcopies_table.insn_count);
    setvec_resize(&_redundantcopies_out, _basic_blocks.blocks_count, _redundantcopies_table.insn_count);

    SET_ALLOCA(tmp, _redundantcopies_table.insn_count);
    SET_ALLOCA(old_out, _redundantcopies_table.insn_count);

    // in[B1] ���������������� ������ ����������.
    set_clear_to_zeros(&_redundantcopies_in.vec_base[0]);

    // out[B1] ���������������� gen[B1]
    _redundantcopies_build_gen(&_redundantcopies_out.vec_base[0], function, &_basic_blocks.blocks_base[0], type);

    // ��� ��������� out[B] ���������������� U - kill[B]
    for (block = 1; block < _basic_blocks.blocks_count; block++) {
        _redundantcopies_build_kill(&_redundantcopies_out.vec_base[block], function, &_basic_blocks.blocks_base[block], type);
        set_invert(&_redundantcopies_out.vec_base[block]);
    }

    do {
        change = FALSE;

        // ���� �� ���� ������
        for (block = _basic_blocks.blocks_count-1; block > 0; block--) {
            set_clear_to_ones(&_redundantcopies_in.vec_base[block]);

            // ���� ���� ���������� � �����
            if (_basic_blocks.blocks_base[block].block_leader->in_code == x86insn_label) {
                start_label = _basic_blocks.blocks_base[block].block_leader->in_op1.data.label;

                // ���� �� ���� ������, ���� jump �� ������ �����
                for (prev = 0; prev < _basic_blocks.blocks_count; prev++) {
                    insn = _basic_blocks.blocks_base[prev].block_last_insn;

                    if (IS_JMP_INSN(insn->in_code) && insn->in_op1.data.label == start_label) {
                        // in[block] *= out[prev]
                        set_intersect(&_redundantcopies_in.vec_base[block], &_redundantcopies_out.vec_base[prev]);
                    }
                }
            }

            // ��������� ��������������� ���������� ����
            if (block > 0) {
                prev = block - 1;
                insn = _basic_blocks.blocks_base[prev].block_last_insn;
                ASSERT(insn->in_next == _basic_blocks.blocks_base[block].block_leader);

                if (insn->in_code != x86insn_jmp) {
                    // in[block] *= out[prev]
                    set_intersect(&_redundantcopies_in.vec_base[block], &_redundantcopies_out.vec_base[prev]);
                }
            }

            // old_out = out[block]
            set_swap(&old_out, &_redundantcopies_out.vec_base[block]);

            // out[block] = in[block]
            set_assign(&_redundantcopies_out.vec_base[block], &_redundantcopies_in.vec_base[block]);

            // out[block] -= kill[block]
            _redundantcopies_build_kill(&tmp, function, &_basic_blocks.blocks_base[block], type);
            set_subtract(&_redundantcopies_out.vec_base[block], &tmp);

            // out[block] += gen[block]
            _redundantcopies_build_gen(&tmp, function, &_basic_blocks.blocks_base[block], type);
            set_unite(&_redundantcopies_out.vec_base[block], &tmp);

            change |= !set_equal(&_redundantcopies_out.vec_base[block], &old_out);
        }
    } while (change);
}

//
// ���� ���������� �� ��������� �� ��������� in ���������� �����.
// �������� �������� �������� ��-������� ��� ��������� �����������.
static BOOL _redundantcopies_is_insn_available(x86_instruction *insn, basic_block *block)
{
    int idx = aux_binary_search((int*)_redundantcopies_table.insn_base, _redundantcopies_table.insn_count, (int)insn);
    ASSERT(idx >= 0);

    return BIT_TEST(_redundantcopies_in.vec_base[block - _basic_blocks.blocks_base], idx);
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ������� ����������.
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//
// ������������� �������� ��� ������� ����� ���������.
void x86_dataflow_alivereg_init(function_desc *function, x86_operand_type type)
{
    _detect_basic_blocks(function);
    _alivereg_build_inout(function, type);

    set_alloc(&_alivereg_after_current_insn, function->func_pseudoregs_count[type]);
    set_alloc(&_alivereg_before_current_insn, function->func_pseudoregs_count[type]);

    _current_block  = -1;
    _current_insn   = NULL;
}

//
// ������������� ������� ��� ������ ����������.
void x86_dataflow_alivereg_seek(function_desc *function, x86_operand_type type, x86_instruction *insn)
{
    _current_block  = insn->in_block - _basic_blocks.blocks_base;
    _current_insn   = insn;

    _alivereg_update_tables(type);
}

//
// ���������, ����� �� ���������� ������� ����� ���� ����������.
int x86_dataflow_alivereg_test_after(int pseudoreg)
{
    return BIT_TEST(_alivereg_after_current_insn, pseudoreg);
}

//
// ���������, ����� �� ���������� ������� ����� ���� �����������.
int x86_dataflow_alivereg_test_before(int pseudoreg)
{
    return BIT_TEST(_alivereg_before_current_insn, pseudoreg);
}

//
// ������������� ��/��-�������.
void x86_dataflow_init_use_def_tables(function_desc *function, x86_operand_type type)
{
    _detect_basic_blocks(function);

    // ���������� ������� ����������� �����������
    _reachingdef_build_table(function, type);
    _reachingdef_build_inout(function, type);

    // ���������� ������� ������������� �������������
    _exposeduses_build_table(function, type);
    _exposeduses_build_inout(function, type);
}

//
// ������� ���������� �� ������� � ��� ���� ������.
void x86_dataflow_erase_instruction(function_desc *function, x86_instruction *insn)
{
    basic_block *block;
    int i;

    for (block = _basic_blocks.blocks_base; block < _basic_blocks.blocks_base + _basic_blocks.blocks_count; block++) {
        if (block->block_leader == insn) {
            block->block_leader = block->block_leader->in_next;
        }

        if (block->block_last_insn == insn) {
            ASSERT(!_is_leader(insn));
            block->block_last_insn = block->block_last_insn->in_prev;
        }
    }

    bincode_erase_instruction(function, insn);

    for (i = 0; i < _definitions_table.insn_count; i++) {
        if (_definitions_table.insn_base[i] == insn) {
            _definitions_table.insn_base[i] = NULL;
        }
    }

    for (i = 0; i < _exposeduse_table.insn_count; i++) {
        if (_exposeduse_table.insn_base[i] == insn) {
            _exposeduse_table.insn_base[i] = NULL;
        }
    }

    // �� �� ����� ������� ���������� �� _redundantcopies_table, ��� ��� ��� �������������,
    // � ������� � ��� ������ ���� � ��������� c_in[block].
}


//
// ������ ����������� ��������������� ����������� (������, �������� 10.6).
BOOL _optimize_redundant_copies(function_desc *function, x86_operand_type type)
{
    x86_instruction *mov, *usage, *next, *test, **usage_arr;
    int usage_count, i, j, x, y, regs_cnt, *regs[MAX_REGISTERS_PER_INSN];
    BOOL replace_allowed, changed = FALSE;

    x86_dataflow_init_use_def_tables(function, type);
    _redundantcopies_build_table(function, type);
    _redundantcopies_build_inout(function, type);

    usage_arr = allocator_alloc(allocator_per_function_pool, sizeof(void *) * function->func_insn_count);

    for (mov = function->func_binary_code; mov; mov = next) {
        next = mov->in_next;

        // ��� ������ ���������� �����������
        if (IS_MOV_INSN(mov->in_code) && OP_IS_PSEUDO_REG(mov->in_op1, type) && OP_IS_PSEUDO_REG(mov->in_op2, type)) {
            x               = mov->in_op1.data.reg;
            y               = mov->in_op2.data.reg;
            replace_allowed = TRUE;

            // ������� ��� ������������� x
            _exposeduses_find_all_usages_of_definition(x, mov, type, usage_arr, &usage_count, function->func_insn_count);

            for (i = 0; i < usage_count && replace_allowed; i++) {
                usage = usage_arr[i];
                if (!usage) {
                    continue;
                }

                // ��������� ������������ ����� ������������� ���� ����������� �����������
                if (!_reachingdef_is_definition_available(x, mov, usage, type)) {
                    continue;
                }

                // x ������ �������������� ������ � read-only ����������
                if (bincode_is_pseudoreg_modified_by_insn(usage, type, x)) {
                    replace_allowed = FALSE;
                    break;
                }

                // ��������� ��� ����� ������������� x, ������ �� mov � c_in[block]
                if (usage->in_block != mov->in_block && !_redundantcopies_is_insn_available(mov, usage->in_block)) {
                    replace_allowed = FALSE;
                    break;
                }

                // ���������, ��� ��� ��������� x ��� y � ������� ����� � �� �������������
                test = (usage->in_block == mov->in_block ? mov->in_next : usage->in_block->block_leader);

                for (; test != usage; test = test->in_next) {
                    // ���� �� �������� �����, ��������, ������� ����; �� ������������ ���� ������ � �������
                    if (test == usage->in_block->block_last_insn) {
                        replace_allowed = FALSE;
                        break;
                    }

                    // ���� x ��� y ����������, �������
                    if (bincode_is_pseudoreg_modified_by_insn(test, type, x) || bincode_is_pseudoreg_modified_by_insn(test, type, y)) {
                        replace_allowed = FALSE;
                        break;
                    }
                }
            }

            // ���� ��� �������� ����������� ������������, ������� ���������� � �������� ��� ��������� x �� y.
            if (replace_allowed) {
                for (i = 0; i < usage_count; i++) {
                    usage = usage_arr[i];
                    if (!usage) {
                        continue;
                    }

                    if (!_reachingdef_is_definition_available(x, mov, usage, type)) {
                        continue;
                    }

                    bincode_extract_pseudoregs_from_insn(usage, type, regs, &regs_cnt);

                    for (j = 0; j < regs_cnt; j++) {
                        if (*regs[j] == x) {
                            *regs[j] = y;
                        }
                    }
                }

                x86_dataflow_erase_instruction(function, mov);
                changed = TRUE;
            }
        }
    }

    allocator_free(allocator_per_function_pool, usage_arr, sizeof(void *) * function->func_insn_count);
    return changed;
}

//
// ������� ��������� ��� ������� ��������������� �����������.
BOOL x86_dataflow_optimize_redundant_copies(function_desc *function)
{
    BOOL changed = FALSE;

    changed |= _optimize_redundant_copies(function, x86op_dword);
    changed |= _optimize_redundant_copies(function, x86op_float);

    return changed;
}


//
// ���������, ����� �� ����������� �������, �.�. �������� �� ������ ����������
// ��������� �������������� ����������� ������� ��������.
static BOOL _is_last_usage(int reg, x86_instruction *insn, function_desc *function, x86_operand_type type)
{
    x86_instruction **def_arr   = alloca(sizeof(void *) * _definitions_table.insn_count);
    x86_instruction **usage_arr = alloca(sizeof(void *) * 2 * function->func_insn_count);
    int def_count, usage_count, def, total_count, current_count;
    x86_instruction *test;

    // ������� ��� �����������, ��������� ������ ����������
    _reachingdef_find_all_definitions(reg, insn, type, def_arr, &def_count, _definitions_table.insn_count);
    if (!def_count) {
        return FALSE;
    }

    // ���������� ������ ���������� ������������� ���� ���� �����������
    _exposeduses_find_all_usages_of_definition(reg, def_arr[0], type, usage_arr, &total_count, function->func_insn_count);
    aux_sort_int((int*)usage_arr, total_count);

    for (def = 1; def < def_count; def++) {
        _exposeduses_find_all_usages_of_definition(reg, def_arr[def], type, usage_arr+total_count, &usage_count, function->func_insn_count);
        total_count += usage_count;

        aux_sort_int((int*)usage_arr, total_count);
        total_count = aux_unique_int((int*)usage_arr, total_count);
    }

    // �������� �� ���� ����������� ������� � ������� �� ���������� � ������� ����� ����������� �����������
    for (current_count = 0, test = function->func_binary_code; ; test = test->in_next) {
        ASSERT(test);

        if (aux_binary_search((int*)usage_arr, total_count, (int)test) >= 0) {
            current_count++;
        }

        if (test == insn) {
            return (current_count == total_count);
        }
    }
}

void x86_dataflow_detect_registers_range(function_desc *function, x86_operand_type type)
{
    int *regs[MAX_REGISTERS_PER_INSN], regs_count;
    x86_instruction *insn;
    int i;

    x86_dataflow_init_use_def_tables(function, type);

    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        bincode_extract_pseudoregs_from_insn(insn, type, regs, &regs_count);
        insn->in_reg_usage_mask = 0;

        for (i = 0; i < regs_count; i++) {
            if (_is_last_usage(*regs[i], insn, function, type)) {
                insn->in_reg_usage_mask |= (1 << i);
            }
        }
    }
}

void x86_dataflow_find_all_usages_of_definition(int reg, x86_instruction *def, x86_operand_type type,
                                                x86_instruction **res_arr, int *res_count, int res_max_count)
{
    _exposeduses_find_all_usages_of_definition(reg, def, type, res_arr, res_count, res_max_count);
}

void x86_dataflow_find_all_definitions(int reg, x86_instruction *insn, x86_operand_type type,
                                           x86_instruction **res_arr, int *res_count, int res_max_count)
{
    _reachingdef_find_all_definitions(reg, insn, type, res_arr, res_count, res_max_count);
}

