cd() {
	if [[ -f $1 ]] {
		local dir=${1:h}
		echo "Correcting '$1' to '$dir'"
		builtin cd $dir
	} else {
		builtin cd "$@"
	}
}

mkcd() {
	if (( $# != 1 )) {
		echo "usage: mkcd <directory>"
		return 1
	}

	if [[ -d "$1" ]] {
		echo "'$1' already exists cd-ing."
	} else {
		command mkdir -p "$1"
	}

	builtin cd "$1"
}

cdt() {
	local tmp="$(mktemp -d)"
	echo "Created temporary directory '$tmp'"
	builtin cd "$tmp"
}
