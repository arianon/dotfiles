#!/usr/bin/env ruby

def emphasis(_, _, _, msg)
  msg.gsub(/`(.+?)`/, "\x03#{rand(3..13)}`\\1`\x03")
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
