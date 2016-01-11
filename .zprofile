path=(
	~/bin
	~/.local/bin
	~/.cargo/bin(N)
	~/.cabal/bin(N)
	$GOPATH/bin(N)
	$path
)

if [[ $(tty) == "/dev/tty1" ]] startx
