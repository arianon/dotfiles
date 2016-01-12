if (( ! $+commands[fasd] )) {
       return 1
}

fasd_cache="$HOME/.fasd.cache.zsh"

if [[ $commands[fasd] -nt "$fasd_cache" || ! -s "$fasd_cache" ]] {
	fasd --init posix-alias \
		zsh-hook \
		zsh-ccomp \
		zsh-install \
		zsh-wcomp \
		zsh-wcomp-install \
	>| "$fasd_cache"
}

source "$fasd_cache"
unset fasd_cache
