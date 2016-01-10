if (( ! $+commands[cabal] )) {
	return 1
}

path=($HOME/.cabal/bin $path)
