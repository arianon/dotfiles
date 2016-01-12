self=${0:r}
test -d $self || return 1

fpath=($self/src $fpath)
