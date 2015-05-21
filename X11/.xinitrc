#!/bin/sh

xsetroot -cursor_name left_ptr &
xsetroot -solid '#353540'

setxkbmap es

# nitrogen --restore

compton -b
redshift &

# sxhkd -c ~/etc/sxhkdrc &

exec dwm
