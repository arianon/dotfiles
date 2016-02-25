function ls
	command ls -BFX $argv
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
