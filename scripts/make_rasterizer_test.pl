

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

run("--sse2 --xmldump --nocodegen");            # generate XML
run("--sse2 --nobasicopt --noregalloc");        # generate very unoptimized listing
run("--sse2 --noregalloc");                     # generate unoptimized listing
run("--sse2 --optimize --noregalloc");          # generate optimized listing with pseudo-registers

run("--optimize");                              # generate non-SSE optimized listing
run("--optimize --noinline");                   # generate non-SSE noinline optimized listing
run("--sse2 --optimize --noinline");            # generate noinline optimized listing
run("--sse2 --optimize");                       # generate finally optimized listing

system("del ..\\..\\tests\\visual\\rasterizer\\rasterizer.asm");
system("rename ..\\..\\tests\\visual\\rasterizer\\rasterizer__sse2_optimize.asm rasterizer.asm");

assemble("rasterizer.asm");
assemble("rasterizer__optimize.asm");
assemble("rasterizer__optimize_noinline.asm");
assemble("rasterizer__sse2_optimize_noinline.asm");
