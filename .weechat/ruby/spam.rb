#!/usr/bin/env ruby

def randcolor(str)
  color = rand(3..13)
  "\x03#{color}#{str}\x03"
end

def spam(_, buffer, msg)
  chars = msg.upcase.chars.map { |word| randcolor(word) }

  Weechat.command(buffer, chars.join(' '))
end

def superspam(_, buffer, msg)
  chars = msg.upcase.chars.map { |char| randcolor(char) }

  Weechat.command(buffer, chars.join(' '))
  chars.shift
  chars.each do |char|
    Weechat.command(buffer, randcolor(char))
  end

  Weechat::WEECHAT_RC_OK
end

def weechat_init
  Weechat.register('spam',
                   'arianon',
                   '1.0',
                   'beerware',
                   'Epic spamming',
                   '',
                   '')

  Weechat.hook_command('spam', '', 'TEXT', '', '', 'spam', '')
  Weechat.hook_command('sspam', '', 'TEXT', '', '', 'superspam', '')
end
