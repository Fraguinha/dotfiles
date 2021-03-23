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
Plug 'easymotion/'      . 'vim-easymotion'
Plug 'wellle/'          . 'targets.vim'

call plug#end()

" ----------------------------------------------------------
"  Keyboard shortcuts
" ----------------------------------------------------------

" Leader key
let mapleader=" "

" Yank
nnoremap Y y$

" Clipboard
nnoremap <leader>y "*y
nnoremap <leader>Y "*y$
nnoremap <leader>yy "*yy

nnoremap <leader>d "*d
nnoremap <leader>D "*D
nnoremap <leader>dd "*dd

nnoremap <leader>p "*p
nnoremap <leader>P "*P

" Highlight
nnoremap <C-l> :nohl<CR>

" ----------------------------------------------------------
"  Plugin configuration
" ----------------------------------------------------------

" Easymotion
map <leader> <Plug>(easymotion-prefix)

nmap <Leader>s <Plug>(easymotion-sn)
xmap <Leader>s <Plug>(easymotion-sn)
omap <Leader>z <Plug>(easymotion-sn)

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

" ----------------------------------------------------------
"  VSCode
" ----------------------------------------------------------

if exists('g:vscode')

" default vscode <C-r> functionality
nnoremap <silent> <C-r> <Cmd>call VSCodeNotify('workbench.action.openRecent')<CR>

" Comments
xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

endif

" ----------------------------------------------------------
"  Commands
" ----------------------------------------------------------

" Disable automatic comments
autocmd FileType * setlocal formatoptions-=cro
autocmd FileType * set formatoptions-=cro

" Remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e
