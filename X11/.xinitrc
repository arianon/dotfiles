#!/bin/sh
xsetroot -cursor_name left_ptr
xsetroot -mod 2 2 -bg '#2b303b'
xrdb -load ~/.Xresources
setxkbmap es

redshift &

chromium &
sxhkd &
exec bspwm-loop
