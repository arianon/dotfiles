#!/bin/bash

CONFS=${XDG_CONFIG_HOME:-"$HOME/.config"}

# Files and folders that belong to $XDG_CONFIG_HOME

CONFIG_STUFF=(
	awesome
	bspwm
	compton.conf
	mpv
	redshift.conf
)

# Files and folders that belong to $HOME

HOME_STUFF=(
	bashrc
	dunstrc
	irssi
	ncmpcpp
	nvimrc
	tmux.conf
	spectrwm.conf
	weechat
	xinitrc
	Xresources
	zshrc
)

simulate() {
	echo "The following files and folder will be linked."
	for f in ${CONFIG_STUFF[@]}; do
		echo "$CONFS/$f -> $PWD/$f"
	done 

	for f in ${HOME_STUFF[@]}; do
		echo "$HOME/.$f -> $PWD/$f"
	done
}

link() {
	read -p "Hit ^C to abort."
	for f in ${CONFIG_STUFF[@]}; do
		ln -s "$PWD/$f" "$CONFS/$f"
	done 

	for f in ${HOME_STUFF[@]}; do
		ln -s "$PWD/$f" "$HOME/.$f"
	done
}

${1:-simulate}
