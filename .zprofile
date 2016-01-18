path=(
	~/bin
	~/.local/bin
	~/.cargo/bin(N)
	~/.cabal/bin(N)
	~/.gem/ruby/*/bin(N)
	$GOPATH/bin(N)
	$path
)

if [[ $(tty) == "/dev/tty1" ]] startx
