
#include "common.h"
#include "x86_bincode.h"
#include "x86_text_output.h"


static FILE *_asm_file = NULL;


static int cursor_pos = 0;
#define TAB_SIZE 8


//
// ����� �������, ���������� fprintf/out_str/out_ch � ���������� /t �� TAB_SIZE ��������.
static void out_ch(char c)
{
    int i;

    if (!_asm_file) {
        return;
    }

    if (c == '\t') {
        for (i = 8; i > cursor_pos % TAB_SIZE; i--) {
            fputc('\x20', _asm_file);
        }

        cursor_pos += 8 - cursor_pos % TAB_SIZE;
    } else if (c == '\n') {
        cursor_pos = 0;
        fputc(c, _asm_file);
    } else {
        cursor_pos++;
        fputc(c, _asm_file);
    }
}

static void out_str(const char *str)
{
    while (*str) {
        out_ch(*str++);
    }
}

static void out_fmt(const char *fmt, ...)
{
    va_list args;
    char buffer[256];

    va_start(args, fmt);
    vsnprintf(buffer, 255, fmt, args);
    out_str(buffer);
    va_end(args);
}


//
// ������ � ��������, �������� � �����������.
//

void text_output_begin_unit(void)
{
    _asm_file = fopen(option_output_filename, "w+");
    if (!_asm_file) {
        aux_fatal_error("failed to open output file '%s'", option_output_filename);
    }

    cursor_pos = 0;
    out_str("\n.686\n.model flat\n.xmm\n");
}

void text_output_end_unit(void)
{
    if (_asm_file) {
        out_str("\nend\n");
        fclose(_asm_file);
        _asm_file = NULL;
    }
}

void text_output_begin_data_section(void)
{
    out_fmt("\n.data\n\n");
}

void text_output_declare_uninitialized_bytes(symbol *sym, int size)
{
    if (size == 4) {
        out_fmt("_%s\tdd\t?\n", sym->sym_name);
    } else {
        out_fmt("_%s\tdb\t %d dup (?)\n", sym->sym_name, size);
    }

    out_fmt("public\t_%s\n", sym->sym_name);
}

void text_output_declare_initialized_dword(symbol *sym, long value)
{
    out_fmt("_%s\tdd\t0%xh\n", sym->sym_name, value);
    out_fmt("public\t_%s\n", sym->sym_name);
}

void text_output_declare_initialized_qword(symbol *sym, __int64 value)
{
    out_fmt("_%s\tdq\t0%I64xh\n", sym->sym_name, value);
    out_fmt("public\t_%s\n", sym->sym_name);
}

void text_output_declare_initialized_xmmword(symbol *sym, long c1, long c2, long c3, long c4)
{
    out_fmt("align 16\n");
    out_fmt("_%s\tdd\t0%xh, 0%xh, 0%xh, 0%xh\n", sym->sym_name, c1, c2, c3, c4);
    out_fmt("public\t_%s\n", sym->sym_name);
}

void text_output_declare_initialized_string(symbol *sym, const char *value)
{
    int i;
    int length = strlen(value) + 1;

    out_fmt("_%s\tdb\t", sym->sym_name);

    for (i = 0; ; i++) {
        if (i == length - 1) {
            out_fmt("%d", (unsigned char) value[i]);
            break;
        }

        if (i % 16 == 15) {
            out_fmt("%d\n\tdb\t", (unsigned char) value[i]);
        } else {
            out_fmt( "%d, ", (unsigned char) value[i]);
        }
    }

    out_ch('\n');
    out_fmt("public\t_%s\n", sym->sym_name);
}

void text_output_declare_ptr_to_relocable(symbol *ptr_sym, symbol *rel_sym)
{
    out_fmt("_%s\tdd\toffset _%s\n", ptr_sym->sym_name, rel_sym->sym_name);
    out_fmt("public\t_%s\n", ptr_sym->sym_name);
}


void text_output_begin_text_section(void)
{
    out_fmt("\n.code\n");
}


//
// ��������� ���������� ������ ��� ����������.
//

