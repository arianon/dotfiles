set -gx BROWSER firefox
set -gx EDITOR emacsclient
set -gx LOCAL ~/.local
set -gx GOPATH ~/.go
set -gx RUST_SRC_PATH /usr/src/rust/src
set -gx MAIL ~/var/mail
set -gx RBENV_SHELL fish
set -gx GPG_TTY (tty)

set -gx PATH ~/bin $LOCAL/bin ~/.cargo/bin ~/.rbenv/bin ~/.rbenv/shims ~/.gem/ruby/2.3.0/bin \
             /usr/bin/{core,site,vendor}_perl /usr/bin

if status --is-login
	if [ -z "$DISPLAY" -a "$XDG_VTNR" = 1 ]
		exec startx -- -keeptty >~/.xorg.log ^&1
	end
end

function fish_greeting
	fortune
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

source ~/.rbenv/completions/rbenv.fish
