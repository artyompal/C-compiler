

sub run {
	my $cmd_line = shift;
	print "running '$cmd_line'...\n";
	system $cmd_line;
}

sub assemble {
	my $filename = shift;
	chdir("../../tests/visual/rasterizer") or die("chdir: $!");
	system("c:\\bin\\msvs8\\VC\\bin\\ml /Fl /nologo $filename");
	chdir("../../../../cc4x86/bin/release/") or die("chdir: $!");
}


chdir("../cc4x86/bin/release/") or die("chdir: $!");

# generate XML
run("cc4x86.exe --use-sse2 --debug-xml-dump --debug-disable-codegen ..\\..\\tests\\visual\\rasterizer\\rasterizer.c");

# generate very unoptimized listing
run("cc4x86.exe --use-sse2 --debug-disable-basic-opt --debug-disable-regalloc --output-file-name ..\\..\\tests\\visual\\rasterizer\\rasterizer__raw.asm ..\\..\\tests\\visual\\rasterizer\\rasterizer.c");

# generate unoptimized listing
run("cc4x86.exe --use-sse2 --debug-disable-regalloc --output-file-name ..\\..\\tests\\visual\\rasterizer\\rasterizer__unoptimized.asm ..\\..\\tests\\visual\\rasterizer\\rasterizer.c");

# generate optimized listing with pseudo-registers
run("cc4x86.exe --use-sse2 --optimize --debug-disable-regalloc --output-file-name ..\\..\\tests\\visual\\rasterizer\\rasterizer__pseudo_registers.asm ..\\..\\tests\\visual\\rasterizer\\rasterizer.c");

# generate non-SSE no-inline optimized listing with pseudo-registers
run("cc4x86.exe --optimize --no-inline --output-file-name ..\\..\\tests\\visual\\rasterizer\\rasterizer__no_inline__no_sse.asm ..\\..\\tests\\visual\\rasterizer\\rasterizer.c");
assemble("rasterizer__no_inline__no_sse.asm");

# generate non-SSE optimized listing
run("cc4x86.exe --optimize --output-file-name ..\\..\\tests\\visual\\rasterizer\\rasterizer__no_sse.asm ..\\..\\tests\\visual\\rasterizer\\rasterizer.c");
assemble("rasterizer__no_sse.asm");

# generate no-inline optimized listing with pseudo-registers
run("cc4x86.exe --use-sse2 --optimize --no-inline --output-file-name ..\\..\\tests\\visual\\rasterizer\\rasterizer__no_inline.asm ..\\..\\tests\\visual\\rasterizer\\rasterizer.c");
assemble("rasterizer__no_inline.asm");

# generate finally optimized listing
run("cc4x86.exe --use-sse2 --optimize ..\\..\\tests\\visual\\rasterizer\\rasterizer.c");
assemble("rasterizer.asm");

