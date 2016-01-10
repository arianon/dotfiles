# just t type '...' to get '../..'
rationalise-dot() {
	local MATCH
	if [[ $LBUFFER =~ '(^|/| |	|'$'\n''|\||;|&)\.\.$' ]] {
		LBUFFER+=/
		zle self-insert
		zle self-insert
	} else {
		zle self-insert
	}
}

zle -N rationalise-dot
bindkey . rationalise-dot
# without this, typing a . aborts incremental history search
bindkey -M isearch . self-insert
