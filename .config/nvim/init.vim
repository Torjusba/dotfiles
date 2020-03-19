let mapleader=','

" Download vim-plug if not installed
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim.plug.."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" Sane split orders and navigation
set splitright splitbelow
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


" Don't leave trailing highlights after searching
set nohlsearch

" System clipboard
set clipboard=unnamed
set clipboard+=unnamedplus
set go=a
set mouse=a

" Basics
set nocompatible
filetype plugin indent on
syntax on
set encoding=utf-8
set number relativenumber

" Command autocompletion
set wildmode=longest,list,full

" Disable annoying autocommenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" Save file you forgot to open with root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Often used file extensions
autocmd BufRead,BufNewFile *.launch set filetype=xml  " roslaunch
