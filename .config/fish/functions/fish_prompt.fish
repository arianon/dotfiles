function __my_fish_git_prompt
	git rev-parse ^/dev/null
	or return

	set_color yellow
	echo -n " "(git symbolic-ref --short HEAD)
end

function fish_prompt
	set -l exit_code $status

	if [ $USER = root ]
		set_color green
		echo -n "root "
	end

	if [ $exit_code -ne 0 ]
		set_color red
	else
		set_color blue
	end

	echo -n "% "
	set_color normal
end

function fish_right_prompt
	set_color $fish_color_cwd
	echo -n (prompt_pwd)

	__my_fish_git_prompt
	set_color normal
end
