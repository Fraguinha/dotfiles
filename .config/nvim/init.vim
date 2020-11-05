" ----------------------------------------------------------
"  Plugins
" ----------------------------------------------------------

" Bootstrap Vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim-plug
call plug#begin('~/.config/nvim/plugged')

" Vim-plug documentation
Plug 'junegunn/'        . 'vim-plug'

" Theme
Plug 'morhetz/'         . 'gruvbox'
Plug 'vim-airline/'     . 'vim-airline'

" Extensions
Plug 'michaeljsmith/'   . 'vim-indent-object'
Plug 'machakann/'       . 'vim-sandwich'
Plug 'justinmk/'        . 'vim-sneak'
Plug 'wellle/'          . 'targets.vim'

call plug#end()

" Install missing plugins on start
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \  | PlugInstall --sync | PlugClean | bd
  \  endif

" ----------------------------------------------------------
"  Plugin configuration
" ----------------------------------------------------------

" Theme
if !empty(glob("~/.config/nvim/plugged/gruvbox/colors/gruvbox.vim"))
  colorscheme gruvbox
  set background=dark
endif

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

map ç <Plug>Sneak_s
map Ç <Plug>Sneak_S

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" ----------------------------------------------------------
"  General settings
" ----------------------------------------------------------

" Line highlight
set cursorline

" Search settings
set incsearch
set ignorecase
set smartcase

" Indentation settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Undo/redo settings
set undofile

" Backup settings
set nobackup
set nowritebackup

" ----------------------------------------------------------
"  Keyboard shortcuts
" ----------------------------------------------------------

" Leader key
let mapleader=" "

" Clear screen
nnoremap <C-l> :nohl<CR><C-L>

" Paragraphs
nnoremap <C-j> }
nnoremap <C-k> {

" Undo
nnoremap U <C-r>

" Yank
nnoremap Y y$

" Marks
nnoremap § `

" ----------------------------------------------------------
"  Commands
" ----------------------------------------------------------

" Disable automatic commentsN
autocmd FileType * setlocal formatoptions-=cro
autocmd FileType * set formatoptions-=cro

" Remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Reload init.vim after saving
autocmd! BufWritePost $MYVIMRC source $MYVIMRC | PlugInstall --sync | PlugClean | bd
