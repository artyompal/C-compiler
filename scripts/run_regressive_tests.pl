
use strict;
use warnings;


sub build_sln {
	my $solution = shift;
	my $config = shift;

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
	my $test_name = shift;

	run("..\\..\\..\\bin\\release\\cc4x86.exe --optimize --output_file_name current_test.asm --debug_xml_dump ..\\$test_name");

	my $test_asm_name = $test_name;
	$test_asm_name =~ s/\.c/\.asm/;
	system("copy current_test.asm ..\\$test_asm_name");

	system("c:\\bin\\msvs8\\VC\\bin\\ml /Fl /nologo /c /Zf current_test.asm");
	build_sln("current_test_cc.sln", "debug");
	system("current_test_cc.exe");
}


chdir("../cc4x86/tests/regressive/current_test") or die("chdir: $!");
run_test("simple_test.c");
run_test("goto.c");
run_test("while.c");
run_test("while_break.c");
run_test("for.c");
run_test("for2.c");
run_test("switch.c");

