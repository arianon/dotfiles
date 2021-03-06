set -gx BROWSER chromium
set -gx EDITOR vim
set -gx LOCAL ~/.local
set -gx PREFIX $LOCAL
set -gx GOPATH ~/.go
set -gx CARGOPATH ~/.cargo/bin
set -gx RUST_SRC_PATH /usr/src/rust/src
set -gx MAIL ~/var/mail
set -gx RBENV_SHELL fish
set -gx GPG_TTY (tty)
set -gx NODE_PATH $LOCAL/lib/node_modules
set -gx LANG en_US.UTF-8
set -gx LC_ALL $LANG
set -gx PYENV_ROOT ~/.pyenv

set -gx PATH ~/bin $CARGOPATH /usr/local/{s,}bin /{s,}bin /usr/{s,}bin $LOCAL/bin

if status --is-login
	if [ -z "$DISPLAY" -a "$XDG_VTNR" = 1 ]
		exec startx -- -keeptty >~/.xorg.log ^&1
	end
end

if status --is-interactive and if which pyenv >/dev/null ^&1
	source $PYENV_ROOT/completions/pyenv.fish
	set -gx PYENV_SHELL fish
end	

if which keychain >/dev/null ^&1
	keychain -q -Q --eval | source
end

function fish_greeting
end

# Colors
set fish_color_autosuggestion black --bold
set fish_color_color_comment black --bold
set fish_color_command green
set fish_color_cwd blue
set fish_color_end normal
set fish_color_error red
set fish_color_normal normal
set fish_color_param normal
set fish_color_quote yellow
set fish_color_search_match --background=blue
set fish_color_redirection magenta

set fish_pager_color_prefix normal
set fish_pager_color_description black --bold

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /home/arianon/.npm/_npx/2603/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.fish ]; and . /home/arianon/.npm/_npx/2603/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.fish

# OPAM configuration
source /home/arianon/.opam/opam-init/init.fish >/dev/null ^/dev/null or true
