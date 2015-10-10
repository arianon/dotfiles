for prof (~/.zsh/profiles/*) {
	if (( $+commands[$prof:t:r] )) source $prof
}

export PATH=~/bin:$PATH

if [[ $(tty) == "/dev/tty1" ]] exec startx &> /dev/null
