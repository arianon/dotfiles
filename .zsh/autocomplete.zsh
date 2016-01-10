autoload -Uz compinit
compinit
zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' expand prefix suffix
