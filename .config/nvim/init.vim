if &compatible
  set nocompatible
endif

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'Soares/base16.nvim'
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
Plug 'felixjung/vim-base16-lightline'
Plug 'scrooloose/nerdtree'

call plug#end()

filetype plugin indent on
syntax enable
set number
" set cursorline
set mouse=a
set title
set hidden
set expandtab

" Theme
set termguicolors
set background=dark
let base16colorspace = 256
let g:base16_transparent_background = 1
let g:base16_color_overrides = {
  \ 'Normal': 'fg=contrast2',
  \ 'Comment': 'fg=similar1 italic',
  \ 'CursorLineNr': 'bg=similar2 bold',
  \ 'CursorLine': 'bg=similar2',
  \ 'MatchParen': 'bold',
  \ 'VertSplit': 'bg=base fg=similar1',
  \ }
colorscheme tomorrow

" Lightline
set laststatus=2
set showtabline=2
set noshowmode
set noshowcmd
let g:lightline = { 
  \ 'colorscheme': 'base16_tomorrow',
  \ 'tabline': {'left': [['buffers']], 'right': [[]]},
  \ 'component_expand': {'buffers': 'lightline#bufferline#buffers'},
  \ 'component_type': {'buffers': 'tabsel'}
  \ }
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#unnamed = '[No Name]'
let s:llp = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:llp.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:llp.inactive.middle = s:llp.normal.middle
let s:llp.tabline.middle = s:llp.normal.middle

" Switch buffers with Alt+number
nmap <A-1> <Plug>lightline#bufferline#go(1)
nmap <A-2> <Plug>lightline#bufferline#go(2)
nmap <A-3> <Plug>lightline#bufferline#go(3)
nmap <A-4> <Plug>lightline#bufferline#go(4)
nmap <A-5> <Plug>lightline#bufferline#go(5)
nmap <A-6> <Plug>lightline#bufferline#go(6)
nmap <A-7> <Plug>lightline#bufferline#go(7)
nmap <A-8> <Plug>lightline#bufferline#go(8)
nmap <A-9> <Plug>lightline#bufferline#go(9)
nmap <A-0> <Plug>lightline#bufferline#go(10)

" Keep swapfiles in ~/.cache
set directory=~/.cache/nvim/swapfiles

" sudo-saver
cmap w!! w !sudo tee % >/dev/null
