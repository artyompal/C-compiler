

sub run {
	my $cmd_line = shift;
	print "running '$cmd_line'...\n";
	system $cmd_line;
}


chdir("../cc4x86/bin/release/") or die("../bin: $!");

# generate XML
run("cc4x86.exe --debug_disable_codegen ..\\..\\tests\\rasterizer.c");

# generate unoptimized listing
run("cc4x86.exe --debug_disable_basic_opt --debug_disable_regalloc --output_file_name ..\\..\\tests\\rasterizer__unoptimized.asm ..\\..\\tests\\rasterizer.c");

# generate optimized listing with pseudo-registers
run("cc4x86.exe --optimize --debug_disable_regalloc --output_file_name ..\\..\\tests\\rasterizer__pseudo_registers.asm ..\\..\\tests\\rasterizer.c");

# generate finally optimized listing
run("cc4x86.exe --optimize ..\\..\\tests\\rasterizer.c");

system("c:\\bin\\msvs8\\VC\\bin\\ml /Fl ..\\..\\tests\\rasterizer.asm");

