
#ifndef KEYWORDS_HASH_H__INCLUDED
#define KEYWORDS_HASH_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


int keywords_hash_function(const char *text, int text_len);


#else
#error Header keywords_hash.h duplicated.
#endif // KEYWORDS_HASH_H__INCLUDED
