# 256 color terminal.
if echo $TERM | grep -qv '256color$'
    set -x TERM xterm-256color
end

# Disable greeting
set fish_greeting

# Set PATH
# set -x PATH $HOME/bin $HOME/.rbenv/bin $PATH

if status --is-interactive
    . (rbenv init -|psub)
end
