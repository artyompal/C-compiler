
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


typedef struct function_desc_decl {
    symbol *                    func_sym;                   // ������������� �������
    expression *                func_body;                  // ��� ������� � ���� ������ ���������
    BOOL                        func_is_static;             // �����
    symbol_list                 func_locals;                // ������ ��������� ���������� �������
    parameter_list *            func_params;                // ������ ���������� ���������� �������
    x86_instruction *           func_binary_code;           // ��� ������� � ������������� �������������
    int                         func_parameters_sz;         // ��������� ������, � ������, ���������� �������
    int                         func_local_vars_sz;         // ��������� ������, � ������, ��������� ����������
    x86_pseudoreg_info *        func_pseudoregs_map;        // ������ � ����������� �� ������������� ���������������
    int                         func_pseudoregs_cnt;        // ����� ����������� �������
    int                         func_start_of_regvars;      // ������ ����������� ���������� (����� ��������������)
    int                         func_last_label;            // ��������� �������������� ����� � �������
    struct function_desc_decl * func_next;
} function_desc;


function_desc * unit_get_functions_list             (void);
symbol *        unit_create_temporary_variable      (data_type *type);
void            unit_handle_variable_declarations   (decl_specifier decl_spec, symbol_list *symbols);
void            unit_handle_function_prototype      (decl_specifier *spec, symbol *sym);
void            unit_handle_function_body           (symbol *sym);
void            unit_after_global_declaration       (void);

void            unit_push_return                    (expression *result);
void            unit_push_expression                (expression *expr);
int             unit_create_label                   (function_desc *function);
int             unit_push_label                     (void);
void            unit_push_jump                      (int dest, expression *condition, BOOL invert_condition);
int             unit_create_label_and_push_jump     (expression *condition, BOOL invert_condition);
void            unit_place_label                    (int label);

expression *    unit_get_last_expression            (void);
expression *    unit_extract_slice                  (expression *expr);
void            unit_insert_slice                   (expression *list);

void            unit_codegen                        (void);

void            unit_push_nullary_instruction       (x86_instruction_code code);
void            unit_push_unary_instruction         (x86_instruction_code code, x86_operand *op);
void            unit_push_binary_instruction        (x86_instruction_code code, x86_operand *op1, x86_operand *op2);


#else
#error Header unit.h duplicated.
#endif // UNIT_H__INCLUDED
