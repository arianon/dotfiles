if (( ! $+commands[python] && ! $+commands[pip] )); then
	return 1
fi

eval "$(pip completion --zsh)"
