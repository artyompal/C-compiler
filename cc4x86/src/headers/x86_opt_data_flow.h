
#ifndef X86_OPT_DATA_FLOW_H__INCLUDED
#define X86_OPT_DATA_FLOW_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


void x86_dataflow_prepare_function(function_desc *function, x86_operand_type type);

void x86_dataflow_step_to_instruction(function_desc *function, x86_operand_type type, x86_instruction *insn);
int  x86_dataflow_is_pseudoreg_alive_after(function_desc *function, int pseudoreg);


#else
#error Header x86_opt_data_flow.h duplicated.
#endif // X86_OPT_DATA_FLOW_H__INCLUDED
