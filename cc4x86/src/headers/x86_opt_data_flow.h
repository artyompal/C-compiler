
#ifndef X86_OPT_DATA_FLOW_H__INCLUDED
#define X86_OPT_DATA_FLOW_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


typedef struct basic_block_decl {           // ��������� �������� �����:
    x86_instruction     *block_leader;      // ������ ���������� �����, ���� ����� �����
    int                 block_length;       // ����� ���������� � �����
    x86_instruction     *block_last_insn;   // ��������� �� ��������� ����������

    int                 block_first_def;    // ������ �����������
    int                 block_end_def;      // �����������, ����������� ����������
} basic_block;


void x86_dataflow_alivereg_init             (function_desc *function, x86_operand_type type);
void x86_dataflow_alivereg_seek             (function_desc *function, x86_operand_type type, x86_instruction *pos);

int  x86_dataflow_alivereg_test_after       (int pseudoreg);
int  x86_dataflow_alivereg_test_before      (int pseudoreg);

BOOL x86_dataflow_optimize_redundant_copies (function_desc *function);
void x86_dataflow_init_use_def_tables       (function_desc *function, x86_operand_type type);
void x86_dataflow_erase_instruction         (function_desc *function, x86_instruction *insn);
void x86_dataflow_detect_registers_range    (function_desc *function, x86_operand_type type);

void x86_dataflow_find_all_usages_of_definition(int reg, x86_instruction *def, x86_operand_type type,
                                                x86_instruction **res_arr, int *res_count, int res_max_count);
void x86_dataflow_find_all_definitions      (int reg, x86_instruction *insn, x86_operand_type type,
                                             x86_instruction **res_arr, int *res_count, int res_max_count);


#else
#error Header x86_opt_data_flow.h duplicated.
#endif // X86_OPT_DATA_FLOW_H__INCLUDED
