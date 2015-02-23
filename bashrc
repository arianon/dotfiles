# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Run Xorg on TTY1 if it isn't running yet
[[ -z $DISPLAY && $XDG_VTNR == 1 ]] && exec startx

# Source files
for file in ~/.shell.d/*; do
    [[ -r $file ]] && source $file
done

bind "TAB:menu-complete"
