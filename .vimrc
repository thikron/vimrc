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
Bundle 'vim-pandoc/vim-pandoc-syntax'
Bundle 'joonty/vdebug'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
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
Bundle 'airblade/vim-gitgutter'
"clojure
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'
Bundle 'schmich/vim-guifont'

" ---- Color scheme ----
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim
" http://www.vim.org/scripts/download_script.php?src_id=13400

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬\,trail:·

if has('win32')
    set guifont=Consolas:h12
elseif has('gui_macvim')
    set guifont=Monaco:h14
else
    set guifont=Monospace\ 12
endif

"no arrow keys"
noremap <up> <nop>
inoremap <up> <nop>

noremap <down> <nop>
inoremap <down> <nop>

noremap <left> <nop>
noremap <right> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" ---- Backup and Swap ----
set nobackup
set nowritebackup
set noswapfile

set enc=utf-8   "Show utf-8 chars
set fenc=utf-8
set fileencodings=ucs-bom,utf8,latin1
set ff=unix

"show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

set expandtab     "  Expand tabs to spaces
set tabstop=4     "  4 spaces
set shiftwidth=4  "  4 spaces
set softtabstop=4 "  4 spaces
set autoindent    "  auto indentation
set showmatch     "  show matching bracket
set incsearch     "  incremental search
set hlsearch      "  highlight my search
set wrapscan      "  set the search scan to wrap around the file
set ignorecase    "  when searching
set smartcase     "  ...unless I use an uppercase character
set cursorline    "  highlight current line
set cmdheight=1   "  prevent the command line to rise in height
set backspace=2   "  Backspace over indent, eol, and insert
set scrolloff=3   "  Start scrolling when I'm 3 lines from top/bottom
set laststatus=2  "  always show the status line (0 = never, 1 = default [multi-window only])
set showcmd       "  count highlighted
set ruler         "  show where I am in the command area
set showmode      "  -- show when in INSERT mode --
set mouse=a       "  use the mouse
set mousehide     "  Hide the mouse pointer while typing
set history=1000  "  Remember commands and search history
set number        "  show line numbers
set tw=80        "  width of document (used by gd)
set nowrap        "  turn off line wraps
set list          "  Show invisible chars

" ---- Syntax ----
syntax on " set syntax highlighting
syntax sync minlines=256  " Makes big files slow
set synmaxcol=2048        " Also long lines are slow
set autoindent            " try your darndest to keep my indentation
set smartindent           " Be smarter about indenting dummy

if has("gui_running")
    set transparency=15
endif

set autoread

autocmd FileType sass, ruby set ai sw=2 sts=2 ts=4 et
autocmd FileType java, javascript, html set sw=4 sts=4 ts=4 et

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


"cool command tabbing option
set wildmenu
set wildmode=full

" ---- Key mappings ----
" Edit vimrc file
if has('nvim')
    nnoremap <leader>v :tabedit ~/.vimrc<cr>
else
    nnoremap <leader>v :tabedit $MYVIMRC<cr>
endif

"Moves around split windows
nnoremap <leader>w <C-w><C-w>

" Normal/Visual tab for bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" tabs
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew %<CR>

" Shortcut to rapidly toggle `set list`
nnoremap <silent><leader>l :set list!<cr>

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

" Better use of folding
nnoremap <leader>z za

"vendor prefice highlighting
highlight VendorPrefix guifg=#00ffff gui=bold
match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/

set t_Co=256
set background=dark
color grb256

set title " change the terminal title

if has("win32")
	nnoremap <leader>f yaw:!findstr /spin /c:"<C-R>"" *.*<cr>
endif

set shm+=I

set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

let guigontpp_size_increment=2
let guifontpp_smaller_font_map="<F10>"
let guifontpp_larger_font_map="<S-F10>"
let guifontpp_original_font_map="<C-F10>"

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

if v:version >= 703
  "set colorcolumn=75
  "hi ColorColumn ctermbg=234
  set undodir=~/.vim-undo
  set undofile
  set undolevels=1000 "max number of changes that can be undone
  set undoreload=10000 "max number lines to save for undo on buffer reload

  " Toggle line numbers in normal mode, set by default
  set number relativenumber
  function! NumberToggle()
    if(&relativenumber == 1)
      set number norelativenumber
    else
      set number relativenumber
    endif
  endfunc

  nnoremap <leader>n :call NumberToggle()<cr>
endif

" NERDTree Settings---------------------------------------------------- {{{
map <leader>t :NERDTreeToggle<cr>
"nnoremap <leader>t :NERDTreeTabsToggle<cr>
" Close vim if NERDTree is the last thing standing
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }}}
