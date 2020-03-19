" ### GENERAL ### 

set number
set relativenumber 
syntax enable

" Sane split orders
set splitbelow
set splitright


" Makes :find search recursively
set autochdir
set path+=**
set path+=./..

set backspace=indent,eol,start
set complete-=i

" Indentation 
set tabstop=8
set shiftwidth=2
set noexpandtab
set smartindent
set autoindent
set smarttab

" Don't consider numbers beginning with 0 as octal
set nrformats-=octal 


" Needs vim to be built with clipboard access
set clipboard=unnamedplus


" Auto load views
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Pane navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l



" ### VIM-SENSIBLE ### 
if has('autocmd')
	filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
	syntax enable
endif

" Use :help 'option' to see the documentation for the given option.
if !has('nvim') && &ttimeoutlen == -1
	set ttimeout
	set ttimeoutlen=100
endif

set incsearch

set laststatus=2
set ruler
set wildmenu

if !&scrolloff
	set scrolloff=1
endif
if !&sidescrolloff
	set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
	set encoding=utf-8
endif

if &listchars ==# 'eol:$'
	set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
	set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
	setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
	set shell=/usr/bin/env\ bash
endif

set autoread

if &history < 1000
	set history=1000
endif
if &tabpagemax < 50
	set tabpagemax=50
endif
if !empty(&viminfo)
	set viminfo^=!
endif
set sessionoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
	set t_Co=16
endif

" ### END VIM-SENSIBLE ### 

" Stop annoying auto commenting
autocmd FileType * setlocal formatoptions-=r formatoptions-=o
