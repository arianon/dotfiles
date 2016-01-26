require "awesome_print"
AwesomePrint.pry!

if ENV["INSIDE_EMACS"] || ENV["TERM"] == 'emacs'
  Pry.config.pager = false
  Pry.config.correct_indent = false
  Pry.config.auto_indent = false
end

Pry.config.color = true

Pry.prompt = Pry::SIMPLE_PROMPT

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'ss', 'show-source'
end

