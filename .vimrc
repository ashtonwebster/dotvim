"share clipboard with mac
set clipboard=unnamed

" lowercase search: case insensitive
" search containing uppercase: case sensitive
set ignorecase
set smartcase

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

nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

" Run syntastic check
nnoremap <silent> \ee :SyntasticCheck<CR>
" Opens location list of syntax errors
nnoremap <silent> \el :SyntasticCheck<CR>:SyntasticSetLoclist<CR>:Error<CR><C-w><C-w>
" Next error
nnoremap <silent> \en :SyntasticCheck<CR>:lnext<CR>
" prev error
nnoremap <silent> \ep :SyntasticCheck<CR>:lprev<CR>
" Close location list
nnoremap <silent> \eq :lclose<CR>

" view whitespace characters
" set list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

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

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" disable temporarily
" let g:syntastic_python_checkers = [ "pep8" ]
let g:syntastic_python_checkers = []


" Disable by default
let b:syntastic_mode="passive"

" PYTHON:
" Use this if spaces, not tabs
set expandtab
"
" prevents annoying comments starting at beginning of lines:
" set cindent
"
" used for folding
" set foldmethod=indent 
"
" If tab is mixed between spaces and tabs, execute the following after
" expandtab to set everything back to normal:
" retab
"

"Don't use the arrow keys...
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Use alt to move around in insert
"inoremap ˙ <Esc>i
"inoremap ∆ <Esc>ji
"inoremap ˚ <Esc>ki
" when you go from insert to normal mode the cursor moves one space left...
" so we have to 2 to the right
"inoremap ¬ <Esc>lli

" COQ MAPPINGS"
map <silent> <F1> :CoqLaunch<CR>
map <silent> <F2> :CoqUndo<CR>
map <silent> <F3> :CoqNext<CR>
map <silent> <F4> :CoqToCursor<CR>
map <silent> <F5> :CoqKill<CR>
imap <silent> <F1> <C-\><C-o>:CoqLaunch<CR>
imap <silent> <F2> <C-\><C-o>:CoqUndo<CR>
imap <silent> <F3> <C-\><C-o>:CoqNext<CR>
imap <silent> <F4> <C-\><C-o>:CoqToCursor<CR>
imap <silent> <F5>  <C-\><C-o>:CoqKill<CR>

map <silent> <F7> :tabp<CR>
map <silent> <F8> :tabn<CR>
imap <silent> <F7> <C-\><C-o>:tabp<CR>
imap <silent> <F8>  <C-\><C-o>:tabn<CR>

" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif
