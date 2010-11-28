
use strict;
use warnings;


my $files = 0;

sub parse {
	my $name = shift;
	my $content;

    open(FILE, "+<$name") or return;

    while (<FILE>) {
		if (/^\x20+$/) {
			$content = $content . "\n";
		} elsif (/(.*[^\x20])\x20+$/) {
			$content = $content . "$1\n";
		} else {
			$content = $content . $_;
		}
    }

	seek(FILE, 0, 0);
    truncate(FILE, 0);
    print FILE $content;

	$files++;
}

sub walk {
    my $dirname = shift;
	my $infile;

    opendir(DIR, $dirname) or die "can't opendir $dirname: $!";
    while (defined($infile = readdir(DIR))) {
        parse("$dirname/$infile");
    }
}


walk("../cc4x86/src/headers");
walk("../cc4x86/src/src");
walk("../cc4x86/tests/regressive");
walk("../frontend_cc/src/headers");
walk("../frontend_cc/src/src");

print "kill_trailing_spaces.pl: $files files proceeded\n";

