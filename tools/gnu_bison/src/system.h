
#ifndef BISON_SYSTEM_H
#define BISON_SYSTEM_H


#include <ctype.h>
#include <stdlib.h>
#include <process.h>
#include <memory.h>
#include <string.h>


#define getpid _getpid

#ifndef bcopy
#define bcopy(src, dst, num) memcpy((dst), (src), (num))
#endif


#define PARAMS(s)		s


#define VERSION_STRING	"Win32 bison -- compiled by Palvelev Artyom [cppguru@mail.ru]"


#define _(s)			s


#endif  /* BISON_SYSTEM_H */
