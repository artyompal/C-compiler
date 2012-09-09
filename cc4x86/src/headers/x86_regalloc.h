
#ifndef X86_REGALLOC_H__INCLUDED
#define X86_REGALLOC_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


typedef struct function_desc_decl function_desc;


typedef enum x86_register_status_decl {
    register_free,
    register_allocated,
    register_reserved,
    register_swapped,
    register_delayed_swapped,
} x86_register_status;

typedef struct x86_pseudoreg_info_decl {
    x86_register_status     reg_status;             // один из вариантов выше
    int                     reg_location;           // номер ассоциированного реального регистра или -1
    int                     reg_stack_location;     // смещение ассоциированной ячейки в стеке
    BOOL                    reg_saved;              // если регистр был живым на момент, когда его выгрузили, то он был сохранён

// TODO: параметры reg_first_write/reg_last_read/reg_changes_value являются deprecated. Задачи анализа потока данных должны теперь решаться через множества in/out.
    x86_instruction *       reg_first_write;
    x86_instruction *       reg_last_read;
    BOOL                    reg_changes_value;
} x86_pseudoreg_info;

// TODO: OP_IS_REGVAR является хаком, и регистровые переменные сделаны пока что хаком. Нужно сделать нормальное распространение копирований и не использовать этот макрос без необходимости.
#define OP_IS_REGVAR(REG, TYPE) ((REG) >= function->func_start_of_regvars[(TYPE)])


x86_operand_type            x86_encode_register_type        (x86_operand_type type);
BOOL                        x86_equal_types                 (x86_operand_type type1, x86_operand_type type2);

void                        x86_analyze_registers_usage     (function_desc *function);
void                        x86_allocate_registers          (function_desc *function);

int                         x86_get_max_register_count      (x86_operand_type type);


#else
#error Header x86_regalloc.h duplicated.
#endif // X86_REGALLOC_H__INCLUDED
