#!/bin/sh

xrdb ~/.Xresources
xset +fp ~/.local/share/fonts
xset +fp ~/.fonts
xset +fp /usr/share/fonts/local
xset fp rehash
xsetroot -cursor_name left_ptr &

wait

mpd &
compton -b &
urxvtd -q -o -f &
transmission-daemon &

thunar --daemon &
nm-applet &
setxkbmap es &

#hsetroot -fill "~/Pictures/Wallpapers/clouds.jpg" &
#sxhkd &
#exec bspwm
exec awesome
