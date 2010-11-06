
#include "common.h"
#include "x86_bincode.h"
#include "x86_text_output.h"


static FILE *asm_file = NULL;


//
// Работа с модулями, секциями и переменными.
//

void text_output_begin_unit(void)
{
    asm_file = fopen(option_output_filename, "w+");
    if (!asm_file) {
        aux_fatal_error("failed to open output file '%s'", option_output_filename);
    }

    fprintf(asm_file, "\n.686\n.model flat\n");

#ifdef _DEBUG
    setvbuf(asm_file, 0, _IONBF, 0);
#endif
}

void text_output_end_unit(void)
{
    fprintf(asm_file, "\nend\n");

    fclose(asm_file);
    asm_file = NULL;
}

void text_output_begin_data_section(void)
{
    fprintf(asm_file, "\n.data\n\n");
}

void text_output_declare_uninitialized_bytes(symbol *sym, int size)
{
    if (size == 4) {
        fprintf(asm_file, "_%s\tdd\t?\n", sym->sym_name);
    } else {
        fprintf(asm_file, "_%s\tdb\t %d dup (?)\n", sym->sym_name, size);
    }

    fprintf(asm_file, "public\t_%s\n", sym->sym_name);
}

void text_output_declare_initialized_int(symbol *sym, long value)
{
    fprintf(asm_file, "_%s\tdd\t%d\n", sym->sym_name, value);
    fprintf(asm_file, "public\t_%s\n", sym->sym_name);
}

void text_output_declare_initialized_float(symbol *sym, double value)
{
    fprintf(asm_file, "_%s\tdd\t%f\n", sym->sym_name, value);
    fprintf(asm_file, "public\t_%s\n", sym->sym_name);
}

void text_output_declare_initialized_string(symbol *sym, const char *value)
{
    int i;
    int length = strlen(value) + 1;

    fprintf(asm_file, "_%s\tdb\t", sym->sym_name);

    for (i = 0; ; i++) {
        if (i == length - 1) {
            fprintf(asm_file, "%d", (unsigned char) value[i]);
            break;
        }

        if (i % 16 == 15) {
            fprintf(asm_file, "%d\n\tdb\t", (unsigned char) value[i]);
        } else {
            fprintf(asm_file,  "%d, ", (unsigned char) value[i]);
        }
    }

    fputc('\n', asm_file);
    fprintf(asm_file, "public\t_%s\n", sym->sym_name);
}

void text_output_declare_ptr_to_relocable(symbol *ptr_sym, symbol *rel_sym)
{
    fprintf(asm_file, "_%s\tdd\toffset _%s\n", ptr_sym->sym_name, rel_sym->sym_name);
    fprintf(asm_file, "public\t_%s\n", ptr_sym->sym_name);
}


void text_output_begin_text_section(void)
{
    fprintf(asm_file, "\n.code\n");
}

void text_output_begin_function(function_desc *function)
{
    fprintf(asm_file, "\n_%s proc\n", function->func_sym->sym_name);
}

void text_output_end_function(function_desc *function)
{
    fprintf(asm_file, "_%s endp\t\n", function->func_sym->sym_name);
}


//
// Генерация текстового вывода для ассемблера.
//

static const char *_x86_instructions[] = {
    // ветвление:
    "jmp",
    "je",
    "jne",
    "jle",
    "jl",
    "jge",
    "jg",
    "jbe",
    "jb",
    "jae",
    "ja",

    // целочисленная арифметика:
    "inc",
    "dec",
    "neg",
    "not",

    "mov",
    "add",
    "sub",
    "imul",
    "idiv",
    "sal",
    "sar",
    "and",
    "xor",
    "or",

    "sete",
    "setne",
    "setle",
    "setl",
    "setge",
    "setg",
    "setbe",
    "setb",
    "setae",
    "seta",

    // FPU арифметика:
    "fld",
    "fild",
    "fst",
    "fstp",
    "fistp",
    "fadd",
    "fsub",
    "fmul",
    "fdiv",
    "fsubr",
    "fdivr",

    "fld1",
    "fldz",
    "fld2t",
    "fld2e",
    "fldpi",
    "fldlg2",
    "fldln2",

    "int2float",
    "float2int",

    // SSE2 арифметика:
    "movss",
    "cvtsi2ss",
    "cvttss2si",
    "addss",
    "subss",
    "mulss",
    "divss",

    // Инструкции для внутреннего пользования.
    // арифметические модифицирующие:
    "imul",  // imul reg, reg/mem, const
    "xchg",
    "lea",
    "movsx",
    "movzx",

    // управление стеком:
    "push",
    "pop",
    "call",
    "ret",

    // целочисленные read-only:
    "cmp",
    "test",

    // псевдо-инструкции:
    "cdq",
    "fucomip\tst,st(1)\n\tfstp\tst",
    "cld",
    "rep\tmovsb",
    "rep\tmovsd",
    "push_arg",
    "restore_stack",
    "label",
    "push_all",
    "pop_all",
    "create_stack_frame",
    "destroy_stack_frame",
};
AUX_CASSERT(AUX_ARRAY_LENGTH(_x86_instructions) == x86insn_count);

