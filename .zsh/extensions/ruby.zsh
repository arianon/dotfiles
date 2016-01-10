if (( ! $+commands[ruby] || ! $+commands[gem] )) {
	return 1
}

# TODO: Make this lazy

if [[ -s "$HOME/.rbenv/bin/rbenv" ]] {
	path=($HOME/.rbenv/bin $path)
	eval "$(rbenv init - --no-rehash zsh)"
} elif (( $+commands[rbenv] )) {
	eval "$(rbenv init - --no-rehash zsh)"
} else {
	path=($HOME/.gem/ruby/*/bin(N) $path)
}
