
#include "common.h"
#include "x86_bincode.h"
#include "x86_opt_data_flow_inc.h"
#include "x86_regalloc.h"


// Общие данные.
static basic_blocks_vector  _basic_blocks;                  // число элементов равно количеству блоков в функции


// Данные для анализа живых регистров.
static set_vector           _alivereg_in;                   // число множеств равно количеству блоков в функции;
static set_vector           _alivereg_out;                  // число элементов в каждом множестве равно числу псевдорегистров

static set                  _alivereg_after_current_insn;   // число элементов в каждом множестве равно числу псевдорегистров
static set                  _alivereg_before_current_insn;  // число элементов в каждом множестве равно числу псевдорегистров

static int                  _current_block;
static x86_instruction *    _current_insn;


// Данные для анализа достигающих определений.
static insn_vector          _definitions_table;             // число элементов равно числу инструкций в функции

static set_vector           _reachingdef_in;                // число множеств равно количеству блоков в функции;
static set_vector           _reachingdef_out;               // число элементов в каждом множестве равно числу псевдорегистров


// Данные для анализа импортирующих использований.
static insn_vector          _exposeduse_table;              // число элементов равно числу найденных импортирующих использований
static int_vector           _exposeduse_reg2idx;            // число элементов в каждом множестве равно числу псевдорегистров+1

