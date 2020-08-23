" ====== General Configurations ======
colorscheme ron
hi Normal ctermbg=NONE

set mouse=a
set noswapfile

syntax on
set number
set autoindent
set cursorline
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set clipboard=unnamed

" ====== MS-Windows ======
behave mswin
set ve+=onemore
set backspace=indent,eol,start whichwrap+=<,>,[,]

" backspace for visual mode
vnoremap <BS> d

" HOME
nnoremap <HOME> ^
inoremap <HOME> <C-O>^

" END
nnoremap <END> $<Right>

" Ctrl+HOME
nnoremap <C-HOME> gg
inoremap <C-HOME> <C-O>gg

" Ctrl+END
nmap <C-END> G<END>
imap <C-END> <C-O>G<C-O><END>

" select all
nnoremap <C-A> ggvG$
inoremap <C-A> <C-O>gg<C-O>vG$
vnoremap <C-A> <ESC><ESC>ggvG$

" copy
"vnoremap <C-C> "+y
vnoremap <C-S-C> "+y

" paste
noremap <C-V> "+gP
inoremap <C-V> <ESC>"+gPi

" cut
vnoremap <C-X> "+c

" save
nnoremap <C-S> :w<CR>
inoremap <C-S> <C-O>:w<CR>

" undo
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" redo
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

" find
nnoremap <C-F> /
inoremap <C-F> <C-O>/
nnoremap <F3> n
inoremap <F3> <C-O>n
nnoremap <S-F3> N
inoremap <S-F3> <C-O>N

" goto
nnoremap <C-G> :
inoremap <C-G> <C-O>:

" ====== Custom Configurations ======

" hex mode
" shortcut key: Ctrl+F
let s:hexmode = 0

function ToggleHexMode()
    if !s:hexmode
        execute "%!xxd"
        set ft=xxd
        let s:hexmode = 1
    else
        execute "%!xxd -r"
        filetype detect
        let s:hexmode = 0
    endif
endfunction

nnoremap <C-H> :call ToggleHexMode()<CR>

" toggle transparent
" shortcut key: F8
let s:transparent = 1

function ToggleTransparent()
    if s:transparent
        hi Normal ctermbg=black
        let s:transparent = 0
    else
        hi Normal ctermbg=NONE
        let s:transparent = 1
    endif
endfunction

noremap <F8> :call ToggleTransparent()<CR>
inoremap <F8> <C-O>:call ToggleTransparent()<CR>
