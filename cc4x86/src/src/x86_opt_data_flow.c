
#include "common.h"
#include "x86_bincode.h"
#include "x86_opt_data_flow_inc.h"


// Число элементов в следующих векторах равно количеству блоков в функции.
static basic_blocks_vector  _basic_blocks;

// Число элементов в каждом множестве равно числу псевдо-регистров.
static set_vector           _reg_in[X86_REGISTER_TYPES_COUNT];
static set_vector           _reg_out[X86_REGISTER_TYPES_COUNT];

static set                  _current_alive_registers;
static int                  _current_block;
static x86_instruction *    _current_insn;

/*
// Число элементов равно числу найденных определений:
static insn_vector          _definitions_table;
*/


static int _is_leader(x86_instruction *insn)
{
    return (insn->in_code == x86insn_label ||
        (insn->in_prev && (IS_JMP_INSN(insn->in_prev->in_code) || insn->in_prev->in_code == x86insn_ret)));
}

//
// Строит список базовых блоков для данной функции.
static void _detect_basic_blocks(function_desc *function)
{
    x86_instruction *insn, *block_leader, *prev_insn;
    int estimated_count = 1;
    int current_index = 0, leader_index = 0;

    // считаем верхнюю оценку для числа возможных блоков
    for (insn = function->func_binary_code; insn; insn = insn->in_next)
        estimated_count += _is_leader(insn);

    // выделяем память
    _basic_blocks.blocks_base = allocator_alloc(allocator_per_function_pool, estimated_count * sizeof(basic_block));
    _basic_blocks.blocks_count = 0;

    // строим список блоков
    for (insn = function->func_binary_code; insn; ) {
        block_leader    = insn;
        leader_index    = current_index;

        do {
            prev_insn   = insn;
            insn        = insn->in_next;
            current_index++;
        } while (insn && !_is_leader(insn));

        // insn - новый лидер либо NULL.

        ASSERT(_basic_blocks.blocks_count <= estimated_count);
        _basic_blocks.blocks_base[_basic_blocks.blocks_count].block_leader      = block_leader;
        _basic_blocks.blocks_base[_basic_blocks.blocks_count].block_length      = current_index - leader_index;
        _basic_blocks.blocks_base[_basic_blocks.blocks_count].block_last_insn   = prev_insn;
//        _basic_blocks.blocks_base[_basic_blocks.blocks_count].block_base_index  = leader_index;
        _basic_blocks.blocks_count++;
    }
}


//////////////////////////////////////////////////////////////////////////////////////////////////
//
//  Анализ активных псевдо-регистров. Используется для раскрашивания регистров.
//
//////////////////////////////////////////////////////////////////////////////////////////////////

//
// Вычисляет множество def для данного блока,
// т.е. множество псевдорегистров, которые переписываются до их использования.
static void _detect_def(set *def, basic_block *block, function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int i, j, regs_cnt, reg;
    int regs[MAX_REGISTERS_PER_INSN];
    set used;

    ASSERT(def->set_count == function->func_pseudoregs_count[type]);
    set_clear_to_zeros(def);

    SET_ALLOCA(used, def->set_count);
    set_clear_to_zeros(&used);

    // помечаем все инструкции
    for (i = 0, insn = block->block_leader; i < block->block_length; i++, insn = insn->in_next) {
        // извлекаем все переписываемые регистры
        bincode_extract_pseudoregs_overwritten_by_insn(insn, type, regs, &regs_cnt);

        for (j = 0; j < regs_cnt; j++) {
            reg = regs[j];
            ASSERT(reg < function->func_pseudoregs_count[type]);

            // если регистр не использовался ранее, вносим его во множество
            if (!BIT_TEST(used, reg)) {
                BIT_RAISE(*def, reg);
            }
        }

        // извлекаем все читаемые регистры
        bincode_extract_pseudoregs_read_by_insn(insn, type, regs, &regs_cnt);

        for (j = 0; j < regs_cnt; j++) {
            reg = regs[j];
            ASSERT(reg < function->func_pseudoregs_count[type]);

            // помечаем их как использованные
            BIT_RAISE(used, reg);
        }
    }
}

