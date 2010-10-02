
use strict;
use warnings;


sub build_compilers2 {
	my $config = shift;

	print "building $config configuration...\n";
	system("c:\\bin\\msvs8\\Common7\\IDE\\devenv compilers2.sln /build $config") == 0
		or die("build failed");
}

sub run {
	my $cmd_line = shift;
	print "running '$cmd_line'...\n";
	system $cmd_line;
}


system("perl kill_trailing_spaces.pl");

print "building parser and lexer...\n";
chdir("../frontend_cc/scripts") or die("chdir: $!");
do("make_lexer.pl");
do("make_parser.pl");

chdir("../../scripts") or die("chdir: $!");
print "making TODO list...\n";
do("find_missed.pl") == 0 or die("find_missed.pl is absent or misconfigured: $!");

chdir("../") or die("../src: $!");
build_compilers2("Debug");
build_compilers2("Release");


chdir("./cc4x86/bin/release/") or die("../bin: $!");

# generate XML
run("cc4x86.exe --debug_disable_codegen ..\\..\\tests\\rasterizer.c");

# generate unoptimized listing
run("cc4x86.exe --debug_disable_basic_opt --debug_disable_regalloc --output_file_name ..\\..\\tests\\rasterizer__unoptimized.asm ..\\..\\tests\\rasterizer.c");

# generate optimized listing with pseudo-registers
run("cc4x86.exe --optimize --debug_disable_regalloc --output_file_name ..\\..\\tests\\rasterizer__pseudo_registers.asm ..\\..\\tests\\rasterizer.c");

# generate finally optimized listing
run("cc4x86.exe --optimize ..\\..\\tests\\rasterizer.c");

system("ml /Fl current_test.asm"); # == 0 or die("ml failed");


system("pause");

