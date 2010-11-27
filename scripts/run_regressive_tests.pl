
use strict;
use warnings;


sub build_sln {
	my ($solution, $config) = @_;

	print "building $config configuration...\n";
	system("c:\\bin\\msvs8\\Common7\\IDE\\devenv $solution /build $config") == 0
		or die("build failed");
}

sub run {
	my $cmd_line = shift;
	print "running '$cmd_line'...\n";
	system $cmd_line;
}

sub run_test {
	my ($test_name, $config, $option) = @_;
	run("..\\..\\..\\bin\\$config\\cc4x86.exe $option --output_file_name current_test.asm --debug_xml_dump ..\\$test_name");

	my $test_asm_name = $test_name;
	$test_asm_name =~ s/\.c/\.asm/;
	system("copy current_test.asm ..\\$test_asm_name");

	system("c:\\bin\\msvs8\\VC\\bin\\ml /Fl /nologo /c /Zf current_test.asm");
	build_sln("current_test_cc.sln", "debug");
	system("current_test_cc.exe");
}

sub run_test2 {
	my $test_name = shift;

	run_test($test_name, "release", "");
	run_test($test_name, "release", "--optimize");
	run_test($test_name, "debug", "");
	run_test($test_name, "debug", "--optimize");
}

chdir("../cc4x86/tests/regressive/current_test") or die("chdir: $!");
run_test2("simple_test.c");
run_test2("goto.c");
run_test2("while.c");
run_test2("while_break.c");
run_test2("for.c");
run_test2("for2.c");
run_test2("switch.c");
run_test2("div_bug.c");
run_test2("idiv.c");
#run_test2("string_literal.c");
