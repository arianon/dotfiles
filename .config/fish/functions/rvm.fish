function init --on-event init_rvm
	rvm current >/dev/null ^&1

	function __check_rvm --on-variable PWD -d "Setup rvm on directory change"
		status --is-command-substitution; and return

		if [ "$rvm_project_rvmrc" != 0 ]
			set -l cwd $PWD
			while true
				if contains $cwd "" $HOME "/"
					if [ "$rvm_project_rvmrc" = 1 ]
						rvm default >/dev/null ^&1
					end
					break
				else
					if [ -s ".rvmrc" -o -s ".ruby-version" -o -s ".ruby-gemset" -o -s ".version.conf" -o -s "Gemfile" ]
						rvm reload >/dev/null ^&1
						rvm rvmrc load >/dev/null ^&1
						break
					else
						set cwd (dirname "$cwd")
					end
				end
			end
			set -e cwd
		end
	end
end

function rvm -d "Ruby Version Manager"
	set -l env_file (mktemp rvm.fish.XXXXXXXXXX)

	bash -c 'source ~/.rvm/scripts/rvm; rvm "$@"; status=$?; env > "$0"; exit $status' $env_file $argv
	and eval (grep '^rvm\|^[^=]*PATH\|^RUBY_\|^GEM_' $env_file | grep -v '_clr\|_debug' | sed '/^PATH/y/:/ /; s/^/setenv /; s/=/ /; s/$/ ;/; s/(//; s/)//')

	rm -f $env_file >/dev/null
end
