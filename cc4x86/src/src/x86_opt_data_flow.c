
#include "common.h"
#include "x86_bincode.h"
#include "x86_opt_data_flow.h"
#include "x86_opt_data_flow_inc.h"
#include "x86_regalloc.h"
#include "x86_text_output.h"
#include "x86_optimizer.h"


// Общие данные.
static basic_blocks_vector  _basic_blocks;                  // число элементов равно количеству блоков в функции


// Таблицы живых регистров.
static set_vector           _alivereg_in;                   // число множеств равно количеству блоков в функции;
static set_vector           _alivereg_out;                  // число элементов в каждом множестве равно числу псевдорегистров

static set                  _alivereg_after_current_insn;   // число элементов в каждом множестве равно числу псевдорегистров
static set                  _alivereg_before_current_insn;  // число элементов в каждом множестве равно числу псевдорегистров

static int                  _current_block;
static x86_instruction *    _current_insn;


// Таблицы достигающих определений.
static insn_vector          _definitions_table;             // число элементов равно числу инструкций в функции

static set_vector           _reachingdef_in;                // число множеств равно количеству блоков в функции;
static set_vector           _reachingdef_out;               // число элементов в каждом множестве равно числу псевдорегистров


// Таблицы импортирующих использований.
static insn_vector          _exposeduse_table;              // число элементов равно числу найденных импортирующих использований
static int_vector           _exposeduse_reg2idx;            // число элементов в каждом множестве равно числу псевдорегистров+1

static set_vector           _exposeduses_in;                // число множеств равно количеству блоков в функции;
static set_vector           _exposeduses_out;               // число элементов равно числу найденных импортирующих использований

