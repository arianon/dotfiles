#!/bin/sh
xset +fp ~/.fonts
xset fp rehash
xrdb -load ~/.Xresources
xsetroot -cursor_name left_ptr

# Wallpaper
xsetroot -mod 2 2 -bg "#333"
# hsetroot -full ~/usr/img/horario.png

# Keyboard
setxkbmap us -option compose:menu -option caps:swapescape

redshift &
# compton &

# iceweasel &
startxfce4