//
// Вычисляет множество use для данного блока,
// т.е. множество псевдорегистров, которые могут использоваться до их определения.
static void _detect_use(set *use, basic_block *block, function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int i, j, regs_cnt, reg;
    int regs[MAX_REGISTERS_PER_INSN];
    set defined;

    ASSERT(use->set_count == function->func_pseudoregs_count[type]);
    set_clear_to_zeros(use);

    SET_ALLOCA(defined, use->set_count);
    set_clear_to_zeros(&defined);

    // помечаем все инструкции
    for (i = 0, insn = block->block_leader; i < block->block_length; i++, insn = insn->in_next) {
        // извлекаем все читаемые регистры
        bincode_extract_pseudoregs_read_by_insn(insn, type, regs, &regs_cnt);

        for (j = 0; j < regs_cnt; j++) {
            reg = regs[j];
            ASSERT(reg < function->func_pseudoregs_count[type]);

            // если регистр не определён в данном блоке, вносим его во множество
            if (!BIT_TEST(defined, reg)) {
                BIT_RAISE(*use, reg);
            }
        }

        // извлекаем все переписываемые регистры
        bincode_extract_pseudoregs_overwritten_by_insn(insn, type, regs, &regs_cnt);

        for (j = 0; j < regs_cnt; j++) {
            reg = regs[j];
            ASSERT(reg < function->func_pseudoregs_count[type]);

            // помечаем их как определённые
            BIT_RAISE(defined, reg);
        }
    }
}

//
// Строит для каждого базового блока множества in/out в смысле живых регистров.
// Алгоритм Дракона 10.4.
static void _build_alive_pseudoreg_tables(function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int changed, block, j, label;
    set use, def, new_in;

    setvec_resize(&_reg_in[type], _basic_blocks.blocks_count, function->func_pseudoregs_count[type]);
    setvec_resize(&_reg_out[type], _basic_blocks.blocks_count, function->func_pseudoregs_count[type]);

    SET_ALLOCA(use, function->func_pseudoregs_count[type]);
    SET_ALLOCA(def, function->func_pseudoregs_count[type]);
    SET_ALLOCA(new_in, function->func_pseudoregs_count[type]);

    // Все блоки in делаем пустыми множествами.
    for (block = 0; block < _basic_blocks.blocks_count; block++)
        set_clear_to_zeros(&_reg_in[type].vec_base[block]);

    // Цикл, пока вносятся изменения хотя бы в один из блоков in.
    do {
        changed = FALSE;

        for (block = _basic_blocks.blocks_count-1; block >= 0; block--) {
            //
            // 1. out[B] = объединение всех in[последующих B].
            //

            set_clear_to_zeros(&_reg_out[type].vec_base[block]);
            insn = _basic_blocks.blocks_base[block].block_last_insn;

            if (insn->in_code != x86insn_ret && insn->in_code != x86insn_jmp) {
                ASSERT(insn->in_next);
                ASSERT(block+1 < _basic_blocks.blocks_count);
                ASSERT(_basic_blocks.blocks_base[block+1].block_leader == insn->in_next);

                set_unite(&_reg_out[type].vec_base[block], &_reg_in[type].vec_base[block+1]);
            }

            if (IS_JMP_INSN(insn->in_code)) {
                ASSERT(insn->in_op1.op_loc == x86loc_label);
                label = insn->in_op1.data.label;

                // Ищем метку, на которую делается переход (поиск insn по номеру метки).
                for (insn = function->func_binary_code; insn->in_code != x86insn_label || insn->in_op1.data.label != label;)
                    insn = insn->in_next;

                // Ищем соответствующий базовый блок.
                // FIXME: квадратичное время от количества базовых блоков
                for (j = 0; _basic_blocks.blocks_base[j].block_leader != insn; j++)
                    ASSERT(j < _basic_blocks.blocks_count);

                set_unite(&_reg_out[type].vec_base[block], &_reg_in[type].vec_base[j]);
            }


            //
            // 2. in[B] = use[B] + (out[B] - def[B])
            //

            _detect_def(&def, &_basic_blocks.blocks_base[block], function, type);
            _detect_use(&use, &_basic_blocks.blocks_base[block], function, type);

            set_assign(&new_in, &_reg_out[type].vec_base[block]);
            set_subtract(&new_in, &def);
            set_unite(&new_in, &use);

            changed |= !set_equal(&_reg_in[type].vec_base[block], &new_in);
            set_assign(&_reg_in[type].vec_base[block], &new_in);
        }
    } while (changed);
}


//
// Внешние интерфейсы.
// Инициализация всех таблиц для одной функции.
void x86_dataflow_prepare_function(function_desc *function, x86_operand_type type)
{
    _detect_basic_blocks(function);
    _build_alive_pseudoreg_tables(function, type);

    set_alloc(&_current_alive_registers, function->func_pseudoregs_count[type]);

    _current_block  = -1;
    _current_insn   = NULL;
}

