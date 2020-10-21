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

set shortmess+=at

"coc.nvim settings
set updatetime=500
set nobackup
set nowritebackup
set cmdheight=1
set shortmess+=c
if has('patch')
	set signcolumn=number
else
	set signcolumn=auto
endif
