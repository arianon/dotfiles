function extract --description 'Extract a file according to file extension.'
    set -l target $argv[1]

    if test -f $target
        switch $target
            case '*.tar.bz2' '*.tbz'
                tar xvjf $target
            case '*.tar.gz' '*.tgz'
                tar xvzf $target
            case '*.bz2'
                bunzip2 $target
            case '*.gz'
                gunzip $target
            case '*.rar'
                unrar x $target
            case '*.zip'
                unzip $target
            case '*.tar'
                tar xvf $target
            case '*.7z'
                7za x $target
            case '*'
                echo "'$target' cannot be extracted." 2>& 1
        end
    else
        echo "'$target' is not a valid file or does not exist." 2>& 1
    end
end
