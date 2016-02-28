function rationalise_dot -d "expand ... to ../.. etc"
	set -l cmd (commandline -c)

	switch $cmd[-1]
		case "*.."
			commandline -i "/.."
		case "*"
			commandline -i "."
	end
end
