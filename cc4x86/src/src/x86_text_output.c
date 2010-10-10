
#include "common.h"
#include "x86_bincode.h"
#include "x86_text_output.h"


static FILE *asm_file = NULL;


//
// Handling units, sections and data variables.
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
//  Assembler text output generation.
//

static const char *_x86_instructions[] = {
    "call",     // call w/o result
    "call",     // call w/ int result
    "call",     // call w/ float result
    "ret",
    "push",
    "pop",

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

    "sete\tal",
    "setne\tal",
    "setle\tal",
    "setl\tal",
    "setge\tal",
    "setg\tal",
    "setbe\tal",
    "setb\tal",
    "setae\tal",
    "seta\tal",

    "fld",
    "fild",
    "fst",
    "fstp",
    "fistp",
    "fstp",
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

    "cdq",
    NULL,   // movzx reg, al
    "cmp",
    "lea",
    "test",
    "fucomip\tst,st(1)\n\tfstp\tst",
    "cld",
    "rep\tmovsb",
    "rep\tmovsd",
    "imul",  // imul reg, reg/mem, const
    "xchg",

    "x86instr_label",
    "x86instr_push_all",
    "x86instr_pop_all",
    "x86instr_create_stack_frame",
    "x86instr_destroy_stack_frame",
};
AUX_CASSERT(AUX_ARRAY_LENGTH(_x86_instructions) == x86instr_count);

static const char *_x86_int_registers[] = {
    "eax", "ecx", "edx", "ebx", "esp", "ebp", "esi", "edi",
};
AUX_CASSERT(AUX_ARRAY_LENGTH(_x86_int_registers) == x86reg_count)

static const char *_x86_tmp_int_registers[] = {
    "ecx", "ebx", "ebp", "esi", "edi",
};
AUX_CASSERT(AUX_ARRAY_LENGTH(_x86_tmp_int_registers) == 5)


static void _print_instr(FILE *output, x86_instruction_code code)
{
    ASSERT(code < x86instr_count);
    fprintf(output, "\t%s", _x86_instructions[code]);
}

static void _print_reg(FILE *output, int reg)
{
    if (reg < -x86reg_count) {
        fprintf(output, "reg0x%x", reg);
    } else if (reg < 0) {
        fputs(_x86_int_registers[~reg], output);
    } else {
        fprintf(output, "reg%d", reg);
    }
}

static void _print_op(FILE *output, x86_operand *op)
{
    BOOL was_smth = FALSE;

    switch (op->op_type) {
    case x86op_int_register:
        _print_reg(output, op->data.reg);
        break;

    case x86op_int_constant:
        fprintf(output, "%d", op->data.int_val);
        break;

    case x86op_address:
        if (op->data.address.base == 0 && op->data.address.index == 0) {
            fprintf(output, "ds:");
        }


        fputc('[', output);

        if (op->data.address.base != 0) {
            _print_reg(output, op->data.address.base);
            was_smth = TRUE;
        }

        if (op->data.address.index != 0) {
            if (was_smth) {
                fputc('+', output);
            }

            _print_reg(output, op->data.address.index);

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

    case x86op_symbol:
        if (TYPE_IS_FUNCTION(op->data.sym->sym_type)) {
            fprintf(output, "_%s", op->data.sym->sym_name);
        } else {
            fprintf(output, "[_%s]", op->data.sym->sym_name);
        }
        break;

    case x86op_symbol_offset:
        fprintf(output, "(offset _%s)", op->data.sym->sym_name);
        break;

    case x86op_label:
        fprintf(output, "label%04x", op->data.label);
        break;

    default:
        ASSERT(FALSE);
    }
}


static void _output_push_nullary_instruction(FILE *output, x86_instruction_code code)
{
    _print_instr(output, code);
    fputc('\n', output);
}

static void _output_push_unary_instruction(FILE *output, x86_instruction_code code, x86_operand *op)
{
    if (code == x86instr_label) {
        _print_op(output, op);
        fputc(':', output);
    } else if (op->op_type == x86op_float_register) {
        ASSERT(code < x86instr_count);
        fprintf(output, "\t%sp", _x86_instructions[code]);
    } else if (code == x86instr_movzx_al) {
        fputs("\tmovzx\t", output);
        _print_op(output, op);
        fputs(",al", output);
    } else {
        _print_instr(output, code);
        fputc('\t', output);

        if (code == x86instr_float_stp_double) {
            fputs("qword ptr ", output);  // for double operands
        } else if (op->op_type == x86op_address) {
            fputs("dword ptr ", output);  // FIXME: assumed that operand can either be int or float
        }

        _print_op(output, op);
    }

    fputc('\n', output);
}

static void _output_push_binary_instruction(FILE *output, x86_instruction_code code, x86_operand *op1, x86_operand *op2)
{
    _print_instr(output, code);
    fputc('\t', output);

    if (op1->op_type == x86op_address && op2->op_type == x86op_int_constant) {
        fputs("dword ptr ", output);
    }

    _print_op(output, op1);
    fputc(',', output);
    _print_op(output, op2);
    fputc('\n', output);
}

static void _output_push_ternary_instruction(FILE *output, x86_instruction_code code, x86_operand *op1, x86_operand *op2, int op3)
{
    _print_instr(output, code);
    fputc('\t', output);
    _print_op(output, op1);
    fputc(',', output);
    _print_op(output, op2);
    fprintf(output, ",%d\n", op3);
}

static void _output_push_instruction(FILE *output, x86_instruction *instr)
{
    if (instr->in_op1.op_type == x86op_none) {
        _output_push_nullary_instruction(output, instr->in_code);
    } else if (instr->in_op2.op_type == x86op_none) {
        _output_push_unary_instruction(output, instr->in_code, &instr->in_op1);
    } else if (instr->in_code != x86instr_imul_const) {
        _output_push_binary_instruction(output, instr->in_code, &instr->in_op1, &instr->in_op2);
    } else {
        _output_push_ternary_instruction(output, instr->in_code, &instr->in_op1, &instr->in_op2, instr->in_op3);
    }
}


void text_output_push_instruction(x86_instruction *instr)
{
    _output_push_instruction(asm_file, instr);
}


#ifdef _DEBUG

void debug_print_instruction(x86_instruction *instr)
{
    _output_push_instruction(stdout, instr);
}

#endif // _DEBUG

