#! /usr/bin/perl
use strict;
use warnings;
use Crypt::Skip32::Base64URLSafe;
use DBI;
my $dbh = DBI->connect("DBI:mysql:database=short;host=localhost",
                         "short", "short",
                         {'RaiseError' => 1});

my $key    = pack( 'H20', "34671290123419302824" );
my $url =  $ARGV[0] or die "I need a value to shorten";
my $id = $dbh->selectrow_array("select id from url where url = ?",undef,$url) or die "url doenst exist";
$dbh->disconnect();
my $short = shorten($id,$key);
print "$short\n";

sub shorten {
    my $idarg = $_[0];
    my $keyarg = $_[1];
    my $cipher = Crypt::Skip32::Base64URLSafe->new($keyarg);
    my $shortened = $cipher->encrypt_number_b64_urlsafe($idarg);
    return $shortened;
};
