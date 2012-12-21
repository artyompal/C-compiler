
#ifndef UNIT_H__INCLUDED
#define UNIT_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


#include "parser.h"


typedef struct x86_instruction_decl     x86_instruction;
typedef struct x86_pseudoreg_info_decl  x86_pseudoreg_info;
typedef enum x86_instruction_code_decl  x86_instruction_code;
typedef struct x86_operand_decl         x86_operand;
typedef enum x86_operand_type_decl      x86_operand_type;


typedef struct function_desc_decl {
    // ��������������/������������� ����������:
    symbol *                    func_sym;                   // ������������� �������

    // ���������� ��������������:
    expression *                func_body;                  // ��� ������� � ���� ������ ���������
    expression *                func_body_end;              // ��������� �� ����� �������
    BOOL                        func_is_static;             // ��������� �������
    symbol_list                 func_locals;                // ������ ��������� ���������� �������
    parameter_list *            func_params;                // ������ ���������� ���������� �������
    x86_instruction *           func_binary_code;           // ��� ������� � ������������� �������������
    x86_instruction *           func_binary_code_end;       // ��������� �� ����� ������
    int                         func_parameters_sz;         // ��������� ������, � ������, ���������� �������
    int                         func_local_vars_sz;         // ��������� ������, � ������, ��������� ����������

    // ���������� ���������� ���������:
    int                         func_labels_count;          // ��������� �������������� ����� � �������
    int                         func_pseudoregs_count[6];   // X86_TYPES_COUNT

    // ���������� ��� �����������:
    int                         func_insn_count;            // ���������� ���������� �� ���������� �������������
    int                         func_usage_count;           // ����� ������� ���� �������

    // ����������� ������:
    struct function_desc_decl * func_next;
} function_desc;


// ������� ������� � �������
function_desc * unit_get_current_function           (void);


// ��������� ���������� ������� � ����������
function_desc * unit_get_functions_list             (void);
function_desc * unit_find_function                  (symbol *name);
symbol *        unit_create_temporary_variable      (function_desc *function, data_type *type);
void            unit_handle_variable_declarations   (decl_specifier decl_spec, symbol_list *symbols);
void            unit_handle_function_prototype      (decl_specifier *spec, symbol *sym);
void            unit_handle_function_body           (symbol *sym);
void            unit_after_global_declaration       (void);

// ��������� ������
void            unit_push_return                    (expression *result, BOOL allow_empty_return);
void            unit_push_expression                (expression *expr);
int             unit_create_label                   ();
int             unit_create_and_push_label          (void);
void            unit_push_jump                      (int dest, expression *condition, BOOL invert_condition);
int             unit_create_label_and_push_jump     (expression *condition, BOOL invert_condition);
void            unit_push_label                     (int label);

// ��������� goto
void            unit_push_named_label               (symbol *label);
void            unit_push_jump_to_named_label       (symbol *label);

// ��������� break/continue
void            unit_push_continue                  ();
void            unit_push_break                     ();
void            unit_push_continue_break_targets    (int continue_target, int break_target);
void            unit_pop_continue_break_targets     ();

// ��������� switch/case/default
void            unit_open_switch_stmt               (expression *value);
void            unit_push_case_label                (expression *value);
void            unit_push_default_stmt              ();
void            unit_close_switch_stmt              ();

// ��������� ����� for (��������� ������� ���������� � ������� � ����� ���� �����)
expression *    unit_get_last_expression            (void);
expression *    unit_extract_slice                  (expression *expr);
void            unit_insert_slice                   (expression *list);

// ��������� ��������������
void            unit_codegen                        (void);
void            unit_push_nullary_instruction       (x86_instruction_code code);
void            unit_push_unary_instruction         (x86_instruction_code code, x86_operand *op);
void            unit_push_binary_instruction        (x86_instruction_code code, x86_operand *op1, x86_operand *op2);
void            unit_push_ternary_instruction       (x86_instruction_code code, x86_operand *op1, x86_operand *op2, x86_operand *op3);


#else
#error Header unit.h duplicated.
#endif // UNIT_H__INCLUDED
