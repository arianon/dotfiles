#!/bin/sh
xset +fp ~/.fonts
xset fp rehash
xrdb -load ~/.Xresources
xsetroot -cursor_name left_ptr

# Wallpaper
# xsetroot -mod 16 16 -bg black -fg white
hsetroot -fill ~/media/images/death-stranding.png

# Keyboard
setxkbmap us,es \
	-option compose:menu -option grp:alt_shift_toggle \
	# -option caps:swapescape \

redshift &
# parcellite &
# discord &
# telegram-desktop &
# compton &

sleep 0.15

chromium &
# SXHKD_SHELL=/bin/sh sxhkd &
exec i3
