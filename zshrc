# Xorg

if [[ -z $DISPLAY && $XDG_VTNR == 1 ]]; then
	exec startx
fi

# Tmux

if [[ -z "$TMUX" ]]; then
	group="tmux"
	check=`tmux ls 2>/dev/null | grep -c $group`
	id="$group -> $RANDOM"

	if [[ $check -gt 0 ]]; then
		tmux new -d -t $group -s $id \; set destroy \; attach -t $id >/dev/null
	else
		tmux new -s $group >/dev/null
	fi
fi

###

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -U colors && colors

export PATH=~/.bin:${PATH}:$(ruby -rubygems -e "puts Gem.user_dir")/bin

prompt off
PROMPT="%(?,%F{blue},%F{red})$ %{$reset_color%}"
RPROMPT="%F{black}%~%{$reset_color%}"

rand() {
	RANGE=${1:-[:alnum:]}
	CHARS=${2:-16}

	if [ "$1" = "-h" ]; then
		echo "usage: $0 [RANGE] [NUMBER OF CHARACTERS]"
	else
		echo $(tr -dc $RANGE < /dev/urandom | head -c $CHARS)
	fi
}

say () {
	TL=${TL:-en}
	url="http://translate.google.com/translate_tts?tl=${TL}&q="
	mplayer -really-quiet "${url}$*" 2>/dev/null
}

conf() {
	case $1 in
		tmux)		vim ~/.tmux.conf ;;
		term)		vim ~/.config/termite/config ;;
		rc)			vim ~/.config/awesome/rc.lua && awesome -k ;;
		theme)		vim ~/.config/awesome/arianon/theme.lua ;;
		dunst)		vim ~/.config/dunst/dunstrc && pkill -x dunst && notify-send "<b>test</b>\ntest2" ;;
		weechat)	vim ~/.weechat/weechat.conf ;;
		fonts)		sudoedit /etc/profile.d/infinality-settings.sh ;;
		ncmpcpp)	vim ~/.ncmpcpp/config ;;
		bspwm)		vim ~/.config/bspwm/bspwmrc ;;
		sxhkd)		vim ~/.config/sxhkd/sxhkdrc && pkill -USR1 -x sxhkd ;;
		panel)		vim ~/.config/bspwm/panel/panel_bar && pkill -x panel; panel ;;
		comp)		vim ~/.config/compton.conf && pkill compton && compton -b ;;
		zsh)		vim ~/.zshrc && source ~/.zshrc ;;
		gtk2)		vim ~/.themes/Numix-Arianon/gtk-2.0/gtkrc ;;
		gtk3)		vim ~/.themes/Numix-Arianon/gtk-3.0/gtk.css ;;
		vim)		vim ~/.vimrc ;;
		vimp)		vim ~/.vimperator/colors/phallus.vimp ;;
		xinit)		vim ~/.xinitrc ;;
		xres) 		vim ~/.Xresources && xrdb ~/.Xresources ;;
		*)			echo "Unknown application: $1"  ;;
	esac
}

extract() {
	if [[ -f $1 ]] ; then
		case $1 in
			*.tar.bz2|tbz2) tar xvjf $1 ;;
			*.tar.gz|tgz) tar xvzf $1 ;;
			*.bz2) bunzip2 $1 ;;
			*.rar) unrar x $1 ;;
			*.gz) gunzip $1 ;;
			*.tar) tar xvf $1 ;;
			*.zip) unzip $1 ;;
			*.7z) 7za x $1 ;;
			*) echo "'$1' cannot be extracted." ;;
		esac
	else
		echo "'$1' is not a valid file."
	fi
}

copy() {
	if [[ -f $1 ]]; then
		cat $1 | xclip -selection clip-board
	else
		echo "'$1' is not a valid file."
	fi
}

define() {
	curl dict://dict.org/d:$1
}

alias lsw=lsw
alias pacman="pacaur"
alias abs="sudo abs"
alias v="vim"
alias weechat="dtach -A /tmp/weechat.sk weechat"
alias git="hub"

alias make="make -j"
alias rm="rm -v"
alias mv="mv -v"
alias cp="cp -Rv"
alias du="cdu -idh"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias pinta="pinta 2>/dev/null"
alias sloc="sloccount 2>/dev/null"
alias rnb="toilet -t -f future"
alias rng="toilet -t -f future --gay"
alias rnt="toilet -t -f term --gay"
alias fetch="screenfetch -A 'Arch Linux - Old'"

PERL5LIB="/home/arianon/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/arianon/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/arianon/perl5\""; export PERL_MB_OPT;
PERL_LOCAL_LIB_ROOT="/home/arianon/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/arianon/perl5\""; export PERL_MB_OPT;
PERL_MM_OPiiT="INSTALL_BASE=/home/arianon/perl5"; export PERL_MM_OPT;
PERL_MM_OPiiT="INSTALL_BASE=/home/arianon/perl5"; export PERL_MM_OPT;
