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


" Doesn't work, as my VIM is not built with clipboard access
set clipboard=unnamedplus


" Makes tags for tag jumping
" TODO: Auto run this? Maybe not
command! MakeTags !ctags -R .

" Auto load views
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" netrw
let g:netrw_banner = 0
"let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20

" Toggle netrw tree
function! ToggleVExplorer()
	if exists("t:expl_buf_num")
		let expl_win_num = bufwinnr(t:expl_buf_num)
		let cur_win_num = winnr()

		if expl_win_num != -1
			while expl_win_num != cur_win_num
				exec "wincmd w"
				let cur_win_num = winnr()
			endwhile

			close
		endif

		unlet t:expl_buf_num
	else
		Vexplore
		let t:expl_buf_num = bufnr("%")
	endif
endfunction

map <silent> <C-O> :call ToggleVExplorer()<CR>




" ### END GENERAL ###

try
	" ### COLORS ### 
	"colorscheme strawberry 
	"colorscheme rupza 
	" ### END COLORS ### 
catch
endtry

try
	" ### VIM PLUG ###
	call plug#begin('~/.vim/plugged')

	" Tmux aware navigation
	Plug 'christoomey/vim-tmux-navigator'

	" Autocompletion
	Plug 'ycm-core/YouCompleteMe'


	call plug#end()


	" ### END VIM PLUG ###
catch
endtry

" ### VIM-SENSIBLE ### 
if has('autocmd')
	filetype plugin indent on
endif
" TODO: Duplicate?
if has('syntax') && !exists('g:syntax_on')
	syntax enable
endif

" Use :help 'option' to see the documentation for the given option.


if !has('nvim') && &ttimeoutlen == -1
	set ttimeout
	set ttimeoutlen=100
endif

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
	nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

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

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
	runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>

" Stop annoying auto commenting
autocmd FileType * setlocal formatoptions-=r formatoptions-=o
" ### END VIM-SENSIBLE ### 
