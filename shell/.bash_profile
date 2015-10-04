
# ~/.bash_profile
#

export XDG_CONFIG_HOME="$HOME/.config"

# SOFTWARE
export BROWSER="chromium"
export EDITOR="vim"
export VISUAL=$EDITOR
export PAGER="less"
export SXHKD_SHELL="/bin/sh"

# LANG
export LANG="en_US.UTF-8"
# export LC_ALL="en_US.UTF-8"

# PATHS
export LOCAL="$HOME/local"
export TMPDIR="/tmp"
export MAIL="$HOME/var/mail"

# HASKELL
export PATH=~/.cabal/bin:$PATH

# GO
export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$PATH

# RUBY
export PATH=~/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# LUA
eval "$(luarocks path --bin)"

# MY SCRIPTS
export PATH=~/bin:$PATH

# BSPWM
export BSPWM_TREE=/tmp/bspwm.tree
export BSPWM_HISTORY=/tmp/bspwm.history
export BSPWM_STACK=/tmp/bspwm.stack

[[ -f ~/.bashrc ]] && . ~/.bashrc
