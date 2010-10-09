
#ifndef DEBUG_H__INCLUDED
#define DEBUG_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


void debug_dump_unit(const char *src_filename);


#else
#error Header debug.h duplicated.
#endif // DEBUG_H__INCLUDED
