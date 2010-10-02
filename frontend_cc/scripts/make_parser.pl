
use strict;
use warnings;


unlink("parser.c");
unlink("parser_defs.h");

chdir "..\\..\\tools\\gnu_bison\\bin" or die "chdir failed: $!";
system "bison.exe -v --output=parser.c --defines d:\\prog\\compilers2\\frontend_cc\\scripts\\parser.y >bison.output";
chdir "d:\\prog\\compilers2\\frontend_cc\\scripts" or die "chdir failed: $!";

rename("..\\..\\tools\\gnu_bison\\bin\\parser.h", 		"..\\src\\headers\\parser_codes.h") or die "error: $!";
rename("..\\..\\tools\\gnu_bison\\bin\\parser.c", 		"..\\src\\src\\parser.c") or die "error: $!";
rename("..\\..\\tools\\gnu_bison\\bin\\parser.output", 	".\\parser.output") or die "error: $!";
rename("..\\..\\tools\\gnu_bison\\bin\\bison.output", 	".\\bison.output") or die "error: $!";

system "type bison.output";

