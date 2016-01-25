# rbenv {{{
if [[ -s "$HOME/.rbenv/bin/rbenv" ]]; then
  path=(~/.rbenv/bin $path)
  eval "$(rbenv init - --no-rehash zsh)"
elif (( $+commands[rbenv] )); then
  eval "$(rbenv init - --no-rehash zsh)"
else
  path(~/.gem/ruby/*/bin(N) $path)
fi
# }}}
# go {{{
if [[ -n "$GOPATH" ]]; then
  path($GOPATH/bin(N) $path)
fi
# }}}

path=(
     ~/bin
     ~/.local/bin
     ~/.cargo/bin(N)
     ~/.cabal/bin(N)
     $path
)

if [[ $(tty) == "/dev/tty1" ]] startx