static const char *_x86_instructions[] = {
    // ���������:
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

    // ������������� ����������:
    "inc",
    "dec",
    "neg",
    "not",

    "mov",
    "add",
    "sub",
    "imul",
    "idiv",
    "mul",
    "div",
    "sal",
    "sar",
    "shl",
    "shr",
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

    // FPU ����������:
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

    // SSE2 ����������:
    "cvtsi2ss",
    "cvttss2si",
    "cvtss2sd",
    "cvtsd2ss",
    "movss",
    "movsd",

    "addss",
    "subss",
    "mulss",
    "divss",
    "comiss",
    "xorps",

    "addsd",
    "subsd",
    "mulsd",
    "divsd",
    "comisd",
    "xorpd",

    // ���������� ��� ����������� �����������.
    // �������������� ��������������:
    "imul",  // imul reg, reg/mem, const
    "lea",
    "movsx",
    "movzx",

    // ���������� ������:
    "push",
    "pop",
    "call",
    "ret",

    // ������������� read-only:
    "cmp",
    "test",

    // ������-����������:
    "cdq",
    "xor_edx_edx",
    "fucomip\tst,st(1)\n\tfstp\tst",
    "cld",
    "rep\tmovsb",
    "rep\tmovsd",
    "push_arg",
    "restore_stack",
    "set_retval",
    "read_retval",
    "label",
    "push_all",
    "pop_all",
    "create_stack_frame",
    "destroy_stack_frame",
    "comment",
};
AUX_CASSERT(AUX_ARRAY_LENGTH(_x86_instructions) == x86insn_count);

static const char *_x86_byte_registers[] = {
    "al", "cl", "dl", "bl", "ah", "ch", "dh", "bh",
};
AUX_CASSERT(AUX_ARRAY_LENGTH(_x86_byte_registers) == x86_byte_reg_count)

static const char *_x86_word_registers[] = {
    "ax", "cx", "dx", "bx", "si", "di", "bp", "sp",
};
AUX_CASSERT(AUX_ARRAY_LENGTH(_x86_word_registers) == x86_word_reg_count)

static const char *_x86_dword_registers[] = {
    "eax", "ecx", "edx", "ebx", "esi", "edi", "ebp", "esp",
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

    default:            return "";
    }
}

static void _print_insn(x86_instruction_code code)
{
    ASSERT(code < x86insn_count);
    out_fmt("\t%s", _x86_instructions[code]);
}

static void _print_reg(x86_operand_type type, int reg)
{
    switch (type) {
    case x86op_byte:
        if (reg < -x86_byte_reg_count) {
            out_fmt("byte0x%x", reg);
        } else if (reg < 0) {
            out_str(_x86_byte_registers[~reg]);
        } else {
            out_fmt("byte%d", reg);
        }
        break;

    case x86op_word:
        if (reg < -x86_word_reg_count) {
            out_fmt("word0x%x", reg);
        } else if (reg < 0) {
            out_str(_x86_word_registers[~reg]);
        } else {
            out_fmt("word%d", reg);
        }
        break;

    case x86op_dword:
        if (reg < -x86_dword_reg_count) {
            out_fmt("dword0x%x", reg);
        } else if (reg < 0) {
            out_str(_x86_dword_registers[~reg]);
        } else {
            out_fmt("dword%d", reg);
        }
        break;

    case x86op_float:
    case x86op_double:
        if (reg < -8) {
            out_fmt("sse0x%x", reg);
        } else if (reg < 0) {
            out_fmt("xmm%d", ~reg);
        } else {
            out_fmt("sse%d", reg);
        }
        break;

    default:
        ASSERT(FALSE);
    }
}

static void _print_op(x86_operand *op)
{
    BOOL was_smth = FALSE;

    switch (op->op_loc) {
    case x86loc_register:
        _print_reg(op->op_type, op->data.reg);
        break;

    case x86loc_int_constant:
        out_fmt("%d", op->data.int_val);
        break;

    case x86loc_address:
        if (op->data.address.base == 0 && op->data.address.index == 0) {
            out_fmt("ds:");
        }


        out_ch('[');

        if (op->data.address.base != 0) {
            _print_reg(x86op_dword, op->data.address.base);
            was_smth = TRUE;
        }

        if (op->data.address.index != 0) {
            if (was_smth) {
                out_ch('+');
            }

            _print_reg(x86op_dword, op->data.address.index);

            if (op->data.address.scale > 1) {
                ASSERT(op->data.address.scale == 2 || op->data.address.scale == 4 || op->data.address.scale == 8);
                out_fmt("*%d", op->data.address.scale);
            }

            was_smth = TRUE;
        }

        if (op->data.address.offset || !was_smth) {
            if (was_smth && op->data.address.offset > 0) {
                out_ch('+');
            }

            out_fmt("%d", op->data.address.offset);
        }

        out_ch(']');
        break;

    case x86loc_symbol:
        if (TYPE_IS_FUNCTION(op->data.sym.name->sym_type)) {
            ASSERT(op->data.sym.offset == 0);
            out_fmt("_%s", op->data.sym.name->sym_name);
        } else {
            if (op->data.sym.offset == 0) {
                out_fmt("%s [_%s]", _encode_hw_type(op->op_type), op->data.sym.name->sym_name);
            } else {
                out_fmt("%s [_%s+%d]", _encode_hw_type(op->op_type), op->data.sym.name->sym_name, op->data.sym.offset);
            }
        }
        break;

    case x86loc_symbol_offset:
        if (op->data.sym.offset == 0)
            out_fmt("(offset _%s)", op->data.sym.name->sym_name);
        else
            out_fmt("(offset _%s)+%d", op->data.sym.name->sym_name, op->data.sym.offset);
        break;

    case x86loc_label:
        out_fmt("label%04x", op->data.label);
        break;

    default:
        ASSERT(FALSE);
    }
}


