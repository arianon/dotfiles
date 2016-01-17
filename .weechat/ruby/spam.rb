#!/usr/bin/env ruby

def spam(_, buffer, msg)
  words = msg.upcase.split(' ').map { |word| "\x03" << rand(3..14) << word }

  Weechat.print(buffer, words.join(' '))
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
end
