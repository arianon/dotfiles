function mkcd --description Create\ a\ directory,\ then\ `cd\'\ into\ it
    set -l argc (count $argv)
    set -l target $argv[1]

    if test $argc != 1
        echo "usage: mkcd <directory>"
        return 1
    end

    if test -d $target
        echo "'$target' already exists, cd-ing."
    else
        command mkdir -p "$target"
    end

    builtin cd "$target"
end
