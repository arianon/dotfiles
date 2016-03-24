#!/bin/sh
xset +fp ~/.fonts
xset fp rehash
xrdb -load ~/.Xresources
xsetroot -cursor_name left_ptr

# Wallpaper
hsetroot -solid "$(xrq background)"

# Keyboard
setxkbmap us -option compose:menu -option caps:swapescape

redshift &
compton -b

if [ "$XDG_VTNR" -eq 3 ]; then
	exec qemu ~/var/vm/windows.img -full-screen
else
	exec i3
fi
