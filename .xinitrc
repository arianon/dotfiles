#!/bin/sh
xset +fp ~/.fonts
xset fp rehash
xrdb -load ~/.Xresources
xsetroot -cursor_name left_ptr
xsetroot -bg "$(xrq background)"
setxkbmap latam -option caps:swapescape

mpd &
redshift &
steam &
transmission-daemon &

rubar &
chromium &
i3
