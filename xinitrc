#!/bin/sh

xset +fp ~/.fonts
xset +fp /usr/share/fonts/local
xset fp rehash

xsetroot -solid \#131315
xsetroot -cursor_name left_ptr &

xrdb -load  ~/etc/Xresources

setxkbmap es
sxhkd -c ~/etc/sxhkdrc >/dev/null 2>&1 &

volumeicon &
exec startxfce4
