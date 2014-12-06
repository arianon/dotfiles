" ╻ ╻╻┏┳┓┏━┓┏━╸
" ┃┏┛┃┃┃┃┣┳┛┃  
" ┗┛ ╹╹ ╹╹┗╸┗━╸

set nocompatible | syntax on | filetype plugin indent on
colorscheme delek
set t_Co=16
set background=dark

" Theme
hi Comment		ctermfg=0
hi LineNr		ctermfg=0
hi StatusLine	ctermbg=NONE

" No more autocomments
au FileType * setlocal formatoptions-=cro

" Return to last edit position when opening files
au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\ exe "normal! g`\"" |
			\ endif

" COMMENTED OUT BECAUSE I NEED TO GROK VI

" Plugins
"filetype off
" set runtimepath+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

" Plugin 'gmarik/Vundle.vim'
" Plugin 'itchyny/lightline.vim'
" Plugin 'fatih/vim-go'
" Plugin 'mattn/emmet-vim'

" call vundle#end()
" filetype on

