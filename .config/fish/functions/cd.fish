function cd
    if test -f $argv[1]
		set -l file $argv[1]
        set -l dir (dirname $file)
        echo Correcting \'$file\' to \'$dir\'
        builtin cd $dir
    else
        builtin cd $argv
    end
end
