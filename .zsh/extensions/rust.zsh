if (( ! $+commands[rust] && ! $+commands[cargo] )) {
	return 1
}

path=($HOME/.cargo/bin $path)

if (( $+commands[racer] )) {
	export RUST_SRC_PATH="$HOME/.rust/src"
}
