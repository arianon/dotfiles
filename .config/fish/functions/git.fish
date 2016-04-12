function git
	if which hub >/dev/null ^&1
		hub $argv
	else
		command git $argv
	end
end

