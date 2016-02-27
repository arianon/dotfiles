setenv BROWSER firefox
setenv EDITOR vim
setenv LOCAL ~/.local
setenv GOPATH ~/.go

setenv PATH ~/bin $LOCAL/bin /usr/bin /usr/sbin

if status -il
	if [ -z "$DISPLAY" -a "$XDG_VTNR" = 1 ]
		exec startx -- -keeptty >~/.xorg.log ^&1
	end
end

set -e fish_greeting

set __fish_git_prompt_showdirtystate 'true'
set __fish_git_prompt_color_branch 'yellow'
set __fish_git_prompt_showupstream 'name'

set __fish_git_prompt_char_dirtystate '!'
set __fish_git_prompt_char_upstream_equal ''

# Colors
set fish_color_autosuggestion black --bold
set fish_color_color_comment black --bold
set fish_color_command green
set fish_color_cwd normal
set fish_color_end normal
set fish_color_error red
set fish_color_normal normal
set fish_color_param normal
set fish_color_quote yellow
set fish_color_search_match --background=blue
set fish_color_redirection magenta

set fish_pager_color_prefix normal
set fish_pager_color_description black --bold
