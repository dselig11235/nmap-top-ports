#!/usr/bin/perl

use Cwd 'abs_path';
use File::Basename;

#$datapath='/root/tools/nmap-top-ports';
$datapath = dirname(abs_path($0));

my ($proto, $start, $stop)=@ARGV;

open(my $pfile, "<", "$datapath/all.sorted.$proto")
    or die "Can't open $datapath/all.sorted.$proto";
my @ports;
while (<$pfile>) {
    chomp;
    push @ports, $_;
}
print uc(substr $proto, 0, 1), ":", join(',', @ports[$start..$stop]), "\n";
