function mkcd
	if [ (count $argv) -ne 1 ]
		echo "usage: mkcd <directory>"
		return 1
	end

	set -l dir $argv[1]
	if [ -d $dir ]
		echo "'$dir' already exists, cd-ing."
	else
		command mkdir -p $dir
	end

	builtin cd $dir
end
