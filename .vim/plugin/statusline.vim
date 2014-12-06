set noshowmode

hi User9 ctermfg=12
hi User1 ctermfg=9
hi User2 ctermfg=10
hi User3 ctermfg=11
hi User4 ctermfg=12
hi User5 ctermfg=13
hi User6 ctermfg=14
hi User7 ctermfg=15

set statusline=

set statusline+=%9*%{GetStatusMode()} " Current mode
set statusline+=%7*\ %<%F\ 	" File path
set statusline+=%2*%m		" Modified flag
set statusline+=%3*\ %y\ 	" Filetype

set statusline+=%*%=		" Right align from here

set statusline+=%2*\ %l\ 	" Current line
set statusline+=%1*\ %v\ 	" Current column
set statusline+=%5*\ %P\ 	" Percentage through file

fu! GetStatusMode()
	return "  " . mode() . " "
endfu

