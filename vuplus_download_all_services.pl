#!/usr/bin/perl
# 2018/12/31 Josef Kubin
#
# dnf install -y perl-JSON perl-LWP-Protocol-connect
#
# output is pair:
# service	name

use strict;
use warnings;
use diagnostics;

binmode (STDERR,  ":utf8");
binmode (STDOUT,  ":utf8");
#use Data::Dumper;
use JSON;
use LWP::UserAgent;

my $vuplus = 'ip_address_or_hostname';
my $url = 'http://'. $vuplus . '/api/getservices?sRef=1:7:1:0:0:0:0:0:0:0:(type%20==%201)%20||%20(type%20==%2017)%20||%20(type%20==%20195)%20||%20(type%20==%2025)%20||%20(type%20==%2022)%20||%20(type%20==%2031)%20||%20(type%20==%20211)%20ORDER%20BY%20name';
my $ua = LWP::UserAgent->new;
my $response = $ua->get($url);
my $raw = $response->decoded_content;
my $res = decode_json($raw);

# JSON debugger
#print Dumper($res);

foreach my $srv (@{$res->{'services'}})
{
	print $srv->{'servicereference'} . "\t" . $srv->{'servicename'} . "\n";
}
