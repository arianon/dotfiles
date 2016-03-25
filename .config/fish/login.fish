if [ -z "$DISPLAY" -a "$XDG_VTNR" = 1 ]
	exec startx -- -keeptty >~/.xorg.log ^&1
end
