{
	zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
	if [[ "$zcompdump" -nt "${zcompdump}.zwc" || ! -s "${zcompdump}.zwc" ]] {
		zcompile "$zcompdump"
	}
} &!
