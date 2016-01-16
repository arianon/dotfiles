HISTFILE=~/.zhistory
HISTSIZE=8000
SAVEHIST=8000

typeset -U path

# Options
setopt histallowclobber
setopt nonomatch
setopt NO_clobber
setopt interactivecomments
setopt correct
setopt autocd
setopt complete_in_word
setopt hist_ignore_dups
setopt inc_append_history
setopt extended_history
setopt share_history
setopt extended_glob
setopt menu_complete
setopt nocasematch

# Keybindings
bindkey -e
bindkey '^[[7~' beginning-of-line
bindkey '^[[8~' end-of-line
bindkey '^[[3~' delete-char
bindkey '[3~' kill-word
bindkey '[D' backward-word
bindkey '[C' forward-word

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' expand prefix suffix
# Case-and-hyphen insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Modules

autoload zmv
autoload zcalc
zmodload zsh/zprof
