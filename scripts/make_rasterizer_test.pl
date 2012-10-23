

sub run {
	my $cmd_line = shift;
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

# generate XML
run("cc4x86.exe --sse2 --xmldump --nocodegen ..\\..\\tests\\visual\\rasterizer\\rasterizer.c");

# generate very unoptimized listing
run("cc4x86.exe --sse2 --nobasicopt --noregalloc --output-file-name ..\\..\\tests\\visual\\rasterizer\\rasterizer__raw.asm ..\\..\\tests\\visual\\rasterizer\\rasterizer.c");

# generate unoptimized listing
run("cc4x86.exe --sse2 --noregalloc --output-file-name ..\\..\\tests\\visual\\rasterizer\\rasterizer__unoptimized.asm ..\\..\\tests\\visual\\rasterizer\\rasterizer.c");

# generate optimized listing with pseudo-registers
run("cc4x86.exe --sse2 --optimize --noregalloc --output-file-name ..\\..\\tests\\visual\\rasterizer\\rasterizer__pseudo_registers.asm ..\\..\\tests\\visual\\rasterizer\\rasterizer.c");

# generate non-SSE noinline optimized listing
run("cc4x86.exe --optimize --noinline --output-file-name ..\\..\\tests\\visual\\rasterizer\\rasterizer__no_inline__no_sse.asm ..\\..\\tests\\visual\\rasterizer\\rasterizer.c");
assemble("rasterizer__no_inline__no_sse.asm");

# generate non-SSE optimized listing
run("cc4x86.exe --optimize --output-file-name ..\\..\\tests\\visual\\rasterizer\\rasterizer__no_sse.asm ..\\..\\tests\\visual\\rasterizer\\rasterizer.c");
assemble("rasterizer__no_sse.asm");

# generate noinline optimized listing with pseudo-registers
run("cc4x86.exe --sse2 --optimize --noinline --output-file-name ..\\..\\tests\\visual\\rasterizer\\rasterizer__no_inline.asm ..\\..\\tests\\visual\\rasterizer\\rasterizer.c");
assemble("rasterizer__no_inline.asm");

# generate finally optimized listing
run("cc4x86.exe --sse2 --optimize ..\\..\\tests\\visual\\rasterizer\\rasterizer.c");
assemble("rasterizer.asm");

