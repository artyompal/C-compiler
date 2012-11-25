
#ifndef X86_REGALLOC_H__INCLUDED
#define X86_REGALLOC_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


typedef struct function_desc_decl function_desc;


typedef enum x86_register_status_decl {
    register_unallocated,
    register_allocated,
    register_reserved,
    register_swapped,
    register_delayed_swapped,
} x86_register_status;

typedef struct x86_pseudoreg_info_decl {
    x86_register_status     reg_status;             // ���� �� ��������� ����
    int                     reg_location;           // ����� ���������������� ��������� �������� ��� -1
    int                     reg_stack_location;     // �������� ��������������� ������ � �����
    BOOL                    reg_dirty;              // ��� �� ������� �������������
    x86_operand_type        reg_content_type;       // ��� ����������� ��������
} x86_pseudoreg_info;

#define OP_IS_REGVAR(REG, TYPE) ((REG) >= function->func_start_of_regvars[(TYPE)])


x86_operand_type            x86_encode_register_type        (x86_operand_type type);
BOOL                        x86_equal_types                 (x86_operand_type type1, x86_operand_type type2);

void                        x86_allocate_registers          (function_desc *function);

int                         x86_get_registers_count         (x86_operand_type type);


#else
#error Header x86_regalloc.h duplicated.
#endif // X86_REGALLOC_H__INCLUDED
