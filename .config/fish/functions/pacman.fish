function pacman
	if which aura >/dev/null ^&1
		sudo aura $argv
	else
		sudo pacman
	end
end

