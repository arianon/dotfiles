# UTF-8
set -x LANG en_US.UTF-8

# 256 color terminal.
if echo $TERM | grep -qv '256color$'
    set -x TERM xterm-256color
end

# Disable greeting
set fish_greeting

# Set defaults
set -x BROWSER chromium
set -x EDITOR vim
set -x VISUAL $EDITOR
