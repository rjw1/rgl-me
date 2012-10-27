#! /usr/bin/perl
#use 5.014;
use strict;
use warnings;
my $id =  $ARGV[0] or die "I need a value to shorten";
my $short = shorten($id);
print "$short\n";
sub shorten {
return $id;
};
