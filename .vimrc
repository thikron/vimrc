" Use Pathogen:
execute pathogen#infect()
call pathogen#helptags()

" ========================================================================
" Vundle stuff
" ========================================================================
set rtp+=$HOME/vimfiles/bundle/vundle/,$HOME/vimfiles/
call vundle#rc()

" Let Vundle manage Vundle (required)!
Bundle 'gmarik/vundle'

" My bundles
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-cucumber'
Bundle 'kchmck/vim-coffee-script'
Bundle 'othree/html5.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'wincent/Command-T'
Bundle 'vim-ruby/vim-ruby'
"clojure
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim
" http://www.vim.org/scripts/download_script.php?src_id=13400

if has('gui_running')
	set guifont=Consolas:h12
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
set expandtab ts=4 sw=4 ai
set softtabstop=4
set autoindent
set showmatch
set incsearch
set hlsearch
set ignorecase
set laststatus=2
set cursorline
set cmdheight=1
set backspace=2
set nocompatible
set scrolloff=3
set showcmd
set autoread

autocmd FileType sass, ruby set ai sw=2 sts=2 ts=4 et
autocmd FileType java, javascript, html set sw=4 sts=4 ts=4 et

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing

" Show 81st char with a bg color
highlight ColorColumn ctermbg=198
call matchadd('ColorColumn', '\%81v', 100)

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
inoremap <C-space> <C-x><C-o>
nnoremap <C-s> :w<cr>
nnoremap <C-n> :NERDTreeToggle<cr>
inoremap ><Tab> ><Esc>F<lviwyf>a</<C-r>"><Esc>F<i
nnoremap <leader>c :!bundle exec cucumber<cr>
vnoremap <c-c> "*y
vnoremap <c-x> "*x
noremap <c-v> "*p
nnoremap <leader>r :w<cr>:!clear<cr>:!ruby %<cr>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
inoremap <c-V> <esc>"*pi

" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>
nnoremap <leader><leader> <c-^>

"vendor prefice highlighting
highlight VendorPrefix guifg=#00ffff gui=bold
match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/

set t_Co=256
set background=dark
color grb256

if has("win32")
	nnoremap <leader>f yaw:!findstr /spin /c:"<C-R>"" *.*<cr>
endif

set shm+=I

set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
