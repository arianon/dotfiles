#!/bin/sh
xset +fp ~/.fonts
xset fp rehash
xrdb -load ~/.Xresources
xsetroot -cursor_name left_ptr

# Wallpaper
# xsetroot -mod 2 2 -bg "#333"
hsetroot -center ~/usr/lambda.png

# Keyboard
setxkbmap us -option compose:menu -option caps:swapescape

redshift &
parcellite &
# compton &

sleep 0.25

chromium &
# SXHKD_SHELL=/bin/sh sxhkd &
exec i3