static void _output_push_comment(const char *s1, const char *s2)
{
    out_fmt("; %s%s%s\n", s1, (s2 ? " " : ""), (s2 ? s2 : ""));
}

static void _output_push_nullary_instruction(x86_instruction_code code)
{
    _print_insn(code);
    out_ch('\n');
}

static void _output_push_unary_instruction(x86_instruction_code code, x86_operand *op)
{
    if (code == x86insn_label) {
        _print_op(op);
        out_ch(':');
    } else if (op->op_loc == x86loc_register && OP_IS_FLOAT(*op) && !option_sse2) {
        ASSERT(code < x86insn_count);
        out_fmt("\t%sp", _x86_instructions[code]);
    } else {
        _print_insn(code);
        out_ch('\t');

        if (op->op_loc == x86loc_address) {
            out_fmt("%s ", _encode_hw_type(op->op_type));
        }

        _print_op(op);
    }

    out_ch('\n');
}

static void _output_push_binary_instruction(x86_instruction_code code, x86_operand *op1, x86_operand *op2)
{
    _print_insn(code);
    out_ch('\t');

    if (op1->op_loc == x86loc_address && (op2->op_loc == x86loc_int_constant || IS_SHIFT_INSN(code))) {
        out_str("dword ptr ");
    } else if (OP_IS_ADDRESS(*op1) && OP_IS_FLOAT(*op1) && option_sse2) {
        out_fmt("%s ptr ", (op1->op_type == x86op_float ? "dword" : "qword"));
    }

    _print_op(op1);
    out_ch(',');

    if (OP_IS_ADDRESS(*op2) && (OP_IS_FLOAT(*op1) || OP_IS_FLOAT(*op2)) && option_sse2) {
        out_fmt("%s ptr ", (op2->op_type == x86op_double ? "qword" : "dword"));
    }

    _print_op(op2);
    out_ch('\n');
}

static void _output_push_ternary_instruction(x86_instruction_code code, x86_operand *op1, x86_operand *op2, int op3)
{
    _print_insn(code);
    out_ch('\t');
    _print_op(op1);
    out_ch(',');
    _print_op(op2);
    out_fmt(",%d\n", op3);
}

static void _output_push_instruction(x86_instruction *insn)
{
    if (insn->in_code == x86insn_comment) {
        _output_push_comment((char*)insn->in_op1.data.int_val, (char*)insn->in_op2.data.int_val);
    } else if (insn->in_op1.op_loc == x86loc_none) {
        _output_push_nullary_instruction(insn->in_code);
    } else if (insn->in_op2.op_loc == x86loc_none || insn->in_code == x86insn_call) {
        _output_push_unary_instruction(insn->in_code, &insn->in_op1);
    } else if (insn->in_code != x86insn_imul_const) {
        _output_push_binary_instruction(insn->in_code, &insn->in_op1, &insn->in_op2);
    } else {
        _output_push_ternary_instruction(insn->in_code, &insn->in_op1, &insn->in_op2, insn->in_op3);
    }
}

static void _output_function_code(function_desc *function)
{
    x86_instruction *insn;

    out_fmt("\n_%s proc\n", function->func_sym->sym_name);

    for (insn = function->func_binary_code; insn; insn = insn->in_next) {
        _output_push_instruction(insn);
    }

    out_fmt("_%s endp\t\n", function->func_sym->sym_name);
    fflush(_asm_file);
}


void text_output_push_function_code(function_desc *function)
{
    _output_function_code(function);
}

void text_output_debug_print_function_code(function_desc *function)
{
    FILE *old = _asm_file;

    _asm_file = stdout;
    _output_function_code(function);
    _asm_file = old;
}

