HISTFILE=~/.zhistory
HISTSIZE=8000
SAVEHIST=8000

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

# Keybindings
bindkey -e

# Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' expand prefix suffix
