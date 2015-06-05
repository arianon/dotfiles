#!/bin/sh

xsetroot -cursor_name left_ptr &
xsetroot -solid '#353540'

xrdb -merge ~/.Xresources
setxkbmap es

hsetroot -tile ~/media/images/wallpaper.png

compton -b
redshift &

# sxhkd -c ~/etc/sxhkdrc &

( 
while :; do
	xsetroot -name "$(clock -f %X)"
	sleep 1
done
) &

exec dwm
