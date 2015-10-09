cd() {
	if (( $# == 1 )) && [[ -f $1 ]]; then
		local dir=${1:t}
		echo "Correcting '$1' to '$dir'"
		builtin cd $dir
	else
		builtin cd "$@"
	fi
}

mkcd() {
	if (( $# != 1 )); then
		echo "usage: mkcd <directory>"
		return 1
	fi
	
	if [[ -d "$1" ]]; then
		echo "'$1' already exists cd-ing."
	else
		command mkdir -p "$1"
	fi

	builtin cd "$1"
}

cdt() {
	local tmp="$(mktemp -d)"
	echo "Created temporary directory '$tmp'"
	builtin cd "$tmp"
}
