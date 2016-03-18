function histsearch
	set TMPFILE /tmp/fzf.hist

	history | fzf-tmux --no-sort --reverse --cycle \
                  --inline-info --prompt="Command> " > $TMPFILE

	and commandline --insert (cat $TMPFILE)
end
