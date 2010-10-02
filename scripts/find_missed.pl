
use strict;
use warnings;


my $infile;
my $item;


sub parse {
	my ($name, $filename) = @_;

    open(FILE, $name) or return;
    while (<FILE>) {
    	if (/((TODO|FIXME|unimplemented).*)$/i) {
    		printf OUTFILE "%-20s%s\n", "$filename:", $1;
    	}
    }
}

sub walk {
    my $dirname = shift;

    opendir(DIR, $dirname) or die "can't opendir $dirname: $!";
    while (defined($infile = readdir(DIR))) {
        parse("$dirname/$infile", $infile);
    }
}


open(OUTFILE, ">todo_missed.txt");

walk("../cc4x86/src/headers");
walk("../cc4x86/src/src");
walk("../frontend_cc/src/headers");
walk("../frontend_cc/src/src");


