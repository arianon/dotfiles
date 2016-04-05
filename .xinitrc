#!/bin/sh
xset +fp ~/.fonts
xset fp rehash
xrdb -load ~/.Xresources
xsetroot -cursor_name left_ptr

# Wallpaper
hsetroot -full ~/usr/img/lambda.png

# Keyboard
setxkbmap us -option compose:menu -option caps:swapescape

redshift &
compton &

firefox &
exec i3
