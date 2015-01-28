# If not running interactively, don't do anything
[[ $- != *i* ]] && return

__prompt () {
    (( $? != 0 )) \
        && echo -n "[31m" \
        || echo -n "[32m"

    echo -n "$ [0m"
}

PS1='$(__prompt)'

# Binds
bind "TAB:menu-complete"

# Functions
ls() { command ls -F --color=auto --group-directories-first $*; }

cd() {
    if (( $# == 1 )) && [[ -f $1 ]]; then
        local dir=$(dirname $1)

        echo "Correcting $1 to $dir"
        builtin cd $dir
    else
        builtin cd "$@" && ls
    fi
}

mkcd() {
    if (( $# != 1 )); then
        echo "usage: mkcd <directory>"
        return 1
    fi

    if [[ -d "$1" ]]; then
        echo "'$1' already exists, cd-ing."
    else
        command mkdir -p "$1"
    fi

    builtin cd $1
}

cdtemp() {
    local tmp=$(mktemp -d)
    echo "Created temporary directory '$tmp'"
    builtin cd "$tmp"
}

extract() {
    if [[ -f $1 ]]; then
        case $1 in
            *.tar.bz2) tar xvjf $1 ;;
            *.tar.gz)  tar xvzf $1 ;;
            *.bz2)     bunzip2 $1 ;;
            *.rar)     unrar x $1 ;;
            *.gz)      gunzip $1 ;;
            *.tar)     tar xvf $1 ;;
            *.zip)     unzip $1 ;;
            *.7z)      7za x $1 ;;
            *) echo "'$1' cannot be extracted." 2>&1 ;;
        esac
    else
        echo "'$1' is not a valid file or does not exist." 2>&1
    fi
}

roll() {
    local RANGE=${1:-[:alnum:]}
    local CHARS=${2:-16}

    if [[ "$1" = "-h" ]]; then
        echo "usage: roll [RANGE] [NUMBER OF CHARACTERS]"
    else
        echo $(tr -dc $RANGE < /dev/urandom | head -c $CHARS)
    fi
}

# Aliases
if which pacaur >&-
    then alias pacman="pacaur"
    else alias pacman="sudo pacman"
fi

which hub >&- && alias git="hub"

# flags
alias cp="cp -rv"
alias rm="rm -v"
alias mv="mv -v"
alias mkdir="mkdir -p"
alias make="make -j"
alias grep="grep --color=auto"

# ls goodies
alias l="ls -lh"
alias la="ls -Ah"
alias ll="ls -lAh"

# shorties
alias a="awk"
alias c="clear"
alias g="grep"
alias s="sed"
alias t="tmux"
alias v="vim"

# misc
alias so="source ~/.bashrc"
alias :q="exit"
alias quit="exit"

# can't live without these
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# vim: expandtab

