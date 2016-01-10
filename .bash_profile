
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
export TMPDIR="/tmp"
export MAIL="$HOME/var/mail"

# HASKELL
if hash 2>/dev/null cabal; then
	export PATH=~/.cabal/bin:$PATH
fi

# GO
if hash 2>/dev/null go; then
	export GOPATH=$HOME/.go
	export PATH=$GOPATH/bin:$PATH
fi

# RUBY
if hash 2>/dev/null rbenv; then
	export PATH=~/.rbenv/bin:$PATH
	eval "$(rbenv init -)"
fi

# LUA
if hash 2>/dev/null luarocks; then
	eval "$(luarocks path --bin)"
fi

# MY SCRIPTS
export PATH=~/bin:$PATH

[[ -f ~/.bashrc ]] && . ~/.bashrc
