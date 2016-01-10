if (( ! $+commands[ruby] || ! $+commands[gem] )); then
	return 1
fi


if [[ -s "$HOME/.rbenv/bin/rbenv" ]]; then
	path=($HOME/.rbenv/bin $path)
	eval "$(rbenv init - --no-rehash zsh)"
elif (( $+commands[rbenv] )); then
	eval "$(rbenv init - --no-rehash zsh)"
else
	path=($HOME/.gem/ruby/*/bin(N) $path)
fi
