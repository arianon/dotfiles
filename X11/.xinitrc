#!/bin/sh

xsetroot -cursor_name left_ptr
xsetroot -solid '#353540'
hsetroot -tile ~/usr/img/wallpaper.png

xrdb -load ~/.Xresources
setxkbmap es

compton &
redshift &

sxhkd &
exec openbox
