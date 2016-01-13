alias cp="cp -av"
alias rm="rm -iv"
alias mv="mv -v"
alias mkdir="mkdir -p"
alias make="make -j$(nproc)"
alias grep="grep --color=auto"
alias diff="diff -Naur"
alias rnb="toilet --gay -t -f future"
alias weechat="abduco -A /tmp/weechat.sk weechat"
alias ec="emacsclient --no-wait -c"
alias et="emacsclient -t"
alias so="source ~/.zshrc"
alias :q="exit"
alias quit="exit"
alias zmv="noglob zmv"

if (( $+commands[hub] )) {
	alias git="noglob hub"
} else {
	alias git="noglob git"
}

if (( $+commands[aura] )) {
	alias pacman="sudo aura"
	alias aura="sudo aura"
}

if (( $+commands[ls++] )) {
  alias ls="ls++"
  alias la="ls++ -A"
} else {
  alias ls="ls -BFX --group-directories-first --color=auto"
  alias l="ls -goh"
  alias la="ls -Ah"
  alias ll="ls -Agoh"
}
