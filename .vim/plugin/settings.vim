" Basic stuff

set wildmenu
set showcmd
set autoread
set autowrite

" Navigation

set scrolloff=7

set number
set ruler
set splitright
set splitbelow
set laststatus=2
set cursorline

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Indentation

set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4

set nowrap
set linebreak

" Turn off swap files
set noswapfile
set nobackup
set nowritebackup

" Persistent undo history
set undofile
set undodir=~/.vim/undo,/tmp
set undolevels=1000
set undoreload=1000
set history=1000

" Other stuff
set wildmode=longest,list:longest
set mouse=a
set complete=.,b,u,]
set completeopt=menu,preview
set noerrorbells
set omnifunc=syntaxcomplete#Complete
