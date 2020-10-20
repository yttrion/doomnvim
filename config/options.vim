"=======================================
" Options for doom-nvim
" Author: Pierre-Yves Douault
" License: MIT
"=======================================


syntax on
filetype plugin indent on

set wildmenu
set smartindent
set smarttab
set autoindent
set autoread
set splitright
set splitbelow
set noswapfile
set noexpandtab
set showmode
set hlsearch
set nu rnu

set mouse=a
set laststatus=2
set encoding=UTF-8
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set timeoutlen=200
set clipboard+=unnamedplus

if has('python3')
	set pyx=3
elseif has('python')
	set pyx=2
endif

"coc.nvim settings
set updatetime=500
set nobackup
set nowritebackup
set cmdheight=2
set shortmess+=c
if has('patch')
	set signcolumn=number
else
	set signcolumn=auto
fi
autocmd CursorHold * silent call CocActionAsync('highlight')
inoremap <silent><expr> <Tab>
	\ pumvisible() ? "\<C-n" :
	\ <SID>check_backspace() ? "\<Tab>" :
	\ coc#refresh()
