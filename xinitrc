#!/bin/sh

xsetroot -cursor_name left_ptr &

setxkbmap -option caps:escape es
nitrogen --restore

transmission-daemon
compton &
redshift &
sxhkd -c ~/etc/sxhkdrc &

#volumeicon &
exec spectrwm
