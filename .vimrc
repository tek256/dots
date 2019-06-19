call plug#begin('~/.vim/plugged')
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
call plug#end()

set shortmess+=I
set mouse=a
set number
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set laststatus=3
set background=dark
set autochdir
set noswapfile
set nobackup
set noundofile

nnoremap <C-s> :w<cr>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <C-p> :Files<cr>
nnoremap <C-b> :Buffers<cr>

colorscheme 256_noir
hi NonText guifg=bg
