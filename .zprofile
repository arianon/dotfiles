if [[ -d ~/.rbenv ]] export PATH=~/.rbenv/bin:$PATH

for prof (~/.zsh/profiles/*) {
	if (( $+commands[$prof:t:r] )) source $prof
}

export PATH=$HOME/bin:$HOME/.local/bin:$PATH


if [[ $(tty) == "/dev/tty1" ]] startx
