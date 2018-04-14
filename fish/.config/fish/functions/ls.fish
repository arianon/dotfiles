function ls
	command ls -BF --group-directories-first --color=auto $argv
end

function l
	ls -goh $argv
end

function la
	ls -Ah
end

function ll
	ls -Agoh
end
