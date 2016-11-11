#!/usr/bin/env ruby

def colorize(s)
  color = rand(3..13)
  "\x03#{color}#{s}\x03"
end

def emphasis(_, _, _, msg)
  msg.gsub(/`(.+?)`/, colorize('`\1`') + (msg.start_with?("\x033>") ? "\x033" : ''))
end

def weechat_init
  Weechat.register('emphasis',
                   'arianon',
                   '1.0',
                   'beerware',
                   'Emphatize text.',
                   '',
                   '')

  Weechat.hook_modifier('input_text_for_buffer', 'emphasis', '')
end
