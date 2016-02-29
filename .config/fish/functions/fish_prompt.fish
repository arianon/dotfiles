function prompt::git
	set -l branch (git symbolic-ref --short HEAD)
	set -l is_dirty (git status --porcelain --ignore-submodules ^&1)

	# Check if the repo is dirty
	if [ -n "$is_dirty" ]
		set_color -o red
		echo -n $branch!
	else
		set_color magenta
		echo -n $branch
	end
	set_color normal
end

function prompt::format_time -a milliseconds
	[ "$milliseconds" -gt 0 ]; or return
	which mili2human >/dev/null ^&1; or return

	echo -n "("
	set_color yellow
	mili2human "$milliseconds"
	set_color normal
	echo -n ")"
end

function prompt::current_directory
	set_color blue
	echo -n "$PWD" | sed -e "s|$HOME|~|" # -e "s|\([^/.]\)[^/]*/|\1/|g"
	set_color normal
end

function prompt::user
	set_color green
	echo -n "$USER"
	set_color normal
end

function prompt::host
	set_color red
	echo -n (hostname)
	set_color normal
end

function fish_prompt
	set -l exit_code $status
	set -l prompt_color "green"
	set -l prompt_char '$'

	if [ $USER = "root" ]
		set prompt_color "magenta"
		set prompt_char '#'
	end

	[ "$exit_code" -ne 0 ]; and set prompt_color "red"

	if set -q SSH_CONNECTION
		echo -n (prompt::user)" at "(prompt::host)" in "
	end

	prompt::current_directory

	if git rev-parse ^/dev/null
		echo -n " on "(prompt::git)
	end

	echo
	set_color "$prompt_color"
	echo -n "$prompt_char "
	set_color normal
end

function fish_right_prompt
	set -q CMD_DURATION
	and	prompt::format_time $CMD_DURATION
end
