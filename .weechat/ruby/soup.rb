#!/usr/bin/env ruby

def randcolor(str)
  color = rand(3..13)
  "\x03#{color}#{str}\x03"
end

def soup(_, buffer, msg)
  chars = msg.upcase.delete(' ').chars

  chars.length.times do
    colored_chars = chars.map { |char| randcolor(char) }.join(' ')
    Weechat.command(buffer, colored_chars)
    chars.rotate!
  end

  Weechat::WEECHAT_RC_OK
end

def weechat_init
  Weechat.register('soup',
                   'arianon',
                   '1.0',
                   'beerware',
                   'Word soup',
                   '',
                   '')

  Weechat.hook_command('soup', '', 'TEXT', '', '', 'soup', '')
end
