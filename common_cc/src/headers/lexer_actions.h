
#ifndef LEXER_ACTIONS_H__INCLUDED
#define LEXER_ACTIONS_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


void    token_whitespace        (const char *token, int token_len);
int     token_identifier        (const char *token, int token_len);
int     token_integer_literal   (const char *token, int token_len);
int     token_float_literal     (const char *token, int token_len);
int     token_string_literal    (const char *token, int token_len);
int     token_character_literal (const char *token, int token_len);
void    token_bad_number        (const char *token, int token_len);
void    token_bad_character     (char c);
void    token_bad_literal       (void);


#else
#error Header lexer_actions.h duplicated.
#endif // LEXER_ACTIONS_H__INCLUDED
