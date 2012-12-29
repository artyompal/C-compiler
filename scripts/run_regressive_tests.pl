
use strict;
use warnings;


sub build_sln {
    my ($solution, $config) = @_;
    system("d:\\bin\\msvs2012\\Common7\\IDE\\devenv.exe $solution /build $config");
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
    system("d:\\bin\\msvs2012\\VC\\bin\\ml /Fl /nologo /c /Zf current_test.asm");

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
    run_test2("basic__simple_test.c") and
    run_test2("basic__goto.c") and
    run_test2("basic__while.c") and
    run_test2("basic__while_break.c") and
    run_test2("basic__for.c") and
    run_test2("basic__for2.c") and
    run_test2("basic__switch.c") and
    run_test2("basic__div_bug.c") and
    run_test2("basic__idiv.c") and
    run_test2("basic__mul_div.c") and
    run_test2("basic__shl_shr.c") and
    run_test2("basic__float.c") and
    run_test2("basic__float2.c") and
    run_test2("basic__regalloc_bug.c") and
    run_test2("basic__redundant_copy.c") and

#    run_test2("mem__aliasing.c") and
#    run_test2("mem__structure.c") and
    run_test2("mem__union.c")

#   run_test2("string_literal.c") and
#   run_test2("byte_word.c")
) {
    print ("ALL TESTS PASSED\n");
} else {
    print ("TEST FAILED\n");
}

