
use strict;
use warnings;


sub build_sln {
    my ($solution, $config) = @_;
    system("d:\\bin\\msvs12\\Common7\\IDE\\devenv.exe $solution /build $config");
}

sub run {
    my $cmd_line = shift;
    print "running '$cmd_line'...\n";
    system $cmd_line;
}

sub compile_test {
    my ($test_name, $config, $option) = @_;
    run("..\\..\\..\\bin\\$config\\cc4x86.exe $option --output-file-name current_test.asm --xmldump ..\\$test_name");

    my $test_asm_name = $test_name;
    $option =~ tr/[\-\ ]/_/s;
    $test_asm_name =~ s/\.c/_$option\.asm/;

    system("copy /Y current_test.asm ..\\asm_listings\\$test_asm_name");
    return 1;
}

sub run_test {
    my ($test_name, $config, $option) = @_;
    compile_test($test_name, $config, $option);

    system("echo const char *test_name = \"$test_name\"; >test_name.c");
    system("d:\\bin\\msvs12\\VC\\bin\\ml /Fl /nologo /c /Zf current_test.asm");

    build_sln("current_test_cc.sln", "debug");
    system("current_test_cc.exe >out.txt");

    open(FILE, "out.txt") or return;
    while (<FILE>) {
        return 1 if (/SUCCEEDED/);
        print;
    }

    return 0;
}

sub run_test2{
    my $test_name = shift;
    return
        compile_test($test_name, "release", "--optimize --noregalloc") &&
        compile_test($test_name, "debug", "") &&
        compile_test($test_name, "debug", "--optimize") &&
        compile_test($test_name, "debug", "--optimize --noinline") &&
        compile_test($test_name, "debug", "--optimize --nocopyopt") &&
        run_test($test_name, "release", "") &&
        run_test($test_name, "release", "--optimize") &&
        run_test($test_name, "release", "--optimize --noinline") &&
        run_test($test_name, "release", "--optimize --nocopyopt");
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
    run_test2("float.c") and
    run_test2("float2.c") and
    run_test2("regalloc_bug.c") and
    run_test2("redundant_copy.c")

#   run_test2("string_literal.c") and
#   run_test2("byte_word.c")
) {
    print ("ALL TESTS PASSED\n");
} else {
    print ("TEST FAILED\n");
}

