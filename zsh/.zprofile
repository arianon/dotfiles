for prof (~/.zsh/profiles/*) {
	hash $prof:t:r 2>/dev/null && source $prof
}

export PATH=~/bin:$PATH

[[ $(tty) = "/dev/tty1" ]] && exec startx &> /dev/null
