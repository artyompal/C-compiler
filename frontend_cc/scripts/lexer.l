
%option noyywrap
%option never-interactive
%option nostdinit


%{

#define YY_SKIP_YYWRAP
#define YY_NO_UNPUT
#define YY_STACK_USED           0
#define YY_ALWAYS_INTERACTIVE   0
#define YY_NEVER_INTERACTIVE    1
#define YY_MAIN                 0


#include "common.h"
#include "lexer_actions.h"
#include "parser.h"
#include "parser_codes.h"

%}


cpp_comment         \/\/[^\n]*
comment_body        ([^\*]|(\*[^\/]))*
comment             \/\*{comment_body}\*\/
whitespace          ([ \t\r\n\v\a])+|{comment}|{cpp_comment}

identifier          [_a-zA-Z][_0-9a-zA-Z]*
integer_literal     (0[0-7]*)|([0-9]+)|(0x[0-9a-fA-F]+)

floating_literal    ({fractional_constant}{exponent_part}?|[0-9]+{exponent_part}){floating_suffix}?
fractional_constant ([0-9]*\.[0-9]+)|([0-9]+\.)
exponent_part       [eE][+-]?[0-9]+
floating_suffix     [fFlL]

string_literal		\"([^"\n\\]|\\[^\n])*\"
character_literal	\'([^\n'\\]|\\[^\n]^)\'

bad_number          [0-9]+[_0-9a-zA-Z]*

%%

{whitespace} {
    token_whitespace(yytext, yyleng);
}

{identifier} {
    return token_identifier(yytext, yyleng);
}

{integer_literal} {
    return token_integer_literal(yytext, yyleng);
}

{floating_literal} {
    return token_float_literal(yytext, yyleng);
}

{string_literal} {
    return token_string_literal(yytext, yyleng);
}

{character_literal} {
    return token_character_literal(yytext, yyleng);
}

{bad_number} {
    token_bad_number(yytext, yyleng);
}


"->"           {  return lxm_arrow;         }
"++"           {  return lxm_inc;           }
"--"           {  return lxm_dec;           }
"<<"           {  return lxm_shl;           }
">>"           {  return lxm_shr;           }
"<="           {  return lxm_le;            }
">="           {  return lxm_ge;            }
"=="           {  return lxm_eq;            }
"!="           {  return lxm_ne;            }
"&&"           {  return lxm_bool_and;      }
"||"           {  return lxm_bool_or;       }

"*="           {  return lxm_mul_assign;    }
"/="           {  return lxm_div_assign;    }
"%="           {  return lxm_mod_assign;    }
"+="           {  return lxm_add_assign;    }
"-="           {  return lxm_sub_assign;    }
"<<="          {  return lxm_shl_assign;    }
">>="          {  return lxm_shr_assign;    }
"&="           {  return lxm_and_assign;    }
"^="           {  return lxm_xor_assign;    }
"|="           {  return lxm_or_assign;     }

"..."          {  return lxm_ellipsis;      }

[\+\-\*\/\%\{\}\[\]\(\),;:\?<>=!&|\^\.]   { return yytext[0]; }

.              {  token_bad_character(yytext[0]); }


%%
