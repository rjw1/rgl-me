#! /usr/bin/perl
#use 5.014;
use strict;
use warnings;
use Crypt::Skip32::Base64URLSafe;

my $key    = pack( 'H20', "34671290123419302824" );
my $cipher = Crypt::Skip32::Base64URLSafe->new($key);
my $id =  $ARGV[0] or die "I need a value to shorten";
my $short = shorten($id);
print "$short\n";
sub shorten {
    my $idarg = $_[0];
    my $shortened = $cipher->encrypt_number_b64_urlsafe($idarg);
    return $shortened;
};
