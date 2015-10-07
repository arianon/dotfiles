#!/bin/sh
xset +fp ~/.fonts
xset fp rehash
xsetroot -cursor_name left_ptr
xsetroot -mod 2 2 -bg '#2b303b'
xrdb -load ~/.Xresources
setxkbmap es

redshift &

firefox-bin &
exec i3
