

sub run {
    my $options = shift;
    my $filename = $options;
    $filename =~ tr/[\-\ ]/_/s;

    $cmd_line = "cc4x86.exe $options --output-file-name ..\\..\\tests\\visual\\rasterizer\\rasterizer_$filename.asm ..\\..\\tests\\visual\\rasterizer\\rasterizer.c";
    print "running '$cmd_line'...\n";
    system $cmd_line;
}

sub assemble {
    my $filename = shift;
    chdir("../../tests/visual/rasterizer") or die("chdir: $!");
    system("d:\\bin\\msvs2012\\VC\\bin\\ml /Fl /nologo $filename");
    chdir("../../../../cc4x86/bin/release/") or die("chdir: $!");
}


chdir("../cc4x86/bin/release/") or die("chdir: $!");

run("--xmldump --nocodegen");

run("--noregalloc");
run("--noregalloc --optimize");
run("--noregalloc --optimize --noinline");
run("--noregalloc --optimize --nocopyopt");
run("--noregalloc --nobasicopt");

run("");
run("--optimize");
run("--optimize --noinline");
run("--optimize --nocopyopt");
run("--nobasicopt");

assemble("rasterizer_.asm");
assemble("rasterizer__optimize.asm");
assemble("rasterizer__optimize_noinline.asm");
assemble("rasterizer__optimize_nocopyopt.asm");

chdir("../../tests/visual/rasterizer") or die("chdir: $!");
system("del *.lst");
system("del *.obj");
chdir("../../../../cc4x86/bin/release/") or die("chdir: $!");