static const char *_x86_byte_registers[] = {
    "al", "cl", "dl", "bl", "ah", "ch", "dh", "bh",
};
AUX_CASSERT(AUX_ARRAY_LENGTH(_x86_byte_registers) == x86_byte_reg_count)

static const char *_x86_word_registers[] = {
    "ax", "cx", "dx", "bx", "sp", "bp", "si", "di",
};
AUX_CASSERT(AUX_ARRAY_LENGTH(_x86_word_registers) == x86_word_reg_count)

static const char *_x86_dword_registers[] = {
    "eax", "ecx", "edx", "ebx", "esp", "ebp", "esi", "edi",
};
AUX_CASSERT(AUX_ARRAY_LENGTH(_x86_dword_registers) == x86_dword_reg_count)


static const char *_encode_hw_type(x86_operand_type hw_type)
{
    switch (hw_type) {
    case x86op_byte:    return "byte ptr";
    case x86op_word:    return "word ptr";

    case x86op_float:
    case x86op_dword:   return "dword ptr";

    case x86op_double:  return "qword ptr";

    default:            ASSERT(FALSE);
    }
}

static void _print_insn(FILE *output, x86_instruction_code code)
{
    ASSERT(code < x86insn_count);
    fprintf(output, "\t%s", _x86_instructions[code]);
}

static void _print_reg(FILE *output, x86_operand_location type, int reg)
{
    switch (type) {
    case x86op_byte:
        if (reg < -x86_byte_reg_count) {
            fprintf(output, "byte0x%x", reg);
        } else if (reg < 0) {
            fputs(_x86_byte_registers[~reg], output);
        } else {
            fprintf(output, "byte%d", reg);
        }
        break;

    case x86op_word:
        if (reg < -x86_word_reg_count) {
            fprintf(output, "word0x%x", reg);
        } else if (reg < 0) {
            fputs(_x86_word_registers[~reg], output);
        } else {
            fprintf(output, "word%d", reg);
        }
        break;

    case x86op_dword:
        if (reg < -x86_dword_reg_count) {
            fprintf(output, "dword0x%x", reg);
        } else if (reg < 0) {
            fputs(_x86_dword_registers[~reg], output);
        } else {
            fprintf(output, "dword%d", reg);
        }
        break;

    case x86op_float:
        if (reg < -8) {
            fprintf(output, "sse0x%x", reg);
        } else if (reg < 0) {
            fprintf(output, "xmm%d", ~reg);
        } else {
            fprintf(output, "sse%d", reg);
        }
        break;

    default:
        ASSERT(FALSE);
    }
}

