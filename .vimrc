call plug#begin('~/.vim/plugged')
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'scrooloose/syntastic'
Plug 'yggdroot/indentline'
Plug 'powerline/powerline'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terroo/vim-simple-emoji'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()
autocmd VimEnter *
\ if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
\ | PlugInstall | q
\ | endif

set cursorline
set number
set mouse=a
set title
set encoding=utf-8
set nocompatible
set cursorline

filetype on
filetype plugin on
filetype indent on

syntax on

" Q: sai do vim
map q :quit<CR>
imap <C-q> <ESC>:q<CR>

" Ctrl + S: salva o arquivo
nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>i

" Alt + seta para baixo: ir para última linha
nmap <A-Down> G
imap <A-Down> <ESC>G$i

" Alt + seta para cima: ir para primeira linha
nmap <A-Up> gg
imap <A-Up> <ESC>ggi

" Ctrl + d: duplicar linha atual
nmap <C-d> myYp`y
imap <C-d> <ESC>myYp`yi

" Ctrl + e: apagar linha atual
nmap <C-e> dd
imap <C-e> <ESC>ddi

" Ctrl + seta esquerda: ir para início da palavra anterior
nmap <C-Left> b
imap <C-Left> <ESC>bi

" Ctrl + seta direita: ir para fim da próxima palavra
nmap <C-Right> e
imap <C-Right> <ESC>ea

" Ctrl + F: entrar no modo de busca
nmap <C-f> /
imap <C-f> <ESC>/

" Ctrl + A + C: copiar arquivo inteiro
nmap <C-a><C-c> ggVG"+y
imap <C-a><C-c> <ESC>ggVG"+y

" Alt + seta para cima: move linha atual para cima
nmap <C-Up> ddkP
imap <C-Up> <ESC>ddkPi

" Alt + seta para baixo: move linha atual para baixo
nmap <C-Down> ddp
imap <C-Down> <ESC>ddpi

" Ctrl + V: cola no modo normal
nmap <C-v> "+p
" Ctrl + V: cola no modo visual
vmap <C-v> "+p
