" I use this FZF plugin to swap between buffers & files heavily
call plug#begin('~/.vim/plugged')
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
call plug#end()

" General configurations
set shortmess+=I
set mouse=a
set nonumber
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set laststatus=3
set background=dark
set autochdir
set noundofile
set noswapfile
set nobackup
set scrolloff=10

" Gotta use my own colorscheme
colorscheme simple-dark

" Simple keybindings for sanity's sake
nnoremap :W<cr> :w<cr>
nnoremap <C-s> :w<cr>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" FZF Config
nnoremap <C-p> :GFiles --cached --others --exclude-standard<cr>
nnoremap <C-b> :Buffers<cr>
nnoremap <C-g> :Rg<cr>
let g:fzf_preview_window = ''
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" Clang Format config
let g:clang_format#auto_format = 1
let g:clang_format#code_style = "LLVM"
let g:clang_format#style_options = {
     \ "AllowShortIfStatementsOnASingleLine" : "false",
     \ "IndentCaseLabels" : "true",
     \ "IndentWidth" : 2,
     \ "PointerAlignment" : "Left",
     \ "TabWidth" : 2,
     \ "AlignConsecutiveMacros" : "true",
     \ "AlignConsecutiveAssignments" : "true",
     \ "AlignConsecutiveDeclarations" : "true",
     \ "AlignEscapedNewlines" : "true",
     \ "AlignTrailingComments" : "true",
     \ "AlignOperands" : "true",
     \ "AllowShortBlocksOnASingleLine" : "true",
     \ "AllowShortFunctionsOnASingleLine" : "true",
     \ "ColumnLimit" : 80,
     \ "KeepEmptyLinesAtTheStartOfBlocks" : "false",
     \ "SortIncludes" : "false",
     \ "SpaceAfterCStyleCast" :"false" }

" Move .viminfo file to ~/.vim/cache/.viminfo
if &compatible | set nocompatible | endif
set viminfo=%,<800,'10,/50,:100,h,f0,n~/.vim/cache/.viminfo

