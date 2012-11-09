
#ifndef X86_OPT_DATA_FLOW_H__INCLUDED
#define X86_OPT_DATA_FLOW_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


void x86_dataflow_init_alive_reg_tables     (function_desc *function, x86_operand_type type);
void x86_dataflow_set_current_insn          (function_desc *function, x86_operand_type type, x86_instruction *pos);

int  x86_dataflow_is_pseudoreg_alive_after  (int pseudoreg);
int  x86_dataflow_is_pseudoreg_alive_before (int pseudoreg);

void x86_dataflow_optimize_redundant_copies (function_desc *function);

void x86_dataflow_init_use_def_tables       (function_desc *function, x86_operand_type type);
BOOL x86_dataflow_is_definition_available   (x86_instruction *def, x86_instruction *insn, x86_operand_type type);
void x86_dataflow_get_usage_of_definition   (int reg, x86_instruction *def, x86_operand_type type,
                                             x86_instruction **res_arr, int *res_count, int res_max_count);

void x86_dataflow_erase_instruction         (function_desc *function, x86_instruction *insn);


#else
#error Header x86_opt_data_flow.h duplicated.
#endif // X86_OPT_DATA_FLOW_H__INCLUDED
