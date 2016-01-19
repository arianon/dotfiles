#!/bin/sh
xset +fp ~/.fonts
xset fp rehash
xrdb -load ~/.Xresources
xsetroot -cursor_name left_ptr
hsetroot -solid "$(xrq background)"
setxkbmap us -option compose:menu -option caps:swapescape

# TODO: put X-independent daemons where they belong
mpd &
transmission-daemon &

compton -b &
dunst &
redshift &
steam &

rubar &
chromium &
i3
