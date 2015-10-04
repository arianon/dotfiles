# -*-  mode: sh -*-

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Run Xorg on TTY1 if it isn't running yet
[[ -z $DISPLAY && $XDG_VTNR == 1 ]] && \
    exec startx -- &> /dev/null

bind "TAB:menu-complete"

### ENVIRONMENT
export XDG_CONFIG_HOME="$HOME/.config"

# SOFTWARE
export BROWSER="chroimum"
export EDITOR="vim"
export VISUAL=$EDITOR
export PAGER="less"

# LANG
export LANG="en_US.UTF-8"
# export LC_ALL="en_US.UTF-8"

# PATHS
export LOCAL="$HOME/local"
export TMPDIR="/tmp"
export MAIL="$HOME/var/mail"

# RUBY
export PATH=~/bin:~/.cabal/bin:~/.rbenv/bin:"$PATH"
eval "$(rbenv init -)"

# LUA
eval "$(luarocks path --bin)"


### ALIASES
if hash &>/dev/null aura
  then alias pacman="sudo aura"
  else alias pacman="sudo pacman"
fi

hash hub &>/dev/null && alias git="hub"
# which nvim &>/dev/null && alias vim="nvim"

# flags
alias cp="cp -av"
alias rm="rm -iv"
alias mv="mv -v"
alias mkdir="mkdir -p"
alias make="make -j"
alias grep="grep --color=auto"
alias diff="diff -Naur"

# stuff
alias rnb="toilet --gay -t -f future"
alias weechat="dtach -A /tmp/weechat.sk weechat"
alias fetch="screenfetch -A 'Arch Linux - Old'"

# ls goodies
if hash ls++ &>/dev/null; then
  alias ls="ls++"
  alias la="ls++ -A"
else
  alias ls="ls -BFX --group-directories-first --color=auto"
  alias l="ls -goh"
  alias la="ls -Ah"
  alias ll="ls -Agoh"
fi

# emacs
alias ec="emacsclient --no-wait -c"
alias et="emacsclient -t"

# misc
alias so="source ~/.bashrc"
alias :q="exit"
alias quit="exit"

# can't live without these
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."


### FUNCTIONS
color() {
  tput setaf $1
  shift
  printf $@
  tput sgr0
}

path() {
  # pwd | sed s:$HOME:~:
  echo ${PWD/$HOME/\~}
}

exists() {
  for prog in $@; do
    type $prog &>/dev/null
  done
}


cd() {
  if (( $# == 1 )) && [[ -f $1 ]]; then
    local dir=$(dirname $1)

    echo "Correcting '$1' to '$dir'"
    builtin cd $dir
  else
    builtin cd "$@" # && ls
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

  builtin cd "$1"
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
    *.bz2)   bunzip2 $1 ;;
    *.rar)   unrar x $1 ;;
    *.gz)    gunzip $1 ;;
    *.tar)   tar xvf $1 ;;
    *.zip)   unzip $1 ;;
    *.7z)    7za x $1 ;;
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

unique_tmux() {
  if [[ -z "$TMUX" ]]; then
    local group="tmux"
    local check=$(tmux ls 2>/dev/null | grep -c $group)
    local id="$group -> $RANDOM"

    if (( $check > 0 )); then
      tmux new -d -t "$group" -s "$id" \; set destroy \; attach -t "$id" >/dev/null
    else
      tmux new -s "$group" >/dev/null
    fi
  fi
}

mkbar() {
	local BAR
	local INPUT=$1

	local SIZE=${2:-10}
	local CHAR1=${CHAR1:-"[1;37m|"}
	local CHAR2=${CHAR2:-"[0;30m|"}

	local VAL=$((INPUT * SIZE / 100))

	for ((v = 0; v < SIZE; v++)); do
		if ((v < VAL)); then
			BAR+="$CHAR1"
		else
			BAR+="$CHAR2"
		fi
	done

	echo "$BAR"

}

### PROMPT
prompt() {
  case $? in
  0)   color 4 $1 ;;
  126) color 3 $1 ;;
  127) color 5 $1 ;;
  130) color 2 $1 ;;
  *)   color 1 $1 ;;
  esac
}

export PS1='$(path) $(prompt ») '

### XFT SETTINGS
XFT_SETTINGS="
Xft.antialias: 1
Xft.autohint:  0
Xft.dpi:       96
Xft.hinting:   1
Xft.hintstyle: hintslight
Xft.lcdfilter: lcddefault
Xft.rgba:      rgb
"

echo "$XFT_SETTINGS" | xrdb -merge > /dev/null 2>&1

# INFINALITY
export INFINALITY_FT_FILTER_PARAMS='00 35 30 35 00'

export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH=10
export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH=25
export INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS=true
export INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT=100

export INFINALITY_FT_GAMMA_CORRECTION='100 75'
export INFINALITY_FT_BRIGHTNESS=0
export INFINALITY_FT_CONTRAST=0
export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_FRINGE_FILTER_STRENGTH=5
export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH=10

export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH=0
export INFINALITY_FT_STEM_FITTING_STRENGTH=0
export INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE=0

export INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS=true
export INFINALITY_FT_USE_VARIOUS_TWEAKS=true

# vim: ft=sh:expandtab
