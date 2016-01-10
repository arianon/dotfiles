if (( ! $+commands[go] )); then
	return 1
fi

export GOPATH=$HOME/.go

path=($GOPATH/bin $path)
