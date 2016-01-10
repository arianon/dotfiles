if (( ! $+commands[rust] && ! $+commands[cargo] )); then
	return 1
fi

path=($HOME/.cargo/bin $path)

if (( $+commands[racer] )); then
	export RUST_SRC_PATH="$HOME/.rust/src"
fi
