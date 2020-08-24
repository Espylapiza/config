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
set clipboard=unnamedplus
set guicursor=n-v-c-sm:ver25,i-ci-ve:ver25-blinkon1,r-cr-o:hor20-blinkon1

" ====== MS-Windows ======
" behave mswin
set mousemodel=popup
set keymodel=startsel,stopsel
set selection=exclusive
autocmd InsertLeave * :normal `^
set virtualedit=onemore
set backspace=indent,eol,start
set whichwrap+=<,>,[,]
nnoremap $ $l
vnoremap $ $l
nnoremap <expr> <Left> col('.')==1?'k$l':'h'
nnoremap <expr> <BS> col('.')==1?'k$l':'h'
nnoremap <DEL> <Right>

" backspace for visual mode
" vnoremap <BS> d

" HOME
nnoremap <HOME> ^
inoremap <HOME> <C-O>^

" END
nnoremap <END> $l

" Ctrl+HOME
nnoremap <C-HOME> gg
inoremap <C-HOME> <C-O>gg

" Ctrl+END
nnoremap <C-END> G$l
inoremap <C-END> <C-O>G<END>

" fast move
nnoremap <C-Up> 4k
inoremap <C-Up> <C-O>4k
nnoremap <C-Down> 4j
inoremap <C-Down> <C-O>4j
nnoremap <C-Left> b
nnoremap <C-Right> w

" select
inoremap <S-Up> <C-O>gh<C-O>k
inoremap <S-Down> <C-O>gh<C-O>j
inoremap <S-Left> <C-O>gh<S-Left>
inoremap <S-Right> <C-O>gh<S-Right>
inoremap <S-End> <C-O>gh<C-O>$<C-O>l
inoremap <S-Home> <C-O>gh<C-O>^
nnoremap <S-End> v$h " fix a weird bug
vnoremap <S-End> $h " fix a weird bug
" TODO: Shift + PageUp/PageDown
" nnoremap <S-PageDown> gh<C-O><C-D>

" fast select
nnoremap <C-S-Up> v4k
vnoremap <C-S-Up> 4k
inoremap <C-S-Up> <C-O>gh<C-O>4k
snoremap <C-S-Up> <C-O>4k

nnoremap <C-S-Down> v4j
vnoremap <C-S-Down> 4j
inoremap <C-S-Down> <C-O>gh<C-O>4j
snoremap <C-S-Down> <C-O>4j

nnoremap <C-S-Left> vb
vnoremap <C-S-Left> b
inoremap <C-S-Left> <C-O>gh<C-O>b
snoremap <C-S-Left> <C-O>b

nnoremap <C-S-Right> vw
vnoremap <C-S-Right> w
inoremap <C-S-Right> <C-O>gh<C-O>w
snoremap <C-S-Right> <C-O>w

nnoremap <C-S-Home> vgg
vnoremap <C-S-Home> gg
inoremap <C-S-Home> <C-O>gh<C-O>gg
snoremap <C-S-Home> <C-O>gg

nnoremap <C-S-End> vG$l
vnoremap <C-S-End> G$l
inoremap <C-S-End> <C-O>gh<C-O>G<C-O>$<C-O>l
snoremap <C-S-End> <C-O>G<C-O>$<C-O>l

" select all
nnoremap <C-A> ggvG$
inoremap <C-A> <C-O>gg<C-O>vG$
vnoremap <C-A> <ESC><ESC>ggvG$

" select word
nnoremap <C-D> hviw<C-G>
vnoremap <C-D> <ESC>hviw<C-G>
inoremap <C-D> <C-O>h<C-O>viw<C-G>
snoremap <C-D> <C-O>iw

" copy
"vnoremap <C-C> "+y
vnoremap <C-C> ygv
"snoremap <C-C> "+y
"vnoremap <C-S-C> "+y

" paste
nnoremap <C-V> "+gP
" nnoremap <C-S-V> "+gP
inoremap <C-V> <C-O>"+gP
" inoremap <C-S-V> <C-O>"+gP

" cut
vnoremap <C-X> "+c

" save
nnoremap <C-S> :w<CR>
" nnoremap <C-S-S> :w<CR>
inoremap <C-S> <C-O>:w<CR>
"inoremap <C-S-S> <C-O>:w<CR>

" undo
noremap <C-Z> u
inoremap <C-Z> <C-O>u
snoremap <C-Z> <ESC>

" redo
noremap <C-Y> <C-R>
" noremap <C-S-Z> <C-R>
inoremap <C-Y> <C-O><C-R>
" inoremap <C-S-Z> <C-O><C-R>

" find
nnoremap <C-F> /
inoremap <C-F> <C-O>/
nnoremap <F3> n
inoremap <F3> <C-O>n
nnoremap <S-F3> N
inoremap <S-F3> <C-O>N

" goto line
nnoremap <C-G> :
inoremap <C-G> <C-O>:

" exit
nnoremap <C-Q> :q<CR>
inoremap <C-Q> <C-O>:q<CR>
vnoremap <C-Q> <ESC>:q<CR>

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

