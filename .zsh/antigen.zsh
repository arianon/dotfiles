zmodload zsh/zprof

# plug="${0:h}/antigen/antigen.zsh"

if [[ -f "$plug" ]]; then
	source $plug
else
	echo "Could not load antigen.zsh!" >&2
	return 1
fi

# antigen use oh-my-zsh

antigen bundles <<EOB
zsh-users/zsh-completions
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search

mafredri/zsh-async
sindresorhus/pure
EOB

antigen apply
