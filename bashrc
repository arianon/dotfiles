# If not running interactively, don't do anything
[[ $- != *i* ]] && return

for file in ~/.shell.d/*; do
    [[ -r $file ]] && source $file
done

bind "TAB:menu-complete"
