# private
function __fish_prompt_git
	# check if we're in a git repo
	git rev-parse --is-inside-work-tree ^/dev/null >/dev/null
	and echo -n " "(git rev-parse --abbrev-ref HEAD)
end

#public
function fish_prompt
	if test $status -ne 0
		set_color red
	else
		set_color blue
	end

	echo -n "% "
end

function fish_right_prompt
	set_color blue
	echo -n (prompt_pwd)
	set_color black
	__fish_prompt_git
	set_color normal
end