static void _print_op(FILE *output, x86_operand *op)
{
    BOOL was_smth = FALSE;

    switch (op->op_loc) {
    case x86loc_register:
        _print_reg(output, op->op_type, op->data.reg);
        break;

    case x86loc_int_constant:
        fprintf(output, "%d", op->data.int_val);
        break;

    case x86loc_address:
        if (op->data.address.base == 0 && op->data.address.index == 0) {
            fprintf(output, "ds:");
        }


        fputc('[', output);

        if (op->data.address.base != 0) {
            _print_reg(output, x86op_dword, op->data.address.base);
            was_smth = TRUE;
        }

        if (op->data.address.index != 0) {
            if (was_smth) {
                fputc('+', output);
            }

            _print_reg(output, x86op_dword, op->data.address.index);

            if (op->data.address.scale > 1) {
                ASSERT(op->data.address.scale == 2 || op->data.address.scale == 4 || op->data.address.scale == 8);
                fprintf(output, "*%d", op->data.address.scale);
            }

            was_smth = TRUE;
        }

        if (op->data.address.offset || !was_smth) {
            if (was_smth && op->data.address.offset > 0) {
                fputc('+', output);
            }

            fprintf(output, "%d", op->data.address.offset);
        }

        fputc(']', output);
        break;

    case x86loc_symbol:
        if (TYPE_IS_FUNCTION(op->data.sym.name->sym_type)) {
            ASSERT(op->data.sym.offset == 0);
            fprintf(output, "_%s", op->data.sym.name->sym_name);
        } else {
            if (op->data.sym.offset == 0) {
                fprintf(output, "%s [_%s]", _encode_hw_type(op->op_type), op->data.sym.name->sym_name);
            } else {
                fprintf(output, "%s [_%s+%d]", _encode_hw_type(op->op_type), op->data.sym.name->sym_name, op->data.sym.offset);
            }
        }
        break;

    case x86loc_symbol_offset:
        if (op->data.sym.offset == 0)
            fprintf(output, "(offset _%s)", op->data.sym.name->sym_name);
        else
            fprintf(output, "(offset _%s)+%d", op->data.sym.name->sym_name, op->data.sym.offset);
        break;

    case x86loc_label:
        fprintf(output, "label%04x", op->data.label);
        break;

    default:
        ASSERT(FALSE);
    }
}


static void _output_push_nullary_instruction(FILE *output, x86_instruction_code code)
{
    _print_insn(output, code);
    fputc('\n', output);
}

static void _output_push_unary_instruction(FILE *output, x86_instruction_code code, x86_operand *op)
{
    if (code == x86insn_label) {
        _print_op(output, op);
        fputc(':', output);
    } else if (op->op_loc == x86loc_register && OP_IS_FLOAT(*op)) {
        ASSERT(code < x86insn_count);
        fprintf(output, "\t%sp", _x86_instructions[code]);
    } else {
        _print_insn(output, code);
        fputc('\t', output);

        if (op->op_loc == x86loc_address) {
            fprintf(output, "%s ", _encode_hw_type(op->op_type));
        }

        _print_op(output, op);
    }

    fputc('\n', output);
}

static void _output_push_binary_instruction(FILE *output, x86_instruction_code code, x86_operand *op1, x86_operand *op2)
{
    _print_insn(output, code);
    fputc('\t', output);

    if (op1->op_loc == x86loc_address && op2->op_loc == x86loc_int_constant) {
        fputs("dword ptr ", output);
    }

    _print_op(output, op1);
    fputc(',', output);
    _print_op(output, op2);
    fputc('\n', output);
}

static void _output_push_ternary_instruction(FILE *output, x86_instruction_code code, x86_operand *op1, x86_operand *op2, int op3)
{
    _print_insn(output, code);
    fputc('\t', output);
    _print_op(output, op1);
    fputc(',', output);
    _print_op(output, op2);
    fprintf(output, ",%d\n", op3);
}

static void _output_push_instruction(FILE *output, x86_instruction *insn)
{
    if (insn->in_op1.op_loc == x86loc_none) {
        _output_push_nullary_instruction(output, insn->in_code);
    } else if (insn->in_op2.op_loc == x86loc_none || insn->in_code == x86insn_call) {
        _output_push_unary_instruction(output, insn->in_code, &insn->in_op1);
    } else if (insn->in_code != x86insn_imul_const) {
        _output_push_binary_instruction(output, insn->in_code, &insn->in_op1, &insn->in_op2);
    } else {
        _output_push_ternary_instruction(output, insn->in_code, &insn->in_op1, &insn->in_op2, insn->in_op3);
    }
}


void text_output_push_instruction(x86_instruction *insn)
{
    _output_push_instruction(asm_file, insn);
}


#ifdef _DEBUG

void debug_print_instruction(x86_instruction *insn)
{
    _output_push_instruction(stdout, insn);
}

#endif // _DEBUG