// Таблицы потенциально избыточных копирований.
static insn_vector          _redundantcopies_table;         // число элементов равно числу найденых инструкций копирования
static set_vector           _redundantcopies_in;            // число множеств равно количеству блоков в функции;
static set_vector           _redundantcopies_out;           // число элементов равно числу найденных инструкций копирования



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Общие функции обработки структур данных.
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
    for (insn = function->func_binary_code->in_next; insn; insn = insn->in_next)
        estimated_count += _is_leader(insn);

    // выделяем память
    _basic_blocks.blocks_base = allocator_alloc(allocator_per_function_pool, estimated_count * sizeof(basic_block));
    _basic_blocks.blocks_count = 0;

    // строим список блоков
    for (insn = function->func_binary_code; insn; ) {
        block_leader    = insn;
        leader_index    = current_index;

        do {
            insn->in_block  = &_basic_blocks.blocks_base[_basic_blocks.blocks_count];
            prev_insn       = insn;
            insn            = insn->in_next;

            current_index++;
        } while (insn && !_is_leader(insn));

        // insn - новый лидер либо NULL
        _basic_blocks.blocks_base[_basic_blocks.blocks_count].block_leader      = block_leader;
        _basic_blocks.blocks_base[_basic_blocks.blocks_count].block_length      = current_index - leader_index;
        _basic_blocks.blocks_base[_basic_blocks.blocks_count].block_last_insn   = prev_insn;
        _basic_blocks.blocks_count++;
        ASSERT(_basic_blocks.blocks_count <= estimated_count);
    }
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Анализ живых регистров. Используется аллокатором регистров.
//
// Регистра x называется живым в точке p, если его значение в точке p может быть использовано вдоль некоторого,
// начинающегося в p пути графа потока. Иначе он является dead.
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//
// Вычисляет множество def для данного блока,
// т.е. множество псевдорегистров, которые переписываются до их использования.
static void _alivereg_build_def(set *def, basic_block *block, function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int j, regs_cnt, reg, regs[MAX_REGISTERS_PER_INSN];
    set used;

    ASSERT(def->set_count == function->func_pseudoregs_count[type]);
    set_clear_to_zeros(def);

    SET_ALLOCA(used, def->set_count);
    set_clear_to_zeros(&used);

    // помечаем все инструкции
    for (insn = block->block_leader; insn != block->block_last_insn->in_next; insn = insn->in_next) {
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
static void _alivereg_build_use(set *use, basic_block *block, function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int j, regs_cnt, reg, regs[MAX_REGISTERS_PER_INSN];
    set defined;

    ASSERT(use->set_count == function->func_pseudoregs_count[type]);
    set_clear_to_zeros(use);

    SET_ALLOCA(defined, use->set_count);
    set_clear_to_zeros(&defined);

    // помечаем все инструкции
    for (insn = block->block_leader; insn != block->block_last_insn->in_next; insn = insn->in_next) {
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
// Дракон, алгоритм 10.4.
static void _alivereg_build_inout(function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int changed, block, j, label;
    set tmp, old_in;

    setvec_resize(&_alivereg_in, _basic_blocks.blocks_count, function->func_pseudoregs_count[type]);
    setvec_resize(&_alivereg_out, _basic_blocks.blocks_count, function->func_pseudoregs_count[type]);

    SET_ALLOCA(tmp, function->func_pseudoregs_count[type]);
    SET_ALLOCA(old_in, function->func_pseudoregs_count[type]);

    // Все in делаем пустыми множествами.
    for (block = 0; block < _basic_blocks.blocks_count; block++)
        set_clear_to_zeros(&_alivereg_in.vec_base[block]);

    // Цикл, пока вносятся изменения хотя бы в один из блоков in.
    do {
        changed = FALSE;

        for (block = _basic_blocks.blocks_count-1; block >= 0; block--) {
            //
            // 1. out[B] = объединение всех in[последующих B].
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

                // Ищем базовый блок, на первую инструкцию которого делается переход.
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
// Пересчитывает таблицы для данной инструкции.
static void _alivereg_update_tables(x86_operand_type type)
{
    x86_instruction *insn;
    int j, regs_cnt, regs[MAX_REGISTERS_PER_INSN];

    // Обновляем таблицу _alivereg_after_current_insn (множество псевдорегистров, активных после этой инструкции).
    set_assign(&_alivereg_after_current_insn, &_alivereg_out.vec_base[_current_block]);

    for (insn = _basic_blocks.blocks_base[_current_block].block_last_insn; insn != _current_insn; insn = insn->in_prev) {
		ASSERT(insn);

        // извлекаем все переписываемые регистры
        bincode_extract_pseudoregs_overwritten_by_insn(insn, type, regs, &regs_cnt);

        // вычитаем все эти регистры из множества
        for (j = 0; j < regs_cnt; j++)
            BIT_CLEAR(_alivereg_after_current_insn, regs[j]);

        // извлекаем все читаемые регистры
        bincode_extract_pseudoregs_read_by_insn(insn, type, regs, &regs_cnt);

        // добавляем каждый регистр во множество
        for (j = 0; j < regs_cnt; j++)
            BIT_RAISE(_alivereg_after_current_insn, regs[j]);
    }

    // Копируем состояние "после" в состояние "до",
    // и добавляем изменения, вносимые текущей инструкцией.
    set_assign(&_alivereg_before_current_insn, &_alivereg_after_current_insn);

    // извлекаем все переписываемые регистры
    bincode_extract_pseudoregs_overwritten_by_insn(_current_insn, type, regs, &regs_cnt);

    // вычитаем все эти регистры из множества
    for (j = 0; j < regs_cnt; j++)
        BIT_CLEAR(_alivereg_before_current_insn, regs[j]);

    // извлекаем все читаемые регистры
    bincode_extract_pseudoregs_read_by_insn(_current_insn, type, regs, &regs_cnt);

    // добавляем каждый регистр во множество
    for (j = 0; j < regs_cnt; j++)
        BIT_RAISE(_alivereg_before_current_insn, regs[j]);
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Импортирующие использования. Применяются для того, чтобы найти все использования данного определения.
//
// Использованием считается инструкция, которая читает значение регистра.
// Импортирующими считается те из них, перед которыми в данном базовом блоке нет перезаписывающих инструкций для этого регистра.
// Импортирующие использования хранятся отсортированными по регистру.
// В _exposeduse_reg2idx хранится индекс первого использования данного регистра в этой функции.
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//
// Строит список из всех импортирующих использований.
static void _exposeduses_build_table(function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int approx_count, reg, j, regs_cnt, regs[MAX_REGISTERS_PER_INSN];


    // Считаем максимальное число элементов.
    approx_count = function->func_insn_count * MAX_REGISTERS_PER_INSN;


    // Выделяем память.
    _exposeduse_table.insn_base  = allocator_alloc(allocator_per_function_pool, sizeof(x86_instruction)*approx_count);
    _exposeduse_table.insn_count = 0;

    _exposeduse_reg2idx.int_base    = allocator_alloc(allocator_per_function_pool, sizeof(int)*(function->func_pseudoregs_count[type]+1));
    _exposeduse_reg2idx.int_count   = function->func_pseudoregs_count[type]+1;


    // Проходим по всем регистрам, и для каждого находим все интересующие нас использования и вносим их в таблицу.
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

    // Дописываем индекс конца использований для последнего регистра.
    _exposeduse_reg2idx.int_base[reg] = _exposeduse_table.insn_count;
}

//
// Вычисляет множество use для данного блока (множество импортирующих использований),
// т.е. множество пар (s,x) : s - инструкция, использующая регистр x, причём предшествующих определений x в данном блоке нет.
static void _exposeduses_build_use(set *use, basic_block *block, function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int j, reg, idx, regs_cnt, regs[MAX_REGISTERS_PER_INSN];
    set defined_registers;

    ASSERT(use->set_count == _exposeduse_table.insn_count);
    set_clear_to_zeros(use);

    SET_ALLOCA(defined_registers, function->func_pseudoregs_count[type]);
    set_clear_to_zeros(&defined_registers);

    // Проходим по всем инструкциям данного блока.
    for (insn = block->block_leader; insn != block->block_last_insn->in_next; insn = insn->in_next) {
        bincode_extract_pseudoregs_read_by_insn(insn, type, regs, &regs_cnt);

        for (j = 0; j < regs_cnt; j++) {
            reg = regs[j];

            if (!BIT_TEST(defined_registers, reg)) {
                // Находим индекс этой инструкции в таблице _exposeduse_table.
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
// Вычисляет множество def для данного блока,
// т.е. множество пар (s,x) : s - инструкция, использующая регистр x, причём s не из данного блока,
// а x определяется в данном блоке.
static void _exposeduses_build_def(set *def, basic_block *block, function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int *defined_registers, defined_registers_count = 0;
    int i, idx, reg, regs_cnt, regs[MAX_REGISTERS_PER_INSN];

    ASSERT(def->set_count == _exposeduse_table.insn_count);
    set_clear_to_zeros(def);

    defined_registers = allocator_alloc(allocator_per_function_pool, sizeof(int)*block->block_length*MAX_REGISTERS_PER_INSN);

    // Находим все регистры, которые модифицируются в данном блоке.
    for (insn = block->block_leader; insn != block->block_last_insn->in_next; insn = insn->in_next) {
        bincode_extract_pseudoregs_modified_by_insn(insn, type, regs, &regs_cnt);
        memcpy(defined_registers+defined_registers_count, regs, sizeof(int)*regs_cnt);
        defined_registers_count += regs_cnt;
    }

    // Фильтруем повторяющиеся регистры.
    aux_sort_int(defined_registers, defined_registers_count);
    defined_registers_count = aux_unique_int(defined_registers, defined_registers_count);

    // Проходим по всем инструкциям функции, кроме данного блока, и вносим во множество те, которые используют регистры из набора.
    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        if (insn == block->block_leader) {
            insn = block->block_last_insn;
            continue;
        }

        bincode_extract_pseudoregs_read_by_insn(insn, type, regs, &regs_cnt);

        for (i = 0; i < regs_cnt; i++) {
            reg = regs[i];

            if (aux_binary_search(defined_registers, defined_registers_count, reg) >= 0) {
                // Находим индекс этой инструкции в таблице _exposeduse_table.
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
// Строит для каждого базового блока множества in/out в смысле ио-цепочек.
// Дракон, алгоритм 10.4.
static void _exposeduses_build_inout(function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int changed, block, j, label;
    set tmp, old_in;

    setvec_resize(&_exposeduses_in, _basic_blocks.blocks_count, _exposeduse_table.insn_count);
    setvec_resize(&_exposeduses_out, _basic_blocks.blocks_count, _exposeduse_table.insn_count);

    SET_ALLOCA(tmp, _exposeduse_table.insn_count);
    SET_ALLOCA(old_in, _exposeduse_table.insn_count);

    // Все in делаем пустыми множествами.
    for (block = 0; block < _basic_blocks.blocks_count; block++)
        set_clear_to_zeros(&_exposeduses_in.vec_base[block]);

    // Цикл, пока вносятся изменения хотя бы в один из блоков in.
    do {
        changed = FALSE;

        for (block = _basic_blocks.blocks_count-1; block >= 0; block--) {
            //
            // 1. out[B] = объединение всех in[последующих B].
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

                // Ищем базовый блок, на первую инструкцию которого делается переход.
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
// Возвращает все использования данного определения в данной функции (ио-цепочку данного определения).
//
// Проходит в обратном порядке от конца блока до интересующего определения.
// Если других определений нет, то цепочка состоит из множества out плюс использования в данном блоке.
// Если встречаются другие определения, то цепочка состоит из использований, находящихся между
// рассматриваемым определением и следующим определением.
//
static void _exposeduses_find_all_usages_of_definition(int reg, x86_instruction *def, x86_operand_type type,
                                                       x86_instruction **res_arr, int *res_count, int res_max_count)
{
    x86_instruction *test;
    int i, block;
    BOOL reached_def = FALSE;

    block = def->in_block - _basic_blocks.blocks_base;
    *res_count = 0;

    // добавляем все использования в пределах данного блока
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
        // добавляем использования из множества out данного блока
        for (i = _exposeduse_reg2idx.int_base[reg]; i < _exposeduse_reg2idx.int_base[reg + 1]; i++) {
            if (BIT_TEST(_exposeduses_out.vec_base[block], i)) {
                res_arr[*res_count] = _exposeduse_table.insn_base[i];
                ++*res_count;
                ASSERT(*res_count < res_max_count);
            }
        }
    }

    // обеспечиваем уникальность
    aux_sort_int((int*)res_arr, *res_count);
    *res_count = aux_unique_int((int*)res_arr, *res_count);
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Анализ достигающих определений. Применяется для того, чтобы найти все модифицирующие инструкции,
// влияющие на значение регистра в данной точке.
//
// Мы считаем определениями любые измененяющие инструкции (и перезаписывающие, и модифицирующие).
// Мы говорим, что определение d достигает точки p, если имеется путь от точки, непосредственно следующей за d, к p,
// такой, что d не уничтожается вдоль этого пути.
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//
// Строит таблицу определений в данной функции (т.е. массив модифицирующих инструкций).
static void _reachingdef_build_table(function_desc *function, x86_operand_type type)
{
    int max_count = unit_get_instruction_count(function);
    int count = 0, block = 0;
    x86_instruction *insn;

    // выделяем память под число инструкций в функции
    _definitions_table.insn_base = allocator_alloc(allocator_per_function_pool, max_count * sizeof(x86_instruction *));
    _basic_blocks.blocks_base[block].block_first_def = 0;

    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        // сохраняем для каждого блока данные о количестве определений в нём
        if (insn != function->func_binary_code && _is_leader(insn)) {
            _basic_blocks.blocks_base[block].block_end_def = count;
            block++;
            _basic_blocks.blocks_base[block].block_first_def = count;
        }

        // добавляем найденные определения в таблицу
        if (IS_VOLATILE_INSN(insn->in_code) && OP_IS_PSEUDO_REG(insn->in_op1, type)) {
            _definitions_table.insn_base[count++] = insn;
        }
    }

    ASSERT(count <= max_count);
    _basic_blocks.blocks_base[block].block_end_def = count;
    _definitions_table.insn_count = count;
}

//
// Вычисляет множество gen для данного блока в смысле достигающих определений,
// т.е. множество определений, добавленных в данном блоке, однозначных и неоднозначных.
// "Мы хотим, чтобы определение d находилось в gen[S], если d достигает конца S,
// независимо от того, достигает ли оно начала S или нет."
static void _reachingdef_build_gen(set *gen, function_desc *function, basic_block *block, x86_operand_type type)
{
    int *reg_definitions_table = alloca(sizeof(int)*function->func_pseudoregs_count[type]);
    x86_instruction *insn;
    int def, reg, i, regs[MAX_REGISTERS_PER_INSN], regs_cnt;

    ASSERT(gen->set_count == _definitions_table.insn_count);
    set_clear_to_zeros(gen);
    memset(reg_definitions_table, -1, sizeof(int)*function->func_pseudoregs_count[type]);

    // Находим для каждого регистра последнее однозначное определение, записывающее в него.
    for (def = block->block_first_def; def < block->block_end_def; def++) {
        insn = _definitions_table.insn_base[def];
        bincode_extract_pseudoregs_overwritten_by_insn(insn, type, regs, &regs_cnt);

        for (i = 0; i < regs_cnt; i++) {
            reg_definitions_table[regs[i]] = def;
        }
    }

    // Вносим последнее однозначное определение для каждого регистра в множество gen.
    for (reg = 0; reg < function->func_pseudoregs_count[type]; reg++) {
        def = reg_definitions_table[reg];

        if (def != -1) {
            BIT_RAISE(*gen, def);

            // А также вносим все неоднозначные определения, следующие после данного и до конца базового блока.
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
// Вычисляет множество kill для данного блока в смысле достигающих определений,
// т.е. множество определений из всего кода функции, результат которых полностью переписан.
// "kill[S] представляет собой множество определений, которые никогда не достигают конца S,
// даже если достигают его начала."
static void _reachingdef_build_kill(set *kill, function_desc *function, basic_block *block, x86_operand_type type)
{
    x86_instruction *insn;
    set modified_regs;
    int def, reg, i, regs[MAX_REGISTERS_PER_INSN], regs_cnt;

    ASSERT(kill->set_count == _definitions_table.insn_count);
    set_clear_to_zeros(kill);

    SET_ALLOCA(modified_regs, function->func_pseudoregs_count[type]);
    set_clear_to_zeros(&modified_regs);

    // Находим для каждого регистра последнее определение, записывающее в него.
    for (def = block->block_first_def; def < block->block_end_def; def++) {
        insn = _definitions_table.insn_base[def];
        bincode_extract_pseudoregs_modified_by_insn(insn, type, regs, &regs_cnt);

        for (i = 0; i < regs_cnt; i++) {
            BIT_RAISE(modified_regs, regs[i]);
        }
    }

    // Для каждого изменённого регистра: во всём коде функции, кроме данного блока,
    // находим все определения данного регистра и вносим их в множество.
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
// Нахождение достигающих определений.
// Строит множества in/out для каждого блока (Дракон, алгоритм 10.2).
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

    // Инициализируем все out[B] соответствующим gen[B].
    for (block = 0; block < _basic_blocks.blocks_count; block++) {
        // out[block] = gen[block]
        _reachingdef_build_gen(&_reachingdef_out.vec_base[block], function, &_basic_blocks.blocks_base[block], type);
    }

    do {
        change = FALSE;

        // цикл по всем блокам
        for (block = _basic_blocks.blocks_count-1; block >= 0; block--) {
            set_clear_to_zeros(&_reachingdef_in.vec_base[block]);

            // если блок начинается с метки
            if (_basic_blocks.blocks_base[block].block_leader->in_code == x86insn_label) {
                start_label = _basic_blocks.blocks_base[block].block_leader->in_op1.data.label;

                // цикл по всем блокам, ищем jump на данную метку
                for (prev = 0; prev < _basic_blocks.blocks_count; prev++) {
                    insn = _basic_blocks.blocks_base[prev].block_last_insn;

                    if (IS_JMP_INSN(insn->in_code) && insn->in_op1.data.label == start_label) {
                        // in[block] += out[prev]
                        set_unite(&_reachingdef_in.vec_base[block], &_reachingdef_out.vec_base[prev]);
                    }
                }
            }

            // проверяем непосредственно предыдущий блок
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
// Строит ои-цепочку для данной инструкции и данного регистра,
// то есть возвращает все определения, влияющие на значение данного регистра в данной точке.
static void _reachingdef_find_all_definitions(int reg, x86_instruction *insn, x86_operand_type type,
                                             x86_instruction **res_arr, int *res_count, int res_max_count)
{
    basic_block *block = insn->in_block;
    x86_instruction *test;
    int def_idx;

    *res_count = 0;

    // проходим все определения внутри данного блока в обратном порядке
    for (test = insn->in_prev; test != block->block_leader->in_prev; test = test->in_prev) {
        // если находим однозначное определение, то на этом поиск заканчивается
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

    // прибавляем все определения из множества in
    for (def_idx = 0; def_idx != _definitions_table.insn_count; def_idx++) {
        if (_definitions_table.insn_base[def_idx] && BIT_TEST(_reachingdef_in.vec_base[block-_basic_blocks.blocks_base], def_idx)) {
            if (bincode_is_pseudoreg_modified_by_insn(_definitions_table.insn_base[def_idx], type, reg)) {
                ASSERT(*res_count < res_max_count);
                res_arr[*res_count] = _definitions_table.insn_base[def_idx];
                ++*res_count;
            }
        }
    }

    // обеспечиваем уникальность
    aux_sort_int((int*)res_arr, *res_count);
    *res_count = aux_unique_int((int*)res_arr, *res_count);
}

//
// Проверяет, доступно ли определение def для инструкции insn
// (проверка на вхождение инструкции insn в ои-цепочку данного определения).
static BOOL _reachingdef_is_definition_available(int reg, x86_instruction *def, x86_instruction *insn, x86_operand_type type)
{
    x86_instruction **def_arr = alloca(sizeof(void *) * _definitions_table.insn_count);
    int def_count;

    _reachingdef_find_all_definitions(reg, insn, type, def_arr, &def_count, _definitions_table.insn_count);
    return (aux_binary_search((int*)def_arr, def_count, (int)def) >= 0);
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Анализ избыточных копирований. Нужен для оптимизации распространения копирований.
//
// Избыточным копированием в данной точке называется инструкция x = y, такая, что каждый путь от начального узла
// к началу её блока B содержит эту инструкцию, и после последнего вхождения этой инструкции y не изменяется.
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//
// Отбираем инструкции копирования. Они хранятся отсортированными по указателю в массиве.
static void _redundantcopies_build_table(function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int count = 0;

    // составляем таблицу всех копирований
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
// "Мы говорим, что инструкция копирования s: x = y генерируется в блоке B, если s находится в блоке B,
// и в пределах B нет последующего присваивания переменной y."
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
// "Мы говорим, что s: x = y уничтожается в блоке B, если s находится вне блока, а в блоке выполняется присваивание x или y."
static void _redundantcopies_build_kill(set *kill, function_desc *function, basic_block *block, x86_operand_type type)
{
    x86_instruction *insn;
    set modified_regs;
    int idx, i, regs[MAX_REGISTERS_PER_INSN], regs_cnt;

    SET_ALLOCA(modified_regs, function->func_pseudoregs_count[type]);
    set_clear_to_zeros(&modified_regs);

    ASSERT(kill->set_count == _redundantcopies_table.insn_count);
    set_clear_to_zeros(kill);

    // помечаем все модифицированные в этом блоке регистры
    for (insn = block->block_leader; insn != block->block_last_insn->in_next; insn = insn->in_next) {
        bincode_extract_pseudoregs_modified_by_insn(insn, type, regs, &regs_cnt);

        for (i = 0; i < regs_cnt; i++) {
            BIT_RAISE(modified_regs, regs[i]);
        }
    }

    // проходим все инструкции этой функции, кроме этого блока
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
// Строит множества in/out для избыточных копирований (Дракон, уравнения 10.12, алгоритм 10.3).
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

    // in[B1] инициализируется пустым множеством.
    set_clear_to_zeros(&_redundantcopies_in.vec_base[0]);

    // out[B1] инициализируется gen[B1]
    _redundantcopies_build_gen(&_redundantcopies_out.vec_base[0], function, &_basic_blocks.blocks_base[0], type);

    // все остальные out[B] инициализируются U - kill[B]
    for (block = 1; block < _basic_blocks.blocks_count; block++) {
        _redundantcopies_build_kill(&_redundantcopies_out.vec_base[block], function, &_basic_blocks.blocks_base[block], type);
        set_invert(&_redundantcopies_out.vec_base[block]);
    }

    do {
        change = FALSE;

        // цикл по всем блокам
        for (block = _basic_blocks.blocks_count-1; block > 0; block--) {
            set_clear_to_ones(&_redundantcopies_in.vec_base[block]);

            // если блок начинается с метки
            if (_basic_blocks.blocks_base[block].block_leader->in_code == x86insn_label) {
                start_label = _basic_blocks.blocks_base[block].block_leader->in_op1.data.label;

                // цикл по всем блокам, ищем jump на данную метку
                for (prev = 0; prev < _basic_blocks.blocks_count; prev++) {
                    insn = _basic_blocks.blocks_base[prev].block_last_insn;

                    if (IS_JMP_INSN(insn->in_code) && insn->in_op1.data.label == start_label) {
                        // in[block] *= out[prev]
                        set_intersect(&_redundantcopies_in.vec_base[block], &_redundantcopies_out.vec_base[prev]);
                    }
                }
            }

            // проверяем непосредственно предыдущий блок
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
// Тест инструкции на вхождение во множество in указанного блока.
// Является аналогом проверки ои-цепочки для уравнений копирования.
static BOOL _redundantcopies_is_insn_available(x86_instruction *insn, basic_block *block)
{
    int idx = aux_binary_search((int*)_redundantcopies_table.insn_base, _redundantcopies_table.insn_count, (int)insn);
    ASSERT(idx >= 0);

    return BIT_TEST(_redundantcopies_in.vec_base[block - _basic_blocks.blocks_base], idx);
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Внешние интерфейсы.
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//
// Инициализация структур для анализа живых регистров.
void x86_dataflow_init_alive_reg_tables(function_desc *function, x86_operand_type type)
{
    _detect_basic_blocks(function);
    _alivereg_build_inout(function, type);

    set_alloc(&_alivereg_after_current_insn, function->func_pseudoregs_count[type]);
    set_alloc(&_alivereg_before_current_insn, function->func_pseudoregs_count[type]);

    _current_block  = -1;
    _current_insn   = NULL;
}

//
// Пересчитывает таблицы для данной инструкции.
void x86_dataflow_set_current_insn(function_desc *function, x86_operand_type type, x86_instruction *insn)
{
    _current_block  = insn->in_block - _basic_blocks.blocks_base;
    _current_insn   = insn;

    _alivereg_update_tables(type);
}

//
// Проверяет, можно ли освободить регистр ПОСЛЕ этой инструкции.
int x86_dataflow_is_pseudoreg_alive_after(int pseudoreg)
{
    return BIT_TEST(_alivereg_after_current_insn, pseudoreg);
}

//
// Проверяет, можно ли освободить регистр ПЕРЕД этой инструкцией.
int x86_dataflow_is_pseudoreg_alive_before(int pseudoreg)
{
    return BIT_TEST(_alivereg_before_current_insn, pseudoreg);
}

//
// Инициализация ои/ио-цепочек.
void x86_dataflow_init_use_def_tables(function_desc *function, x86_operand_type type)
{
    _detect_basic_blocks(function);

    // генерируем таблицы достигающих определений
    _reachingdef_build_table(function, type);
    _reachingdef_build_inout(function, type);

    // генерируем таблицы импортирующих использований
    _exposeduses_build_table(function, type);
    _exposeduses_build_inout(function, type);
}

//
// Удаляет инструкцию из функции и изо всех таблиц.
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

    // Мы не можем удалять инструкции из _redundantcopies_table, так как она отсортирована,
    // а индексы в ней задают биты в множестве c_in[block].
}


//
// Делает оптимизацию распространения копирований (Дракон, алгоритм 10.6).
void _optimize_redundant_copies(function_desc *function, x86_operand_type type)
{
    x86_instruction *mov, *usage, *next, *test, **usage_arr;
    int usage_count, i, j, x, y, regs_cnt, *regs[MAX_REGISTERS_PER_INSN];
    BOOL replace_allowed;

    usage_arr = allocator_alloc(allocator_per_function_pool, sizeof(void *) * function->func_insn_count);

    for (mov = function->func_binary_code; mov; mov = next) {
        next = mov->in_next;

        // для каждой инструкции копирования
        if (IS_MOV_INSN(mov->in_code) && OP_IS_PSEUDO_REG(mov->in_op1, type) && OP_IS_PSEUDO_REG(mov->in_op2, type)) {
            x               = mov->in_op1.data.reg;
            y               = mov->in_op2.data.reg;
            replace_allowed = TRUE;

            // находим все использования x
            _exposeduses_find_all_usages_of_definition(x, mov, type, usage_arr, &usage_count, function->func_insn_count);

            for (i = 0; i < usage_count && replace_allowed; i++) {
                usage = usage_arr[i];
                if (!usage) {
                    continue;
                }

                // проверяем достижимость этого использования этой инструкцией копирования
                if (!_reachingdef_is_definition_available(x, mov, usage, type)) {
                    continue;
                }

                // x должно использоваться только в read-only контекстах
                if (bincode_is_pseudoreg_modified_by_insn(usage, type, x)) {
                    replace_allowed = FALSE;
                    break;
                }

                // проверяем для этого использования x, входит ли mov в c_in[block]
                if (usage->in_block != mov->in_block && !_redundantcopies_is_insn_available(mov, usage->in_block)) {
                    replace_allowed = FALSE;
                    break;
                }

                // проверяем, что нет изменений x или y в текущем блоке и до использования
                test = (usage->in_block == mov->in_block ? mov->in_next : usage->in_block->block_leader);

                for (; test != usage; test = test->in_next) {
                    // если мы достигли конца, вероятно, имеется цикл; не поддерживаем этот случай и выходим
                    if (test == usage->in_block->block_last_insn) {
                        replace_allowed = FALSE;
                        break;
                    }

                    // если x или y изменяются, выходим
                    if (bincode_is_pseudoreg_modified_by_insn(test, type, x) || bincode_is_pseudoreg_modified_by_insn(test, type, y)) {
                        replace_allowed = FALSE;
                        break;
                    }
                }
            }

            // если все проверки закончились положительно, удаляем инструкцию и заменяем все вхождения x на y.
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
            }
        }
    }

    allocator_free(allocator_per_function_pool, usage_arr, sizeof(void *) * function->func_insn_count);
}

//
// Повторяет оптимизацию, пока она даёт результаты.
static void _optimize_redundant_copies_iterative(function_desc *function, x86_operand_type type)
{
    int function_length, new_length = unit_get_instruction_count(function);

    do {
        function_length = new_length;

        x86_dataflow_init_use_def_tables(function, type);
        _redundantcopies_build_table(function, type);
        _redundantcopies_build_inout(function, type);

        _optimize_redundant_copies(function, type);
        x86_local_optimization_pass(function, TRUE);

        new_length = unit_get_instruction_count(function);
        ASSERT(new_length <= function_length);
    } while (new_length < function_length);
}

//
// Внешний интерфейс для функции распространения копирований.
void x86_dataflow_optimize_redundant_copies(function_desc *function)
{
    _optimize_redundant_copies_iterative(function, x86op_dword);
    _optimize_redundant_copies_iterative(function, x86op_float);
}


//
// Проверяет, можно ли освобождать регистр, т.е. является ли данная инструкция
// последним использованием определения данного регистра.
static BOOL _is_last_usage(int reg, x86_instruction *insn, function_desc *function, x86_operand_type type)
{
    x86_instruction **def_arr   = alloca(sizeof(void *) * _definitions_table.insn_count);
    x86_instruction **usage_arr = alloca(sizeof(void *) * 2 * function->func_insn_count);
    int def_count, usage_count, def, total_count, current_count;
    x86_instruction *test;

    // находим все определения, доступные данной инструкции
    _reachingdef_find_all_definitions(reg, insn, type, def_arr, &def_count, _definitions_table.insn_count);
    if (!def_count) {
        return FALSE;
    }

    // составляем список уникальных использований всех этих определений
    _exposeduses_find_all_usages_of_definition(reg, def_arr[0], type, usage_arr, &total_count, function->func_insn_count);
    aux_sort_int((int*)usage_arr, total_count);

    for (def = 1; def < def_count; def++) {
        _exposeduses_find_all_usages_of_definition(reg, def_arr[def], type, usage_arr+total_count, &usage_count, function->func_insn_count);
        total_count += usage_count;

        aux_sort_int((int*)usage_arr, total_count);
        total_count = aux_unique_int((int*)usage_arr, total_count);
    }

    // проходим по всем инструкциям функции в порядке их выполнения и считаем число встреченных определений
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

