
#ifndef XML_DUMP_H__INCLUDED
#define XML_DUMP_H__INCLUDED

#if defined(_MSC_VER) && AUX_USE_PRAGMA_ONCE
#pragma once
#endif // _MSC_VER


void debug_dump_unit(const char *src_filename);


#else
#error Header xml_dump.h duplicated.
#endif // XML_DUMP_H__INCLUDED
