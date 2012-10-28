
#include "common.h"
#include "x86_bincode.h"
#include "x86_opt_data_flow_inc.h"
#include "x86_regalloc.h"


// ����� ��������� � ��������� �������� ����� ���������� ������ � �������.
static basic_blocks_vector  _basic_blocks;

// ����� ��������� � ������ ��������� ����� ����� ������-���������.
static set_vector           _alivereg_in;
static set_vector           _alivereg_out;

static set                  _alivereg_after_current_insn;
static set                  _alivereg_before_current_insn;

static int                  _current_block;
static x86_instruction *    _current_insn;


// ����� ��������� ����� ����� ���������� � �������.
static insn_vector          _definitions_table;

static set_vector           _reachingdef_in;
static set_vector           _reachingdef_out;


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
            prev_insn   = insn;
            insn        = insn->in_next;
            current_index++;
        } while (insn && !_is_leader(insn));

        // insn - ����� ����� ���� NULL.

        _basic_blocks.blocks_base[_basic_blocks.blocks_count].block_leader      = block_leader;
        _basic_blocks.blocks_base[_basic_blocks.blocks_count].block_length      = current_index - leader_index;
        _basic_blocks.blocks_base[_basic_blocks.blocks_count].block_last_insn   = prev_insn;
        _basic_blocks.blocks_count++;
        ASSERT(_basic_blocks.blocks_count <= estimated_count);
    }
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ������ ����� ���������. ������������ ��� ������������� ���������.
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//
// ��������� ��������� def ��� ������� �����,
// �.�. ��������� ���������������, ������� �������������� �� �� �������������.
static void _detect_alivereg_def(set *def, basic_block *block, function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int i, j, regs_cnt, reg;
    int regs[MAX_REGISTERS_PER_INSN];
    set used;

    ASSERT(def->set_count == function->func_pseudoregs_count[type]);
    set_clear_to_zeros(def);

    SET_ALLOCA(used, def->set_count);
    set_clear_to_zeros(&used);

    // �������� ��� ����������
    for (i = 0, insn = block->block_leader; i < block->block_length; i++, insn = insn->in_next) {
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
static void _detect_alivereg_use(set *use, basic_block *block, function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int i, j, regs_cnt, reg;
    int regs[MAX_REGISTERS_PER_INSN];
    set defined;

    ASSERT(use->set_count == function->func_pseudoregs_count[type]);
    set_clear_to_zeros(use);

    SET_ALLOCA(defined, use->set_count);
    set_clear_to_zeros(&defined);

    // �������� ��� ����������
    for (i = 0, insn = block->block_leader; i < block->block_length; i++, insn = insn->in_next) {
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
// �������� ������� 10.4.
static void _build_alivereg_inout(function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int changed, block, j, label;
    set use, def, new_in;

    setvec_resize(&_alivereg_in, _basic_blocks.blocks_count, function->func_pseudoregs_count[type]);
    setvec_resize(&_alivereg_out, _basic_blocks.blocks_count, function->func_pseudoregs_count[type]);

    SET_ALLOCA(use, function->func_pseudoregs_count[type]);
    SET_ALLOCA(def, function->func_pseudoregs_count[type]);
    SET_ALLOCA(new_in, function->func_pseudoregs_count[type]);

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

            _detect_alivereg_def(&def, &_basic_blocks.blocks_base[block], function, type);
            _detect_alivereg_use(&use, &_basic_blocks.blocks_base[block], function, type);

            set_assign(&new_in, &_alivereg_out.vec_base[block]);
            set_subtract(&new_in, &def);
            set_unite(&new_in, &use);

            changed |= !set_equal(&_alivereg_in.vec_base[block], &new_in);
            set_assign(&_alivereg_in.vec_base[block], &new_in);
        }
    } while (changed);
}

//
// ������������� ������� ��� ������ ����������.
static void _recalc_alivereg_tables(function_desc *function, x86_operand_type type)
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
// ������ ����������� �����������.
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//
// ������ ������� ����������� � ������ ������� (�.�. ������ �������������� ����������).
static void _build_reachingdef_table(function_desc *function, x86_operand_type type)
{
    int max_count = unit_get_instruction_count(function);
    int count = 0, block = 0;
    x86_instruction *insn;

    // �������� ������ ��� ����� ���������� � �������
    _definitions_table.insn_base = allocator_alloc(allocator_per_function_pool, max_count * sizeof(x86_instruction *));
    _basic_blocks.blocks_base[block].block_first_def = 0;

    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        // ��������� ��� ������� ����� ������ � ���������� ����������� � ��
        if (insn != function->func_binary_code && _is_leader(insn)) {
            _basic_blocks.blocks_base[block].block_last_def = count;
            block++;
            _basic_blocks.blocks_base[block].block_first_def = count;
        }

        // ��������� ��������� ����������� � �������
        if (IS_VOLATILE_INSN(insn->in_code, type) && OP_IS_TYPED_REGISTER(insn->in_op1, type)) {
            _definitions_table.insn_base[count++] = insn;
        }
    }

    ASSERT(count <= max_count);
    _basic_blocks.blocks_base[block].block_last_def = count;
    _definitions_table.insn_count = count;
}

//
// ��������� ��������� gen ��� ������� ����� � ������ ����������� �����������,
// �.�. ��������� �����������, ����������� � ������ �����, ����������� � �������������.
// "�� �����, ����� ����������� d ���������� � gen[S], ���� d ��������� ����� S,
// ���������� �� ����, ��������� �� ��� ������ S ��� ���."
static void _detect_reachingdef_gen(set *gen, function_desc *function, basic_block *block, x86_operand_type type)
{
    int *reg_definitions_table = alloca(sizeof(int)*function->func_pseudoregs_count[type]);
    x86_instruction *insn;
    int def, reg;

    ASSERT(gen->set_count == _definitions_table.insn_count);
    set_clear_to_zeros(gen);
    memset(reg_definitions_table, -1, sizeof(int)*function->func_pseudoregs_count[type]);

    // ������� ��� ������� �������� ��������� ����������� �����������, ������������ � ����.
    for (def = block->block_first_def; def < block->block_last_def; def++) {
        insn = _definitions_table.insn_base[def];
        //ASSERT(IS_VOLATILE_INSN(insn->in_code, type) && OP_IS_TYPED_REGISTER(insn->in_op1, type));

        if (IS_DEFINING_INSN(insn->in_code, type)) {
            reg_definitions_table[insn->in_op1.data.reg] = def;
        }
    }

    // ������ ��������� ����������� ����������� ��� ������� �������� � ��������� gen.
    for (reg = 0; reg < function->func_pseudoregs_count[type]; reg++) {
        def = reg_definitions_table[reg];

        if (def != -1) {
            BIT_RAISE(*gen, def);

            // � ����� ������ ��� ������������� �����������, ��������� ����� ������� � �� ����� �������� �����.
            for (; def != block->block_last_def; def++) {
                insn = _definitions_table.insn_base[def];

                if (IS_VOLATILE_INSN(insn->in_code, type) && OP_IS_THIS_PSEUDO_REG(insn->in_op1, type, reg)) {
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
static void _detect_reachingdef_kill(set *kill, function_desc *function, basic_block *block, x86_operand_type type)
{
    int *reg_definitions_table = alloca(sizeof(int)*function->func_pseudoregs_count[type]);
    x86_instruction *insn;
    int def, reg;

    ASSERT(kill->set_count == _definitions_table.insn_count);
    set_clear_to_zeros(kill);
    memset(reg_definitions_table, -1, sizeof(int)*function->func_pseudoregs_count[type]);

    // ������� ��� ������� �������� ��������� ����������� �����������, ������������ � ����.
    for (def = block->block_first_def; def < block->block_last_def; def++) {
        insn = _definitions_table.insn_base[def];
        //ASSERT(IS_VOLATILE_INSN(insn->in_code, type) && OP_IS_TYPED_REGISTER(insn->in_op1, type));

        if (IS_DEFINING_INSN(insn->in_code, type)) {
            reg_definitions_table[insn->in_op1.data.reg] = def;
        }
    }

    // ��� ������� ��������: �� ��� ���� �������, ����� ������� �����, ������� ��� ����������� ������� ��������
    // (����������� � �������������), � ������ �� � ���������.
    for (reg = 0; reg < function->func_pseudoregs_count[type]; reg++) {
        for (def = 0; def < block->block_first_def; def++) {
            insn = _definitions_table.insn_base[def];

            if (insn->in_op1.data.reg == reg) {
                BIT_RAISE(*kill, def);
            }
        }

        for (def = block->block_last_def; def < _definitions_table.insn_count; def++) {
            insn = _definitions_table.insn_base[def];

            if (insn->in_op1.data.reg == reg) {
                BIT_RAISE(*kill, def);
            }
        }
    }
}

//
// ���������� ����������� �����������.
// ������ ��������� in/out ��� ������� ����� (�������� �� ������� 10.2).
static void _build_reachingdef_inout(function_desc *function, x86_operand_type type)
{
    int block, prev, start_label;
    BOOL change;
    x86_instruction *insn;
    set old_out, gen, kill;

    setvec_resize(&_reachingdef_in, _basic_blocks.blocks_count, _definitions_table.insn_count);
    setvec_resize(&_reachingdef_out, _basic_blocks.blocks_count, _definitions_table.insn_count);

    SET_ALLOCA(gen, _definitions_table.insn_count);
    SET_ALLOCA(kill, _definitions_table.insn_count);
    SET_ALLOCA(old_out, _definitions_table.insn_count);

    // �������������� ��� out[B] ��������������� gen[B].
    for (block = 0; block < _basic_blocks.blocks_count; block++) {
        // out[block] = gen[block]
        _detect_reachingdef_gen(&_reachingdef_out.vec_base[block], function, &_basic_blocks.blocks_base[block], type);
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
            _detect_reachingdef_kill(&kill, function, &_basic_blocks.blocks_base[block], type);
            set_subtract(&_reachingdef_out.vec_base[block], &kill);

            // out[block] = +gen[block]
            _detect_reachingdef_gen(&gen, function, &_basic_blocks.blocks_base[block], type);
            set_unite(&_reachingdef_out.vec_base[block], &gen);

            change |= !set_equal(&_reachingdef_out.vec_base[block], &old_out);
        }
    } while (change);
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ������� ����������.
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//
// ������������� ���� ������ ��� ����� �������.
void x86_dataflow_prepare_function(function_desc *function, x86_operand_type type)
{
    // �������������� ��������� ��� ������� ����� ���������.
    _detect_basic_blocks(function);
    _build_alivereg_inout(function, type);

    set_alloc(&_alivereg_after_current_insn, function->func_pseudoregs_count[type]);
    set_alloc(&_alivereg_before_current_insn, function->func_pseudoregs_count[type]);

    _current_block  = -1;
    _current_insn   = NULL;


    // �������������� ��������� ��� ������� ����������� �����������.
    _build_reachingdef_table(function, type);
    _build_reachingdef_inout(function, type);
}

//
// ������������� ������� ��� ������ ����������.
// ����� ������������� �� ��������� ���������� �����.
void x86_dataflow_step_insn_forward(function_desc *function, x86_operand_type type, x86_instruction *pos)
{
    while (_current_insn != pos) {
        _current_insn = (_current_insn ? _current_insn->in_next : function->func_binary_code);

        if (_current_block+1 < _basic_blocks.blocks_count &&
            _current_insn == _basic_blocks.blocks_base[_current_block+1].block_leader) {
                _current_block++;
            }
    }

    _recalc_alivereg_tables(function, type);
}

//
// ������������� ������� ��� ������ ����������.
// ����� ������������� �� ��������� ���������� �����.
void x86_dataflow_step_insn_backward(function_desc *function, x86_operand_type type, x86_instruction *pos)
{
    while (_current_insn != pos) {
        _current_insn = _current_insn->in_prev;

        if (_current_block > 0 && _current_insn == _basic_blocks.blocks_base[_current_block-1].block_last_insn) {
            _current_block--;
        }
    }

    _recalc_alivereg_tables(function, type);
}

//
// ���������, ����� �� ���������� ������� ����� ���� ����������.
int x86_dataflow_is_pseudoreg_alive_after(function_desc *function, int pseudoreg)
{
    return BIT_TEST(_alivereg_after_current_insn, pseudoreg);
}

//
// ���������, ����� �� ���������� ������� ����� ���� �����������.
int x86_dataflow_is_pseudoreg_alive_before(function_desc *function, int pseudoreg)
{
    return BIT_TEST(_alivereg_before_current_insn, pseudoreg);
}


//void x86_dataflow_detect_cycle_invariants(function_desc *function, x86_operand_type type)
//{
//}

