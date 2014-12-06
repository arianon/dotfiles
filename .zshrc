# Xorg

if [[ -z $DISPLAY && $XDG_VTNR == 1 ]]; then
	exec startx
fi

# Tmux

if [[ -z "$TMUX" ]]; then
	group="tmux"
	check=`tmux ls 2>/dev/null | grep -c $group`
	id="$group -> `base64 /dev/urandom | head -c 6`"

	if [[ $check -gt 0 ]]; then
		tmux new -d -t $group -s $id \; set destroy \; attach -t $id >/dev/null
	else
		tmux new -s $group >/dev/null
	fi
fi

###

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -U colors && colors

BIN_PATH="${HOME}/bin"
RUBY_PATH="${HOME}/.gem/ruby/2.1.0/bin"

if [[ $PATH =~ $BIN_PATH ]]; then
	export PATH=$BIN_PATH:$PATH
fi

if [[ $PATH =~ $RUBY_PATH ]]; then
	export PATH=$PATH:$RUBY_PATH
fi

export GOPATH=/home/arianon/src/go

prompt off
PROMPT="%(?,%F{blue}──╼,%? %F{red}╼) %{$reset_color%}"
RPROMPT="%F{black}%~%{$reset_color%}"

rand() {
	if [[ -n $1 && -n $2 ]]; then
		tr -cd "$1" < /dev/urandom | head -c $2
	else
		echo "Usage: rand [RANGE] [NUMBER OF CHARACTERS]"
	fi
}

screencast() {
	if [[ $1 == "-s" ]]; then
		read X Y W H <<< `slop -f "%x %y %w %h"`
		shift
	else
		IFS="x" read X Y <<< `xrandr | awk '/\*/ {print \$1}'`
		unset IFS
	fi
	
	if [[ -z $1 ]]; then
		FILENAME="`rand '0-9a-z' 8`.mkv"
	else
		FILENAME=$1
	fi

	ffmpeg -y -f x11grab -s ${X}x${Y} -i ":0.0+${W},${H}" $FILENAME
}
	


conf() {
	case $1 in
		tmux)		vim ~/.tmux.conf ;;
		rc)			vim ~/.config/awesome/rc.lua && awesome -k ;;
		theme)		vim ~/.config/awesome/arianon/theme.lua ;;
		dunst)		vim ~/.config/dunst/dunstrc && pkill -x dunst && notify-send "test\ntest2" ;;
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

sprunge() {
	if [[ -f $1 ]]; then
		link=$(curl -sf -F "sprunge=<$1" http://sprunge.us)
		printf $link | xclip -selection clip-board
		echo "'$1' succesfully uploaded."
	else
		echo "'$1' is not a valid file."
	fi
}

define() {
	curl dict://dict.org/d:$1
}

alias pacman="sudo pacman"
alias abs="sudo abs"

#alias make="make -j7"
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
alias sf="screenfetch -A 'Arch Linux - Old'"

PERL5LIB="/home/arianon/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/arianon/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/arianon/perl5\""; export PERL_MB_OPT;
PERL_LOCAL_LIB_ROOT="/home/arianon/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/arianon/perl5\""; export PERL_MB_OPT;
PERL_MM_OPiiT="INSTALL_BASE=/home/arianon/perl5"; export PERL_MM_OPT;
PERL_MM_OPiiT="INSTALL_BASE=/home/arianon/perl5"; export PERL_MM_OPT;
