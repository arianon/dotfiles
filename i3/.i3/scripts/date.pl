#!/usr/bin/perl -CS

use strict;
use warnings;
use POSIX qw(strftime);

my $icon = chr(0xE0FC);
my $time = strftime "%A, %d of %B - %H:%M:%S\n", localtime;

print "$icon $time";
