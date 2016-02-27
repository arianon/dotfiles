function cd -a file
	if [ -f "$file" ]
        set -l dir (dirname "$file")
        echo "Correcting '$file' to '$dir'"
        builtin cd $dir
    else
        builtin cd $argv
    end
end
