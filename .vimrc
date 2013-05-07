set backup
set backupdir=~/temp
set dir=~/temp

set enc=utf-8
set fenc=utf-8
set fileencodings=ucs-bom,utf8,prc
set ffs=unix

"bundle plugin
call pathogen#infect()
set background=dark
colorscheme ir_black

syntax on
set tabstop=2
set shiftwidth=2
set ignorecase
set backspace=2
set number
set nocompatible

"php
set omnifunc=phpcomplete#CompletePHP
filetype plugin on
au BufNewFile,BufRead *.endfile set filetype=endfile
let php_noShortTags=0
filetype plugin indent on

"gui optionen
set go-=T
set go-=m

let mapleader = ","

"javascript
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

"vimrc file $MYVIMRC
if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

nmap <leader>v :tabedit $MYVIMRC<cr>

"cool command tabbing option
set wildmenu
set wildmode=full

nmap <space> za
nmap <leader>nd :NERDTree<cr>
nmap <C-ö> <C-]>

