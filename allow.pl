#!/usr/bin/env perl
use strict; use warnings;
use feature 'say';

my $phone_number = $ARGV[0];
my $name = $ARGV[1];
my %tbl;
while( <DATA> ) {
    chomp;
    my @line = split(/,/);
    $tbl{$line[0]} = $line[1];
}
if (exists $tbl{$phone_number}) {
    print("preapproved");
    exit(0);
}
my @WiAreaCode = ('920', '414', '715', '608', '262' );
if (length($phone_number) == 10) {
    # we have a number
    my $ac = substr $phone_number,0,3;
#    say $ac;
    if (grep(/$ac/, @WiAreaCode)) {
        print "WiAC";
        exit(0);
    } 
    if (($name =~ /Aurora/i) or ($name =~ /Walmart/i)){
        print("preapproved");
        exit(0);
    }
    print "CAPTCHA";
    exit(1);
}

# got a bunch of junk
print "CAPTCHA";
exit(1);

__DATA__
OBITRUNK1,OBITRUNK1
8888675309,Jenny
