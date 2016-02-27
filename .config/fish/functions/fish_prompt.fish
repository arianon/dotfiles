function prompt::git_branch
	git rev-parse ^/dev/null
	or return

	set_color yellow
	echo -n " "(git symbolic-ref --short HEAD)
end

function prompt::format_time -a milliseconds
	set -l seconds (math "$milliseconds / 1000 % 60")
	set -l minutes (math "$milliseconds / 60000 % 60")
	set -l hours (math "$milliseconds / 3600000 % 24")
	set -l days (math "$milliseconds / 86400000")

	[ $days -gt 0 ]; and echo -n $days"d "
	[ $hours -gt 0 ]; and echo -n $hours"h "
	[ $minutes -gt 0 ]; and echo -n $minutes"m "
	[ $seconds -gt 0 ]; and echo -n $seconds"s "
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
	if [ "$CMD_DURATION" -gt 1000 ]
		set_color yellow
		prompt::format_time $CMD_DURATION
	end

	set_color $fish_color_cwd
	echo -n (prompt_pwd)

	prompt::git_branch
	set_color normal
end
