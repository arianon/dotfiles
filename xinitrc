#!/bin/sh

xsetroot -cursor_name left_ptr &
xsetroot -solid '#353540'

setxkbmap es

# nitrogen --restore
# hsetroot -tile ~/usr/img/walls/DD459yfn.png

# compton &
redshift &
# sxhkd -c ~/etc/sxhkdrc &

volumeicon &
exec startxfce4
