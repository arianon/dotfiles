set -gx BROWSER firefox
set -gx EDITOR vim
set -gx LOCAL ~/.local
set -gx GOPATH ~/.go
set -gx RUST_SRC_PATH /usr/src/rust/src
set -gx MAIL ~/var/mail

set -gx PATH ~/bin $LOCAL/bin ~/.cargo/bin ~/.gem/ruby/2.3.0/bin \
             /usr/local/bin /usr/bin /bin /usr/local/sbin /usr/sbin /sbin