static set_vector           _exposeduses_in;                // число множеств равно количеству блоков в функции;
static set_vector           _exposeduses_out;               // число элементов равно числу найденных импортирующих использований


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
            prev_insn   = insn;
            insn        = insn->in_next;
            current_index++;
        } while (insn && !_is_leader(insn));

        // insn - новый лидер либо NULL.

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
static void _detect_alivereg_def(set *def, basic_block *block, function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int i, j, regs_cnt, reg, regs[MAX_REGISTERS_PER_INSN];
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
static void _detect_alivereg_use(set *use, basic_block *block, function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int i, j, regs_cnt, reg, regs[MAX_REGISTERS_PER_INSN];
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
// Пересчитывает таблицы для данной инструкции.
static void _recalc_alivereg_tables(function_desc *function, x86_operand_type type)
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
// Строит список из всех экспортирующих определений.
static void _build_exposeduses_table(function_desc *function, x86_operand_type type)
{
//static insn_vector          _exposeduse_table;              // число элементов равно числу найденных импортирующих использований
//static int_vector           _exposeduse_reg2idx;            // число элементов равно числу псевдорегистров+1
//static set_vector           _exposeduses_in;                // число множеств равно количеству блоков в функции;
//static set_vector           _exposeduses_out;               // число элементов равно числу найденных импортирующих использований

    x86_instruction *insn;
    int approx_count, reg, j, regs_cnt, seen_modification, regs[MAX_REGISTERS_PER_INSN];


    // Считаем максимальное число элементов.
    approx_count = function->func_pseudoregs_count[type];

    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        if (IS_CONSTANT_INSN(insn->in_code)) {
            approx_count++;
        }
    }


    // Выделяем память.
    _exposeduse_table.insn_base  = allocator_alloc(allocator_per_function_pool, sizeof(x86_instruction)*approx_count);
    _exposeduse_table.insn_count = 0;

    _exposeduse_reg2idx.int_base    = allocator_alloc(allocator_per_function_pool, sizeof(int)*(function->func_pseudoregs_count[type]+1));
    _exposeduse_reg2idx.int_count   = function->func_pseudoregs_count[type]+1;


    // Проходим по всем регистрам, и для каждого находим все интересующие нас использования и вносим их в таблицу.
    for (reg = 1; reg < function->func_pseudoregs_count[type]; reg++) {
        seen_modification                   = FALSE;
        _exposeduse_reg2idx.int_base[reg]   = _exposeduse_table.insn_count;

        for (insn = function->func_binary_code; insn; insn = insn->in_next) {
            // Сканируем блок. Пока мы не дошли до перезаписывающей инструкции с данным регистром,
            // вносим все инструкции, содержащие данный регистр, в массив.

            if (_is_leader(insn)) {
                seen_modification = FALSE;
            }

            if (OP_IS_THIS_PSEUDO_REG(insn->in_op1, type, reg) && IS_DEFINING_INSN(insn->in_code, type)) {
                seen_modification = TRUE;
            }

            if (!seen_modification) {
                bincode_extract_pseudoregs_read_by_insn(insn, type, regs, &regs_cnt);

                for (j = 0; j < regs_cnt; j++) {
                    if (reg == regs[j]) {
                        _exposeduse_table.insn_base[_exposeduse_table.insn_count++] = insn;
                        ASSERT(_exposeduse_table.insn_count <= approx_count);
                    }
                }
            }
        }
    }

    // Дописываем индекс конца использований для последнего регистра.
    _exposeduse_reg2idx.int_base[reg] = _exposeduse_table.insn_count;
}

//
// Вычисляет множество use для данного блока (множество импортирующих определений),
// т.е. множество пар (s,x) : s - инструкция, использующая регистр x, причём предшествующих определений x в данном блоке нет.
static void _detect_exposeduses_use(set *use, basic_block *block, function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int i, j, reg, idx, regs_cnt, regs[MAX_REGISTERS_PER_INSN];

    ASSERT(use->set_count == _exposeduse_table.insn_count);
    set_clear_to_zeros(use);

    // Проходим по всем инструкциям данного блока.
    for (i = 0, insn = block->block_leader; i < block->block_length; i++, insn = insn->in_next) {
        bincode_extract_pseudoregs_read_by_insn(insn, type, regs, &regs_cnt);

        for (j = 0; j < regs_cnt; j++) {
            reg = regs[j];

            // Находим индекс этой инструкции в таблице _exposeduse_table.
            for (idx = _exposeduse_reg2idx.int_base[reg]; _exposeduse_table.insn_base[idx] != insn; idx++) {
                ASSERT(idx < _exposeduse_reg2idx.int_base[reg+1]);
            }

            BIT_RAISE(*use, idx);
        }
    }
}

//
// Вычисляет множество def для данного блока,
// т.е. множество пар (s,x) : s - инструкция, использующая регистр x, причём s не из данного блока,
// а x определяется в данном блоке.
static void _detect_exposeduses_def(set *def, basic_block *block, function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int *defined_registers, defined_registers_count = 0;
    int i, idx, reg, regs_cnt, regs[MAX_REGISTERS_PER_INSN];

    ASSERT(def->set_count == _exposeduse_table.insn_count);
    set_clear_to_zeros(def);

    defined_registers = allocator_alloc(allocator_per_function_pool, sizeof(int)*block->block_length*MAX_REGISTERS_PER_INSN);

    // Находим все регистры, которые переписываются в данном блоке.
    for (i = 0, insn = block->block_leader; i < block->block_length; i++, insn = insn->in_next) {
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
// Алгоритм Дракона 10.4.
static void _build_exposeduses_inout(function_desc *function, x86_operand_type type)
{
    x86_instruction *insn;
    int changed, block, j, label;
    set use, def, new_in;

    setvec_resize(&_exposeduses_in, _basic_blocks.blocks_count, _exposeduse_table.insn_count);
    setvec_resize(&_exposeduses_out, _basic_blocks.blocks_count, _exposeduse_table.insn_count);

    SET_ALLOCA(use, _exposeduse_table.insn_count);
    SET_ALLOCA(def, _exposeduse_table.insn_count);
    SET_ALLOCA(new_in, _exposeduse_table.insn_count);

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

            _detect_exposeduses_def(&def, &_basic_blocks.blocks_base[block], function, type);
            _detect_exposeduses_use(&use, &_basic_blocks.blocks_base[block], function, type);

            set_assign(&new_in, &_exposeduses_out.vec_base[block]);
            set_subtract(&new_in, &def);
            set_unite(&new_in, &use);

            changed |= !set_equal(&_exposeduses_in.vec_base[block], &new_in);
            set_assign(&_exposeduses_in.vec_base[block], &new_in);
        }
    } while (changed);
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Анализ достигающих определений. Применяется для того, чтобы найти все определения данного регистра.
//
// Мы считаем определениями любые измененяющие инструкции (и перезаписывающие, и модифицирующие).
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//
// Строит таблицу определений в данной функции (т.е. массив модифицирующих инструкций).
static void _build_reachingdef_table(function_desc *function, x86_operand_type type)
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
            _basic_blocks.blocks_base[block].block_last_def = count;
            block++;
            _basic_blocks.blocks_base[block].block_first_def = count;
        }

        // добавляем найденные определения в таблицу
        if (IS_VOLATILE_INSN(insn->in_code, type) && OP_IS_TYPED_REGISTER(insn->in_op1, type)) {
            _definitions_table.insn_base[count++] = insn;
        }
    }

    ASSERT(count <= max_count);
    _basic_blocks.blocks_base[block].block_last_def = count;
    _definitions_table.insn_count = count;
}

