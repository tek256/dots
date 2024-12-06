" I use this FZF plugin to swap between buffers & files heavily
call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'tpope/vim-obsession'
  Plug 'tek256/simple-dark'
  Plug 'skywind3000/asyncrun.vim'
call plug#end()

" Auto tagging
au BufWritePost *.c,*.cpp,*.h silent! execute '!ctags --exclude=.git --exclude=build --exclude=tools/shd_builder/SDL_shadercross/ -R > /dev/null 2>&1 &'

" Whitebox stuff
" source /home/devon/.vim/plugin/whitebox/whitebox.vim
" command! Dbg call WhiteBoxConnect()

" Toggle quick fix/output window
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
        normal! G
    else
        cclose
    endif
endfunction

" General configurations
set ttymouse=sgr
set mouse=a
set backspace=indent,eol,start
set scrolloff=10

set tabstop=2
set shiftwidth=2
set expandtab

" Hide unsaved buffer warning
set hidden

set autoindent
set ignorecase 
set timeoutlen=1000 ttimeoutlen=0

" Debugger
packadd! termdebug
command! -nargs=* -complete=command Dbg Termdebug <args>

let g:asyncrun_rootmarks = ['.git', 'CMakePresets.json']

" TODO:
" - F5: Build & Run
" - F6: Build & Debug
" - F7: Full rebuild
" Build that shit
nnoremap <silent> <F1> :call ToggleQuickFix()<CR>
nnoremap <F4> :AsyncRun cmake --build build<CR>
nnoremap <F5> :AsyncRun -cwd=<root> cmake --build build && cd build/out && ./engine<CR>
nnoremap :dbg :Dbg<CR>
nnoremap <F6> :Dbg<CR>
" nnoremap <C-[> :b#<CR>

" Auto open asyncrun quickfix
let g:asyncrun_open=8

" Format for clang error output
set errorformat=%f:%l:%c:\ %trror:\ %m

" Ignore warnings in quickfix window
set errorformat+=%-G%f:%l:%c:\ %tarning:\ %m



nnoremap :W<cr> :w<cr>
nnoremap :Wq :wq
nnoremap <C-s> :w<cr>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Auto regen ctags
" au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &

" Build & run
map <C-x> :!zsh -xc "cmake --build build"
map <C-o> :silent !{zsh -xc "cd build/game && ./game && cd ../.."}

" No temporary files
set noundofile
set noswapfile
set nobackup

" Visual apperance
set shortmess+=I
set nonumber 
set laststatus=0  " It's this line, I'll try to fix this/create an issue
" later to be fixed

set background=dark 
colorscheme simple-dark 

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --ignore-file-case-insensitive --ignore-case'

function! Rgfiles(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --ignore-case --hidden -g "!.git" -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command, '--exact', '--pointer=@', '-i', '-m', '--cycle', '--marker=*', '--ansi']}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -bang -nargs=? -complete=dir Files 
  \ call fzf#vim#files(<q-args>, {'options': ['--info=inline']}, <bang>0)

command! -bang -nargs=* Rgstuff call Rgfiles(<q-args>, <bang>0) 

" FZF Config
nnoremap <silent> <C-p> :Files<cr>
nnoremap <silent> <C-b> :Buffers<cr>
nnoremap <silent> <C-g> :Rgstuff<cr>

let g:fzf_preview_window = ['hidden']
let g:fzf_layout = { 'down' : '35%' }

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

