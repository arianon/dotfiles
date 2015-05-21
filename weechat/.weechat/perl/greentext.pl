#!/usr/bin/env perl -w
use strict;
use utf8;

sub quote_cb {
	my ($data, $mod, $mod_data, $msg) = @_;

	# green for greentext
	my $i = 3;
	
	if (substr($msg, 0, 1) eq ">") {
		$msg = "\x03" . $i . $msg;
	}

	return $msg;
}

weechat::register("greentext.pl", "arianon", "1.0", "beerware", "Automatic greentexting", "", "");
weechat::hook_modifier("input_text_for_buffer", "quote_cb", "");
