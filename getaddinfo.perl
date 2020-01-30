#!/usr/bin/perl

use Sys::Hostname;
use Socket qw(:addrinfo SOCK_RAW);

my $hostname = hostname();
my ($err, @res) = getaddrinfo($hostname, "", {socktype => SOCK_RAW});
die "$err" if $err;

while( my $ai = shift @res ) {
    my ($err, $ipaddr) = getnameinfo($ai->{addr}, NI_NUMERICHOST, NIx_NOSERV);
    die "$err" if $err;
    print "$hostname -> $ipaddr\n";
}