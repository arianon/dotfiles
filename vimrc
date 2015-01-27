" ╻ ╻╻┏┳┓┏━┓┏━╸
" ┃┏┛┃┃┃┃┣┳┛┃  
" ┗┛ ╹╹ ╹╹┗╸┗━╸

set nocompatible | syntax on | filetype plugin indent on
colorscheme term
set t_Co=16
"set background=dark

" No more autocomments
au FileType * setlocal formatoptions-=cro

" Return to last edit position when opening files
au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\ exe "normal! g`\"" |
			\ endif

" Plugins
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
" Plugin 'itchyny/lightline.vim'
" Plugin 'fatih/vim-go'
" Plugin 'mattn/emmet-vim'

call vundle#end()
filetype on

