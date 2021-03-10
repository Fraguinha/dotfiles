" ----------------------------------------------------------
"  Plugins
" ----------------------------------------------------------

" Vim-plug
call plug#begin('~/.config/nvim/plugged')

" Vim-plug documentation
Plug 'junegunn/'        . 'vim-plug'

" Theme
Plug 'vim-airline/'     . 'vim-airline'

" Extensions
Plug 'michaeljsmith/'   . 'vim-indent-object'
Plug 'machakann/'       . 'vim-sandwich'
Plug 'justinmk/'        . 'vim-sneak'
Plug 'wellle/'          . 'targets.vim'

call plug#end()

" ----------------------------------------------------------
"  Plugin configuration
" ----------------------------------------------------------

" Sandwich
runtime macros/sandwich/keymap/surround.vim

nmap ss yss
nmap s ys
nmap S yS

" surround text objects
xmap is <Plug>(textobj-sandwich-query-i)
xmap as <Plug>(textobj-sandwich-query-a)
omap is <Plug>(textobj-sandwich-query-i)
omap as <Plug>(textobj-sandwich-query-a)

xmap iss <Plug>(textobj-sandwich-auto-i)
xmap ass <Plug>(textobj-sandwich-auto-a)
omap iss <Plug>(textobj-sandwich-auto-i)
omap ass <Plug>(textobj-sandwich-auto-a)

" Sneak
let g:sneak#absolute_dir = 1
let g:sneak#use_ic_scs = 1
let g:sneak#s_next = 1

nmap ç <Plug>Sneak_s
nmap Ç <Plug>Sneak_S

nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T

" ----------------------------------------------------------
"  Keyboard shortcuts
" ----------------------------------------------------------

" Leader key
let mapleader=" "

" Paragraphs
nnoremap <C-j> }
nnoremap <C-k> {

" Macros
nnoremap Q @

" Undo
nnoremap U <C-r>

" Yank
nnoremap Y y$

" Marks
nnoremap § `

" Clipboard
nnoremap <leader>y "*y
nnoremap <leader>Y "*y$
nnoremap <leader>yy "*yy

nnoremap <leader>d "*d
nnoremap <leader>D "*D
nnoremap <leader>dd "*dd

nnoremap <leader>p "*p
nnoremap <leader>P "*P

" Space
nnoremap <space> <nop>

" Delete/Backspace
nnoremap <del> x
nnoremap <bs> X


" ----------------------------------------------------------
"  VSCode
" ----------------------------------------------------------

if exists('g:vscode')

nnoremap <silent> <C-r> <Cmd>call VSCodeNotify('workbench.action.openRecent')<CR>

endif

" ----------------------------------------------------------
"  Commands
" ----------------------------------------------------------

" Disable automatic commentsN
autocmd FileType * setlocal formatoptions-=cro
autocmd FileType * set formatoptions-=cro

" Remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e