//
// Вычисляет множество gen для данного блока в смысле достигающих определений,
// т.е. множество определений, добавленных в данном блоке, однозначных и неоднозначных.
// "Мы хотим, чтобы определение d находилось в gen[S], если d достигает конца S,
// независимо от того, достигает ли оно начала S или нет."
static void _detect_reachingdef_gen(set *gen, function_desc *function, basic_block *block, x86_operand_type type)
{
    int *reg_definitions_table = alloca(sizeof(int)*function->func_pseudoregs_count[type]);
    x86_instruction *insn;
    int def, reg;

    ASSERT(gen->set_count == _definitions_table.insn_count);
    set_clear_to_zeros(gen);
    memset(reg_definitions_table, -1, sizeof(int)*function->func_pseudoregs_count[type]);

    // Находим для каждого регистра последнее однозначное определение, записывающее в него.
    for (def = block->block_first_def; def < block->block_last_def; def++) {
        insn = _definitions_table.insn_base[def];
        //ASSERT(IS_VOLATILE_INSN(insn->in_code, type) && OP_IS_TYPED_REGISTER(insn->in_op1, type));

        if (IS_DEFINING_INSN(insn->in_code, type)) {
            reg_definitions_table[insn->in_op1.data.reg] = def;
        }
    }

    // Вносим последнее однозначное определение для каждого регистра в множество gen.
    for (reg = 0; reg < function->func_pseudoregs_count[type]; reg++) {
        def = reg_definitions_table[reg];

        if (def != -1) {
            BIT_RAISE(*gen, def);

            // А также вносим все неоднозначные определения, следующие после данного и до конца базового блока.
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
// Вычисляет множество kill для данного блока в смысле достигающих определений,
// т.е. множество определений из всего кода функции, результат которых полностью переписан.
// "kill[S] представляет собой множество определений, которые никогда не достигают конца S,
// даже если достигают его начала."
static void _detect_reachingdef_kill(set *kill, function_desc *function, basic_block *block, x86_operand_type type)
{
    int *reg_definitions_table = alloca(sizeof(int)*function->func_pseudoregs_count[type]);
    x86_instruction *insn;
    int def, reg;

    ASSERT(kill->set_count == _definitions_table.insn_count);
    set_clear_to_zeros(kill);
    memset(reg_definitions_table, -1, sizeof(int)*function->func_pseudoregs_count[type]);

    // Находим для каждого регистра последнее однозначное определение, записывающее в него.
    for (def = block->block_first_def; def < block->block_last_def; def++) {
        insn = _definitions_table.insn_base[def];
        //ASSERT(IS_VOLATILE_INSN(insn->in_code, type) && OP_IS_TYPED_REGISTER(insn->in_op1, type));

        if (IS_DEFINING_INSN(insn->in_code, type)) {
            reg_definitions_table[insn->in_op1.data.reg] = def;
        }
    }

    // Для каждого регистра: во всём коде функции, кроме данного блока, находим все определения данного регистра
    // (однозначные и неоднозначные), и вносим их в множество.
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
// Нахождение достигающих определений.
// Строит множества in/out для каждого блока (алгоритм из Дракона 10.2).
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

    // Инициализируем все out[B] соответствующим gen[B].
    for (block = 0; block < _basic_blocks.blocks_count; block++) {
        // out[block] = gen[block]
        _detect_reachingdef_gen(&_reachingdef_out.vec_base[block], function, &_basic_blocks.blocks_base[block], type);
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
// Внешние интерфейсы.
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//
// Инициализация всех таблиц для одной функции.
void x86_dataflow_prepare_function(function_desc *function, x86_operand_type type)
{
    // Инициализируем структуры для анализа живых регистров.
    _detect_basic_blocks(function);
    _build_alivereg_inout(function, type);

    set_alloc(&_alivereg_after_current_insn, function->func_pseudoregs_count[type]);
    set_alloc(&_alivereg_before_current_insn, function->func_pseudoregs_count[type]);

    _current_block  = -1;
    _current_insn   = NULL;

    // Инициализируем структуры для анализа импортирующих использований.
    _build_exposeduses_table(function, type);
    _build_exposeduses_inout(function, type);

    // Инициализируем структуры для анализа достигающих определений.
    _build_reachingdef_table(function, type);
    _build_reachingdef_inout(function, type);
}

//
// Пересчитывает таблицы для данной инструкции.
// Можно переместиться на несколько инструкций вперёд.
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
// Пересчитывает таблицы для данной инструкции.
// Можно переместиться на несколько инструкций назад.
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
// Проверяет, можно ли освободить регистр ПОСЛЕ этой инструкции.
int x86_dataflow_is_pseudoreg_alive_after(function_desc *function, int pseudoreg)
{
    return BIT_TEST(_alivereg_after_current_insn, pseudoreg);
}

//
// Проверяет, можно ли освободить регистр ПЕРЕД этой инструкцией.
int x86_dataflow_is_pseudoreg_alive_before(function_desc *function, int pseudoreg)
{
    return BIT_TEST(_alivereg_before_current_insn, pseudoreg);
}

