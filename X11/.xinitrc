#!/bin/sh
xsetroot -cursor_name left_ptr
xrdb -load ~/.Xresources
setxkbmap es

redshift &

hsetroot -tile ~/usr/img/wallpaper.png &

chromium &
sxhkd &
exec bspwm
