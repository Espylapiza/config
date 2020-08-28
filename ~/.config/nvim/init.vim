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
snoremap <BS> d

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

" scroll
noremap <ScrollWheelUp> <C-Y>
noremap <ScrollWheelDown> <C-E>
inoremap <ScrollWheelUp> <C-O><C-Y>
inoremap <ScrollWheelDown> <C-O><C-E>
nnoremap <M-Up> <C-Y>
nnoremap <ESC>[1;9A <C-Y>
"nnoremap <ALT-Down> <C-E>
"nnoremap <ESC>[1;9B <C-E>
"map <ESC>[1;9D 3k
"map <A-J> j
"map <M-J> j
"map <ALT-J> j
"map <ESC><J> j
"map ∆ j
"map ^[[1;9B 4j

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
vnoremap <C-V> <nop>
" nnoremap <C-S-V> "+gP
inoremap <C-V> <C-O>"+gP
" inoremap <C-S-V> <C-O>"+gP
snoremap <C-V> <C-O>"_d"+gP

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

let s:smooth_scroll_state = {
\ 'impulse': 0.0,
\ 'velocity': 0.0,
\ 'delta': 0.0,
\ }

if !exists('g:comfortable_motion_interval')
    let g:comfortable_motion_interval = 1.0 / 60
endif
if !exists('g:comfortable_motion_friction')
    let g:comfortable_motion_friction = 80.0
endif
if !exists('g:comfortable_motion_air_drag')
    let g:comfortable_motion_air_drag = 2.0
endif

function! s:tick(timer_id)
    let l:st = s:smooth_scroll_state  " This is just an alias for the global variable
    if abs(l:st.velocity) >= 1 || l:st.impulse != 0 " short-circuit if velocity is less than one
        let l:dt = g:comfortable_motion_interval

        " Compute resistance forces
        let l:vel_sign = l:st.velocity == 0
          \            ? 0
          \            : l:st.velocity / abs(l:st.velocity)
        let l:friction = -l:vel_sign * g:comfortable_motion_friction * 1  " The mass is 1
        let l:air_drag = -l:st.velocity * g:comfortable_motion_air_drag
        let l:additional_force = l:friction + l:air_drag

        " Update the state
        let l:st.delta += l:st.velocity * l:dt
        let l:st.velocity += l:st.impulse + (abs(l:additional_force * l:dt) > abs(l:st.velocity) ? -l:st.velocity : l:additional_force * l:dt)
        let l:st.impulse = 0

        " Scroll
        let l:int_delta = float2nr(l:st.delta >= 0 ? floor(l:st.delta) : ceil(l:st.delta))
        let l:st.delta -= l:int_delta
        if l:int_delta > 0
            execute "normal! " . string(abs(l:int_delta)) . "\<C-E>"
        elseif l:int_delta < 0
            execute "normal! " . string(abs(l:int_delta)) . "\<C-Y>"
        else
            " Do nothing
        endif
        redraw
    else
        " Stop scrolling and the thread
        let l:st.velocity = 0
        let l:st.delta = 0
        call timer_stop(s:timer_id)
        unlet s:timer_id
    endif
endfunction

function SmoothScroll(delta, impulse)
    if !exists('s:timer_id')
        let s:timer_id = timer_start(20, function("s:tick"), {'repeat': -1})
    endif
    let l:st = s:smooth_scroll_state  " This is just an alias for the global variable
    if l:st.delta < 0 && a:delta > 0
        let l:st.delta = a:delta
    elseif l:st.delta > 0 && a:delta < 0
        let l:st.delta = a:delta
    else
        let l:st.delta += a:delta
    endif
    let s:smooth_scroll_state.impulse += a:impulse
endfunction

"nnoremap <silent> <Down> :call SmoothScroll(10)<CR>
"nnoremap <silent> <Up> :call SmoothScroll(-10)<CR>
nnoremap <silent> <PageDown> :call SmoothScroll(20, 100)<CR>
nnoremap <silent> <PageUp> :call SmoothScroll(-20, -100)<CR>

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

