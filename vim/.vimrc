" INIT
set nocompatible
syntax enable
colorscheme term
filetype plugin indent on

" PLUGINS
call plug#begin()

Plug 'baskerville/vim-sxhkdrc'
Plug 'leafo/moonscript-vim'
Plug 'PotatoesMaster/i3-vim-syntax'

" Usability
" Plug 'jiangmiao/auto-pairs'
" Plug 'raiMondi/delimitMate'
" Plug 'kien/ctrlp.vim'
" Plug 'Shougo/neocomplcache.vim' | let g:neocomplcache_enable_at_startup = 1
" Plug 'scrooloose/syntastic'

" Plug 'garbas/vim-snipmate'
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'honza/vim-snippets'

" pseudo-IDEs
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

" Misc
" Plug 'itchyny/lightline.vim'
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'scrooloose/nerdcommenter'
" Plug 'Shougo/vimproc', { 'do': 'make' }
" Plug 'Valloric/YouCompleteMe'
" Plug 'tpope/vim-fugitive'

call plug#end()

" INTERFACE
set foldmethod=marker
set scrolloff=7
set number
set relativenumber
set ruler
set splitright
set splitbelow
set laststatus=2
set cursorline
set nowrap
set linebreak
set wildmenu
set showcmd
set ttyfast


" SEARCH
set nohlsearch
set incsearch
set ignorecase
set smartcase

" INDENTATION
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4

" HISTORY AND BACKUPS
set noswapfile
set nobackup
set nowritebackup

set undofile
set undodir=~/.vim/undo,/tmp
set undolevels=1000
set undoreload=1000
set history=1000

" MISCELLANEOUS
set backspace=indent,eol,start
set autoread
set autowrite
set virtualedit=block
set wildmode=longest,list:longest
set mouse=a
set complete=,b,u,]
set completeopt=menu,preview
set noerrorbells
set omnifunc=syntaxcomplete#Complete
 
" KEYBINDS
nnoremap ñ :
noremap <space> <NOP>
let mapleader=" "

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

nmap <leader># I# <ESC>
nmap <leader>/ I/* <ESC>A */<ESC>

vmap <leader># :s/^\s*/&# /<CR>:nohlsearch<CR>
vmap <leader>/ <ESC>'<O/*<ESC>'>o */<ESC>:'<,'>s/^\s*/& * /<CR>:nohlsearch<CR>

vmap > >gv
vmap < <gv
vmap = =gv

nnoremap <silent><leader>c :nohlsearch<CR>
nnoremap <leader>rv :source ~/.vimrc<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>Q :wq<CR>
nnoremap <leader>p :set paste!<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>b :split<CR>
nnoremap <leader>h :help<CR>
nnoremap <leader>H :vert help<CR>
"}}}
" STATUSBAR
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

set statusline+=%9*\ \ %{mode()}   " Current mode
set statusline+=%7*\ %<%F          " File path
set statusline+=%2*\ %m            " Modified flag
set statusline+=%3*\ %y            " Filetype

set statusline+=%*%=               " Right align from here

set statusline+=%2*\ %l            " Current line
set statusline+=%7*,               " Comma
set statusline+=%1*%v              " Current column
set statusline+=%7*\ -               " Dash
set statusline+=%5*\ %P            " Percentage through file

" TRIGGERS

" No more autocomments
au FileType * setlocal formatoptions-=cro

" Ruby
au FileType ruby
		\ set sts=2 ts=2 sw=2 et

" Return to last edit position when opening files
au BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\ exe "normal! g`\"" |
		\ endif




" vim: fdm=marker
