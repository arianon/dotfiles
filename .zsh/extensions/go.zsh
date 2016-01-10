if (( ! $+commands[go] )) {
	return 1
}

export GOPATH=$HOME/.go

path=($GOPATH/bin $path)
