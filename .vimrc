set tabstop=4
set backspace=2
" set smartindent
set shiftwidth=4
set number
" super important aliasing
:command WQ wq
:command Wq wq
:command W w
:command Q q
syntax on
" to disable mouse, 'set mouse=c'
set mouse=a
" Other color scheme that i like
" colo darkspectrum
colorscheme molokai
filetype plugin indent on
execute pathogen#infect()
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
set exrc
set secure

" view whitespace characters
" set list
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

" changes cursor for insert/command modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" 80+ char highlighting
" match ErrorMsg '\%>80v.\+'

" 80+ line wrap
" set tw=79

" wrap with no line breaks
" set wrap

" PYTHON:
" Use this if spaces, not tabs
" expandtab
"
" prevents annoying comments starting at beginning of lines:
" set cindent
"
" used for folding
" set foldmethod=indent 
"
" If tab is mixed between spaces and tabs, execute the following:
" retab
