call plug#begin('~/.vim/plugged')
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
call plug#end()

set number
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set laststatus=3
set background=dark
set autochdir

nnoremap <C-p> :Files<cr>
nnoremap <C-b> :Buffers<cr>

colorscheme 256_noir
