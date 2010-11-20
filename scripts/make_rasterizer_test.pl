

sub run {
	my $cmd_line = shift;
	print "running '$cmd_line'...\n";
	system $cmd_line;
}


chdir("../cc4x86/bin/release/") or die("chdir: $!");

# generate XML
run("cc4x86.exe --debug_xml_dump --debug_disable_codegen ..\\..\\tests\\visual\\rasterizer\\rasterizer.c");

# generate very unoptimized listing
run("cc4x86.exe --debug_disable_basic_opt --debug_disable_regalloc --output_file_name ..\\..\\tests\\visual\\rasterizer\\rasterizer__raw.asm ..\\..\\tests\\visual\\rasterizer\\rasterizer.c");

# generate unoptimized listing
run("cc4x86.exe --debug_disable_regalloc --output_file_name ..\\..\\tests\\visual\\rasterizer\\rasterizer__unoptimized.asm ..\\..\\tests\\visual\\rasterizer\\rasterizer.c");

# generate optimized listing with pseudo-registers
run("cc4x86.exe --optimize --debug_disable_regalloc --output_file_name ..\\..\\tests\\visual\\rasterizer\\rasterizer__pseudo_registers.asm ..\\..\\tests\\visual\\rasterizer\\rasterizer.c");

# generate finally optimized listing
run("cc4x86.exe --optimize ..\\..\\tests\\visual\\rasterizer\\rasterizer.c");

# assemble the test
chdir("../../tests/visual/rasterizer") or die("chdir: $!");
system("c:\\bin\\msvs8\\VC\\bin\\ml /Fl /nologo rasterizer.asm");

chdir("../../../../scripts") or die("chdir: $!");
