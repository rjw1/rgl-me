#!perl
#use 5.014;
use strict;
use warnings;
my $id = "2345";
my $short = shorten($id);
print "$short\n";

sub shorten {
return $id;
};
