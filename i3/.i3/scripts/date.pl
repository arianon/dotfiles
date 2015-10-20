#!/usr/bin/env perl

use strict;
use warnings;
use POSIX qw(strftime);

for (;;) {
  print strftime " %A, %d of %B - %H:%M:%S\n", localtime;
  sleep(1)
}
