if (( ! $+commands[cabal] )); then
	return 1
fi

path=($HOME/.cabal/bin $path)