//
// Пересчитывает _current_alive_registers для данной инструкции.
// Можно переместиться на несколько инструкций вперёд.
void x86_dataflow_step_insn_forward(function_desc *function, x86_operand_type type, int count)
{
    x86_instruction *insn;
    int j, regs_cnt, regs[MAX_REGISTERS_PER_INSN];

    for (j = 0; j < count; j++) {
        _current_insn = (_current_insn ? _current_insn->in_next : function->func_binary_code);

        if (_current_block+1 < _basic_blocks.blocks_count &&
            _current_insn == _basic_blocks.blocks_base[_current_block+1].block_leader) {
                _current_block++;
            }
    }

    // Обновляем таблицу _current_alive_registers (множество псевдорегистров, активных после этой инструкции).
    // FIXME: квадратичная сложность от числа инструкций в блоке.
    set_assign(&_current_alive_registers, &_reg_out[type].vec_base[_current_block]);

    for (insn = _basic_blocks.blocks_base[_current_block].block_last_insn; insn != _current_insn; insn = insn->in_prev) {
        // извлекаем все читаемые регистры
        bincode_extract_pseudoregs_read_by_insn(insn, type, regs, &regs_cnt);

        // добавляем каждый регистр во множество
        for (j = 0; j < regs_cnt; j++)
            BIT_RAISE(_current_alive_registers, regs[j]);
    }
}

//
// Пересчитывает _current_alive_registers для данной инструкции.
// Можно переместиться на несколько инструкций назад.
void x86_dataflow_step_insn_backward(function_desc *function, x86_operand_type type, int count)
{
    int j, regs_cnt, regs[MAX_REGISTERS_PER_INSN];

    for (j = 0; j < count; j++) {
        _current_insn = _current_insn->in_prev;
    }

    if (_current_block > _basic_blocks.blocks_count &&
        _current_insn->in_next == _basic_blocks.blocks_base[_current_block].block_leader) {
            _current_block--;
        }

    // Обновляем таблицу _current_alive_registers (множество псевдорегистров, активных после этой инструкции).
    if (_current_insn == _basic_blocks.blocks_base[_current_block].block_last_insn) {
        set_assign(&_current_alive_registers, &_reg_out[type].vec_base[_current_block]);
    } else {
        // извлекаем все читаемые регистры
        bincode_extract_pseudoregs_read_by_insn(_current_insn, type, regs, &regs_cnt);

        // добавляем каждый регистр во множество
        for (j = 0; j < regs_cnt; j++)
            BIT_RAISE(_current_alive_registers, regs[j]);
    }
}

//
// Проверяет, можно ли освободить регистр после этой инструкции.
int x86_dataflow_is_pseudoreg_alive_after(function_desc *function, int pseudoreg)
{
    return BIT_TEST(_current_alive_registers, pseudoreg);
}


