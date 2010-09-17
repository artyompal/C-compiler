
#ifndef KEYWORDS_H__INCLUDED
#define KEYWORDS_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


int keyword_lookup(const char *token, int token_len);


#else
#error Header keywords.h duplicated.
#endif // KEYWORDS_H__INCLUDED
