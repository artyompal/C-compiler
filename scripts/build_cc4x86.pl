
use strict;
use warnings;


sub build_compilers2 {
	my $config = shift;

	print "building $config configuration...\n";
	system("c:\\bin\\msvs8\\Common7\\IDE\\devenv compilers2.sln /build $config") == 0
		or die("build failed");
}

sub run {
	my $cmd_line = shift;
	print "running '$cmd_line'...\n";
	system $cmd_line;
}


system("perl kill_trailing_spaces.pl");

print "building parser and lexer...\n";
chdir("../frontend_cc/scripts") or die("chdir: $!");
do("make_lexer.pl");
do("make_parser.pl");

chdir("../../scripts") or die("chdir: $!");
print "making TODO list...\n";
do("find_missed.pl") == 0 or die("find_missed.pl is absent or misconfigured: $!");

chdir("../") or die("chdir: $!");
build_compilers2("Debug");
build_compilers2("Release");
chdir("./scripts") or die("chdir: $!");

system("perl make_rasterizer_test.pl");
system("perl run_regressive_tests.pl");

system("pause");

