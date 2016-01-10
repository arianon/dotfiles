#!/usr/bin/env ruby

def greentext(_, _, _, msg)
  msg = "\x033#{msg}" if msg.start_with? '>'
  msg
end

def weechat_init
  Weechat.register('greentext',
                   'arianon',
                   '1.0',
                   'beerware',
                   'Automatic greentexting',
                   '',
                   '')

  Weechat.hook_modifier('input_text_for_buffer', 'greentext', '')
end
