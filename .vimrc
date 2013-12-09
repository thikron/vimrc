" Use Pathogen:
call pathogen#incubate()
call pathogen#helptags()

" ========================================================================
" Vundle stuff
" ========================================================================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle (required)!
Bundle 'gmarik/vundle'

" My bundles
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-cucumber'
Bundle 'kchmck/vim-coffee-script'

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim
" http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod

if has('gui_running')
	set guifont=Consolas:h14
endif

set backup
set backupdir=~/temp
set dir=~/temp

set enc=utf-8
set fenc=utf-8
set fileencodings=ucs-bom,utf8,prc
set ff=unix

"show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red  
au InsertLeave * match ExtraWhitespace /\s\+$/     

syntax on
set tabstop=2
set shiftwidth=2
set ignorecase
set backspace=2
set nocompatible

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233
set bg=light

" Set gutter background to black
highlight SignColumn ctermbg=black

" Highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow

"php
set omnifunc=phpcomplete#CompletePHP
filetype plugin on
au BufNewFile,BufRead *.endfile set filetype=endfile
let php_noShortTags=0
filetype plugin indent on

"gui optionen
set go-=T
set go-=m

" Make the omnicomplete text readable
:highlight PmenuSel ctermfg=black

let mapleader = ","

"javascript
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

"vimrc file $MYVIMRC
if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

nnoremap <leader>v :tabedit $MYVIMRC<cr>

"cool command tabbing option
set wildmenu
set wildmode=full

nnoremap <space> za
nnoremap <C-?> <C-]>
