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
	which milli2human >/dev/null ^&1; or return

	echo -n "("
	set_color yellow
	milli2human "$milliseconds"
	set_color normal
	echo -n ")"
end

function prompt::current_directory
	set_color blue
	echo -n "$PWD" | sed "s|$HOME|~|; s|\([^/.]\)[^/]*/|\1/|g"
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

function prompt::tor
  set -q LD_PRELOAD
  or return

  for lib in $LD_PRELOAD
    if [ (basename $lib) = libtorsocks.so ]
      set_color green
      echo "TORIFIED"
      set_color normal
      return
    end
  end
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
		echo -n (prompt::user)"@"(prompt::host)" "
	end

	echo
	prompt::current_directory
	echo

	# if git rev-parse ^/dev/null
	# 	echo -n "("(prompt::git)") "
	# end

	set_color "$prompt_color"
	echo -n "$prompt_char "
	set_color normal
end

function fish_right_prompt
	prompt::tor

	set -q CMD_DURATION
	and prompt::format_time "$CMD_DURATION"
end
