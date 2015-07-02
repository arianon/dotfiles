#!/bin/sh

xsetroot -cursor_name left_ptr &
xsetroot -solid '#353540'

xrdb -merge ~/.Xresources
setxkbmap es

hsetroot -tile ~/usr/img/emacs.png

compton -b
redshift &

sxhkd ~/.config/bspwm/sxhkdrc &
exec bspwm
