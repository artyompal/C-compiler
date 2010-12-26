
use strict;
use warnings;


sub build_sln {
	my ($solution, $config) = @_;
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
	run("..\\..\\..\\bin\\$config\\cc4x86.exe $option --output-file-name current_test.asm --debug-xml-dump ..\\$test_name");

	my $test_asm_name = $test_name;
	$test_asm_name =~ s/\.c/\.asm/;
	system("copy current_test.asm ..\\$test_asm_name");
	system("echo const char *test_name = \"$test_name\"; >test_name.c");

	system("c:\\bin\\msvs8\\VC\\bin\\ml /Fl /nologo /c /Zf current_test.asm");
	build_sln("current_test_cc.sln", "debug");
	system("current_test_cc.exe >out.txt");


    open(FILE, "out.txt") or return;
	while (<FILE>) {
		return 0 if (/FAILED/);
	}

	return 1;
}

sub run_test2{
	my $test_name = shift;
	return
		run_test($test_name, "debug", "") &&
		run_test($test_name, "debug", "--optimize") &&
		run_test($test_name, "release", "") &&
		run_test($test_name, "release", "--optimize --no-inline") &&
		run_test($test_name, "release", "--optimize") &&
		run_test($test_name, "release", "--optimize --use-sse2");
}


chdir("../cc4x86/tests/regressive/current_test") or die("chdir: $!");

if (
	run_test2("simple_test.c") and
	run_test2("goto.c") and
	run_test2("while.c") and
	run_test2("while_break.c") and
	run_test2("for.c") and
	run_test2("for2.c") and
	run_test2("switch.c") and
	run_test2("div_bug.c") and
	run_test2("idiv.c") and
	run_test2("mul_div.c") and
	run_test2("shl_shr.c") and
	run_test2("float.c")
#	run_test2("string_literal.c") and
#	run_test2("byte_word.c")
) {
	print ("ALL TESTS PASSED\n");
} else {
	print ("TEST FAILED\n");
}

