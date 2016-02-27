# PLUGINS {{{
source ~/.zplugins/completions/zsh-completions.plugin.zsh
source ~/.zplugins/history-substring-search/zsh-history-substring-search.zsh
# }}}
# ALIASES {{{
alias cp="cp -av"
alias diff="diff -Naur"
alias git="noglob git"
alias grep="grep --color=auto"
alias make="make -j$(nproc)"
alias mkdir="mkdir -p"
alias mv="mv -v"
alias rm="rm -iv"

alias zcp="noglob zmv -C"
alias zln="noglob zmv -L"
alias zmv="noglob zmv"

for index ({1..9}) alias "$index"="cd +${index}"
unset index

if (( $+commands[hub] )); then
  alias git="noglob hub"
fi

if (( $+commands[aura] )); then
  alias pacman="sudo aura"
  alias aura="sudo aura"
fi

if (( $+commands[ls++] )); then
  alias ls="ls++"
  alias la="ls++ -A"
else
  alias ls="ls -BFX --group-directories-first --color=auto"
  alias l="ls -goh"
  alias la="ls -Ah"
  alias ll="ls -Agoh"
fi

# }}} 
# CONFIG {{{
HISTFILE=~/.zhistory
HISTSIZE=8000
SAVEHIST=8000

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=green,fg=black'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=black'

typeset -U path

# Modules {{{
autoload -Uz compinit && compinit
autoload -U colors && colors
autoload zmv
autoload zcalc
zmodload zsh/zprof
# }}}
# Options {{{
setopt always_to_end
setopt append_history
setopt autocd
setopt auto_menu
setopt auto_pushd
setopt complete_in_word
setopt correct
setopt extended_glob
setopt extended_history
setopt histallowclobber
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt interactivecomments
setopt nocasematch
setopt NO_clobber
setopt nonomatch
setopt pushd_ignore_dups
setopt pushd_minus
setopt share_history
# }}}
# Keybindings {{{
bindkey -e
bindkey '^[[7~' beginning-of-line
bindkey '^[[8~' end-of-line
bindkey '^[[3~' delete-char
bindkey '[3~' kill-word
bindkey '[D' backward-word
bindkey '[C' forward-word
bindkey ' ' magic-space
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
# }}}
# Dircolors {{{
eval "$(dircolors -b)"
# }}}
# Completion {{{
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' expand prefix suffix

# Case-and-hyphen insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Use caching
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR
# }}}
#  }}}
# FUNCTIONS {{{

cd() {
  if [[ -f $1 ]]; then
    local dir=${1:h}
    echo "Correcting '$1' to '$dir'"
    builtin cd "$dir"
  else
    builtin cd "$@"
  fi
}

mkcd() {
  if (( $# != 1 )); then
    echo "usage: mkcd <directory>"
    return 1
  fi

  if [[ -d "$1" ]]; then
    echo "'$1' already exists cd-ing."
  else
    command mkdir -p "$1"
  fi

  builtin cd "$1"
}

cdt() {
  builtin cd "$(mktemp -d)"
}
# }}}
# PROMPT {{{
if (( $UID == 0 )); then
  COLOR="%(?,green,red)"
else
  COLOR="%(?,blue,red)"
fi

if [[ "$SSH_CONNECTION" ]] SSH="%F{green}%n%F{black}@%F{blue}%M %f"

PROMPT="${SSH}%~%F{$COLOR}> %f"
# }}}
# EXTRA {{{
# Rationalise dot {{{
# just t type '...' to get '../..'
rationalise-dot() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}

zle -N rationalise-dot
bindkey . rationalise-dot
# without this, typing a . aborts incremental history search
bindkey -M isearch . self-insert
# }}}
# Colored man pages {{{
export GROFF_NO_SGR=1
export LESS_TERMCAP_mb=$'\E[01;34m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;40;01m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
# }}}
# fasd {{{
if (( $+commands[fasd] )); then
  fasd_cache="$HOME/.fasd.cache.zsh"

  if [[ $commands[fasd] -nt "$fasd_cache" || ! -s "$fasd_cache" ]]; then
    fasd --init posix-alias \
      zsh-hook \
      zsh-ccomp \
      zsh-ccomp-install \
      zsh-wcomp \
      zsh-wcomp-install \
      >| "$fasd_cache"
  fi

  source "$fasd_cache"
  unset fasd_cache
fi
# }}}
# pip {{{
if (( $+commands[pip] )); then
  pip_cache="$HOME/.pip.cache.zsh"

  if [[ $+commands[pip] -nt "$pip_cache" || ! -s "$pip_cache" ]]; then
    pip completion --zsh >| "$pip_cache"
  fi

  source "$pip_cache"
  unset pip_cache
fi
# }}}
# }}}

# Gotta load the syntax-highlighting plug-in at the end.
source ~/.zplugins/syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