/*

//
// Строит таблицу определений в данной функции (т.е. массив модифицирующих инструкций).
static void _build_definitions_list(function_desc *function)
{
    int max_count   = unit_get_instruction_count(function);
    int count       = 0;
    x86_instruction *insn;

    // выделяем память с запасом - под полное число инструкций в функции
    _definitions_table.insn_base =
        allocator_alloc(allocator_per_function_pool, max_count * sizeof(x86_instruction *));

    // отбираем модифицирующие инструкции (определения в терминах Дракона)
    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        if (IS_MODIFYING_INSN(insn->in_code) && OP_IS_REGISTER(insn->in_op1)) {
            _definitions_table.insn_base[count++] = insn;
        }
    }

    _definitions_table.insn_count = count;
}


//
// Вычисляет множество gen для данного блока,
// т.е. множество определений, добавленных в данном блоке, однозначных и неоднозначных.
static void _detect_gen(set *gen, function_desc *function, basic_block *block)
{
    x86_instruction *insn;
    int i = block->block_base_index;

    ASSERT(gen->set_count == _definitions_table.insn_count);

    // проходим по всем определениям внутри данного блока и помечаем их
    for (insn = block->block_leader; insn != block->block_last_insn->in_next; insn = insn->in_next) {
        if (IS_MODIFYING_INSN(insn->in_code) && OP_IS_REGISTER(insn->in_op1)) {
            ASSERT(_definitions_table.insn_base[i] == insn);

            gen->set_base[i/32] |= (1 << (i%32));
            i++;
        }
    }
}

//
// Вычисляет множество kill для данного блока,
// т.е. множество определений, результат которых полностью переписан.
static void detect_kill(set *kill, function_desc *function, basic_block *block)
{
    x86_instruction *insn;
    int i;
    unsigned *dword_regs = alloca(function->func_dword_regstat.count / 32 * sizeof(unsigned));
    unsigned *float_regs = alloca(function->func_sse_regstat.count / 32 * sizeof(unsigned));

    ASSERT(kill->set_count == _definitions_table.insn_count);

    // создаём битовую карту модифицированных регистров
    for (insn = block->block_leader; insn != block->block_last_insn->in_next; insn = insn->in_next) {
        if (IS_DWORD_DEFINING_INSN(insn->in_code) || IS_FLOAT_DEFINING_INSN(insn->in_code)) {
            if (OP_IS_REGISTER(insn->in_op1)) {
                ASSERT(OP_IS_DWORD(insn->in_op1) || OP_IS_FLOAT(insn->in_op2));

                if (OP_IS_DWORD(insn->in_op1)) {
                    dword_regs[insn->in_op1.data.reg/32] |= (1 << (insn->in_op1.data.reg%32));
                } else {
                    float_regs[insn->in_op1.data.reg/32] |= (1 << (insn->in_op1.data.reg%32));
                }
            }
        }
    }

    // проходим по всем определениям и помечаем переопределённые
    for (i = 0; i < _definitions_table.insn_count; i++) {
        insn = _definitions_table.insn_base[i];
        ASSERT(IS_MODIFYING_INSN(insn->in_code) && OP_IS_REGISTER(insn->in_op1));

        if (OP_IS_DWORD(insn->in_op1)) {
            if (dword_regs[insn->in_op1.data.reg/32] & (1 << (insn->in_op1.data.reg%32))) {
                kill->set_base[i/32] |= (1 << (i%32));
            }
        } else {
            if (float_regs[insn->in_op1.data.reg/32] & (1 << (insn->in_op1.data.reg%32))) {
                kill->set_base[i/32] |= (1 << (i%32));
            }
        }
    }
}

//
// Нахождение достигающих определений.
// Строит множества in/out для каждого блока (алгоритм из Дракона 10.2).
static void detect_reaching_definitions(function_desc *function)
{
    int block, prev, start_label;
    BOOL change;
    x86_instruction *insn;
    set old_out, gen, kill;

    for (block = 0; block < _basic_blocks.blocks_count; block++) {
        // out[block] = gen[block]
        detect_gen(&_out.vec_base[block], function, &_basic_blocks.blocks_base[block]);
    }

    do {
        change = FALSE;

        // цикл по всем блокам
        for (block = 0; block < _basic_blocks.blocks_count; block++) {
            set_clear(&_in.vec_base[block]);

            // если блок начинается с метки
            if (_basic_blocks.blocks_base[prev].block_leader->in_code == x86insn_label) {
                start_label = _basic_blocks.blocks_base[prev].block_leader->in_op1.data.label;

                // цикл по всем блокам, ищем jump на данную метку
                for (prev = 0; prev < _basic_blocks.blocks_count; prev++) {
                    insn = _basic_blocks.blocks_base[prev].block_last_insn;

                    if (IS_JMP_INSN(insn->in_code) && insn->in_op1.data.label == start_label) {
                        // in[block] += out[prev]
                        set_unite(&_in.vec_base[block], &_out.vec_base[prev]);
                    }
                }

            }

            // цикл по всем блокам, ищем непосредственно предыдущий блок
            for (prev = 0; prev < _basic_blocks.blocks_count; prev++) {
                insn = _basic_blocks.blocks_base[prev].block_last_insn;

                if (insn->in_code != x86insn_jmp && // FIXME: IS_JMP_INSN???
                    insn->in_next == _basic_blocks.blocks_base[block].block_leader) {
                    // in[block] += out[prev]
                    set_unite(&_in.vec_base[block], &_out.vec_base[prev]);
                    break;
                }
            }

            ASSERT(prev < _basic_blocks.blocks_count);

            // old_out = out[block]
            set_swap(&old_out, &_out.vec_base[block]);

            // out[block] = in[block]
            set_assign(&_out.vec_base[block], &_in.vec_base[block]);

            // out[block] -= kill[block]
            detect_kill(&kill, function, &_basic_blocks.blocks_base[block]);
            set_subtract(&_out.vec_base[block], &kill);

            // out[block] = +gen[block]
            detect_gen(&gen, function, &_basic_blocks.blocks_base[block]);
            // out[block] += in[block] FIXME???
            set_unite(&_out.vec_base[block], &gen);


            change |= set_equal(&_out.vec_base[block], &old_out);
        }
    } while (change);
}

void x86_dataflow_detect_cycle_invariants(function_desc *function, x86_operand_type type)
{
}
*/

