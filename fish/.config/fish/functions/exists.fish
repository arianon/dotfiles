function exists --description 'Silently check if a program is installed'
	which $argv >/dev/null ^&1
end
