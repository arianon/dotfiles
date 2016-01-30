#!/bin/sh
xset +fp ~/.fonts
xset fp rehash
xrdb -load ~/.Xresources
xsetroot -cursor_name left_ptr

# Wallpaper
hsetroot -solid "$(xrq background)"

# Keyboard
setxkbmap us -option compose:menu -option caps:swapescape

compton -b &
dunst &
redshift &
steam &

~/github/panel/rubar &
chromium &
i3
