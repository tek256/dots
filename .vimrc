call plug#begin('~/.vim/plugged')
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
call plug#end()

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
set noswapfile
set nobackup
set noundofile
set scrolloff=10

nnoremap :W<cr> :w<cr>
nnoremap <C-s> :w<cr>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>

nnoremap <C-p> :Files<cr>
nnoremap <C-b> :Buffers<cr>
nnoremap <C-g> :Rg<cr>

let g:fzf_preview_window = ''
let g:clang_format#code_style = "LLVM"

nmap <Leader>C :ClangFormatAutoToggle<CR>

colorscheme simple-dark
hi NonText guifg=bg

let g:clang_format#style_options = {
     \ "AllowShortIfStatementsOnASingleLine" : "true",
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
     \ "SpaceAfterCStyleCast" : "false" }

autocmd BufNewFile,BufRead *.v,*.f set syntax=c
autocmd FileType c ClangFormatAutoEnable

autocmd FileType c nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c vnoremap <buffer><Leader>cf :ClangFormat<CR>
