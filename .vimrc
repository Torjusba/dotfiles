" ### GENERAL ### 

set number
set relativenumber 
syntax enable

" Sane split orders
set splitbelow
set splitright


" Makes :find search recursively
set path+=**

set backspace=indent,eol,start
set complete-=i

" Indentation 
set tabstop=4
set shiftwidth=4
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

" This doesn't work
" set formatoptions-=ro
" Setting to stop auto commenting is on last line to avoid being overwritten.
" TODO: Figure out what is overwriting and fix

" ### END GENERAL ###

try
	" ### COLORS ### 
	"colorscheme strawberry 
	colorscheme rupza 
	" ### END COLORS ### 
catch
endtry

try
	" ### VIM PLUG ###
	call plug#begin('~/.vim/plugged')

	" fzf 
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

	" Autocompletion
	"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

	" Nerd tree
	Plug 'scrooloose/nerdtree'
	call plug#end()


	" ### END VIM PLUG ###
catch
endtry

try
	" ### NERD TREE ###
	nnoremap <C-n> :NERDTreeToggle<CR>
catch
	" ### END NERD TREE ###
endtry

try
	" ### FZF ###

let $FZF_DEFAULT_COMMAND='fd --type f'

	let g:fzf_action = {
				\ 'ctrl-t': 'tab split',
				\ 'ctrl-x': 'split',
				\ 'ctrl-v': 'vsplit' }


	" Default fzf layout
	" - down / up / left / right
	let g:fzf_layout = { 'down': '~40%' }

	" You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
	let g:fzf_layout = { 'window': 'enew' }
	let g:fzf_layout = { 'window': '-tabnew' }
	let g:fzf_layout = { 'window': '10split enew' }

	" Customize fzf colors to match your color scheme
	let g:fzf_colors =
				\ { 'fg':      ['fg', 'Normal'],
				\ 'bg':      ['bg', 'Normal'],
				\ 'hl':      ['fg', 'Comment'],
				\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
				\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
				\ 'hl+':     ['fg', 'Statement'],
				\ 'info':    ['fg', 'PreProc'],
				\ 'border':  ['fg', 'Ignore'],
				\ 'prompt':  ['fg', 'Conditional'],
				\ 'pointer': ['fg', 'Exception'],
				\ 'marker':  ['fg', 'Keyword'],
				\ 'spinner': ['fg', 'Label'],
				\ 'header':  ['fg', 'Comment'] }


	nnoremap ,f :FZF<enter>
	" ### END FZF ###
catch
endtry

try
	" ### COC ### 
"
	""if hidden is not set, TextEdit might fail.
	"set hidden
"
	"" Better display for messages
	"set cmdheight=2
"
	"" Smaller updatetime for CursorHold & CursorHoldI
	"set updatetime=300
"
	"" don't give |ins-completion-menu| messages.
	"set shortmess+=c
"
	"" always show signcolumns
	"set signcolumn=yes
"
	"" Use tab for trigger completion with characters ahead and navigate.
	"" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
	"inoremap <silent><expr> <TAB>
				"\ pumvisible() ? "\<C-n>" :
				"\ <SID>check_back_space() ? "\<TAB>" :
				"\ coc#refresh()
	"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
	"function! s:check_back_space() abort
		"let col = col('.') - 1
		"return !col || getline('.')[col - 1]  =~# '\s'
	"endfunction
"
	"" Use <c-space> for trigger completion.
	"inoremap <silent><expr> <c-space> coc#refresh()
"
	"" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
	"" Coc only does snippet and additional edit on confirm.
	"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
	"" Use `[c` and `]c` for navigate diagnostics
	"nmap <silent> [c <Plug>(coc-diagnostic-prev)
	"nmap <silent> ]c <Plug>(coc-diagnostic-next)
"
	"" Remap keys for gotos
	"nmap <silent> gd <Plug>(coc-definition)
	"nmap <silent> gy <Plug>(coc-type-definition)
	"nmap <silent> gi <Plug>(coc-implementation)
	"nmap <silent> gr <Plug>(coc-references)
"
	"" Use K for show documentation in preview window
	"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
	"function! s:show_documentation()
		"if &filetype == 'vim'
			"execute 'h '.expand('<cword>')
		"else
			"call CocAction('doHover')
		"endif
	"endfunction
"
	"" Highlight symbol under cursor on CursorHold
	"autocmd CursorHold * silent call CocActionAsync('highlight')
"
	"" Remap for rename current word
	"nmap <leader>rn <Plug>(coc-rename)
"
	"" Remap for format selected region
	"vmap <leader>f  <Plug>(coc-format-selected)
	"nmap <leader>f  <Plug>(coc-format-selected)
"
	"augroup mygroup
		"autocmd!
		"" Setup formatexpr specified filetype(s).
		"autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
		"" Update signature help on jump placeholder
		"autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	"augroup end
"
	"" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
	"vmap <leader>a  <Plug>(coc-codeaction-selected)
	"nmap <leader>a  <Plug>(coc-codeaction-selected)
"
	"" Remap for do codeAction of current line
	"nmap <leader>ac  <Plug>(coc-codeaction)
	"" Fix autofix problem of current line
	"nmap <leader>qf  <Plug>(coc-fix-current)
"
	"" Use `:Format` for format current buffer
	"command! -nargs=0 Format :call CocAction('format')
"
	"" Use `:Fold` for fold current buffer
	"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"
	"" Add diagnostic info for https://github.com/itchyny/lightline.vim
	"let g:lightline = {
				"\ 'colorscheme': 'wombat',
				"\ 'active': {
				"\   'left': [ [ 'mode', 'paste' ],
				"\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
				"\ },
				"\ 'component_function': {
				"\   'cocstatus': 'coc#status'
				"\ },
				"\ }
"
"
"
	"" Using CocList
	"" Show all diagnostics
	"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
	"" Manage extensions
	"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
	"" Show commands
	"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
	"" Find symbol of current document
	"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
	"" Search workspace symbols
	"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
	"" Do default action for next item.
	"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
	"" Do default action for previous item.
	"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
	"" Resume latest coc list
	"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
	"" ### END COC ### 
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
