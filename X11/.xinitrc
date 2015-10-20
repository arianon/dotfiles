#!/bin/sh
xset +fp ~/.fonts
xset fp rehash
xsetroot -cursor_name left_ptr
xsetroot -mod 2 2 -bg '#14181f'
xrdb -load ~/.Xresources
setxkbmap es

redshift &
mpd &
transmission-daemon &

firefox-bin &
exec i3
