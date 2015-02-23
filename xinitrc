#!/bin/sh

xsetroot -cursor_name left_ptr &

setxkbmap es
nitrogen --restore

compton &
redshift &
sxhkd -c ~/etc/sxhkdrc &

#volumeicon &
exec spectrwm
