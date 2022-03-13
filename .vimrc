" I use this FZF plugin to swap between buffers & files heavily
call plug#begin('~/.vim/plugged')
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
  Plug 'tek256/simple-dark'
call plug#end()

" General configurations
set ttymouse=sgr
set mouse=a
set backspace=indent,eol,start
set scrolloff=10

set tabstop=2
set shiftwidth=2
set expandtab

set autoindent

nnoremap :W<cr> :w<cr>
nnoremap <C-s> :w<cr>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" No temporary files
set noundofile
set noswapfile
set nobackup

" Visual apperance
set shortmess+=I
set nonumber 
set laststatus=0 

set background=dark 
colorscheme simple-dark 

" FZF Config
nnoremap <C-p> :Files<cr>
nnoremap <C-b> :Buffers<cr>
nnoremap <C-g> :Rg<cr>

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
let g:fzf_preview_window = ''

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

