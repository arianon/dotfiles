# Flags
alias cp "cp -av"
alias rm "rm -iv"
alias mv "mv -v"
alias mkdir "mkdir -p"
alias make "make -j"
alias diff "diff -Naur"

# Stuff
alias yget "youtube-dl -o '%(title)s.%(ext)s'"

if exists pacaur
	alias pacman "pacaur"
end

if exists ls++
	alias ls "ls++"
	alias la "ls++ -A"
else
	alias ls "ls -BFX --group-directories-first --color=auto"
	alias l "ls -goh"
	alias la "ls -Ah"
	alias ll "ls -Agoh"
end

# Emacs
alias ec "emacsclient --no-wait -c"
alias et "emacsclient -t"

alias .. "cd .."
alias ... "cd ../../"
alias .... "cd ../../../"
alias ..... "cd ../../../../"
