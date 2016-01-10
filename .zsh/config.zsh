# Options
setopt histallowclobber
setopt nonomatch
setopt NO_clobber
setopt interactivecomments
setopt correct
setopt autocd
setopt complete_in_word
setopt auto_menu

# Keybindings
bindkey -e

# Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' expand prefix suffix
