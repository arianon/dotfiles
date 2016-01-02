#!/bin/sh
xset +fp ~/.fonts
xset fp rehash
xsetroot -cursor_name left_ptr
xsetroot -mod 2 2 -bg '#14181f'
xrdb -load ~/.Xresources
setxkbmap latam -option caps:swapescape

emacs &
redshift &
mpd &
steam &
transmission-daemon &

chromium &
i3
