" nnoremap <ESC> :nohlsearch<CR><ESC>
nnoremap ñ :
noremap <space> <NOP>
let mapleader=" "

nmap <leader># I# <ESC>
nmap <leader>/ I/* <ESC>A */<ESC>

vmap <leader># :s/^\s*/&# /<CR>:nohlsearch<CR>
vmap <leader>/ <ESC>'<O/*<ESC>'>o */<ESC>:'<,'>s/^\s*/& * /<CR>:nohlsearch<CR>

nnoremap <leader>rv :source ~/.vimrc<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>Q :wq<CR>
nnoremap <leader>p :set paste!<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>b :split<CR>
nnoremap <leader>h :help<CR>
nnoremap <leader>H :vert help<CR>

