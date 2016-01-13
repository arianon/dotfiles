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
setopt auto_menu
setopt hist_ignore_dups
setopt inc_append_history
setopt extended_history
setopt share_history
setopt extended_glob

# Keybindings
bindkey -e
bindkey '^[[7~' beginning-of-line
bindkey '^[[8~' end-of-line
bindkey '^[[3~' delete-char

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' expand prefix suffix

# Modules

autoload zmv
autoload zcalc
zmodload zsh/zprof
