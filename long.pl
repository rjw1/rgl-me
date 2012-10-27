#! /usr/bin/perl
#use 5.014;
use strict;
use warnings;
use Crypt::Skip32::Base64URLSafe;
use DBI;
my $dbh = DBI->connect("DBI:mysql:database=short;host=localhost",
                         "short", "short",
                         {'RaiseError' => 1});



my $key    = pack( 'H20', "34671290123419302824" );
my $id =  $ARGV[0] or die "I need a value to shorten";
my $short = shorten($id,$key);
my $url = $dbh->selectrow_array("select url from url where id = ?",undef,$short) or die "id doenst exist";
$dbh->disconnect();

print "$url\n";
sub shorten {
    my $idarg = $_[0];
    my $keyarg = $_[1];
    my $cipher = Crypt::Skip32::Base64URLSafe->new($keyarg);
    my $shortened = $cipher->decrypt_number_b64_urlsafe($idarg);
    return $shortened;
};
