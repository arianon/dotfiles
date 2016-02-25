function rbenv -a command
	# Pop first element of argv
	set argv $argv[2..-1]

	switch "$command"
	case rehash shell
		eval (rbenv "sh-$command" $argv)
	case '*'
		command rbenv "$command" $argv
	end
end
