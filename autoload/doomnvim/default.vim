"====================================================================
" doomnvim default
" Author: Pierre-Yves Douault
" License: MIT
"====================================================================

scriptencoding utf-8

function! doomnvim#default#options() abort

    " Set options
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
    set tabstop=g:doomnvim_indent
    set shiftwidth=g:doomnvim_indent
    set backspace=indent,eol,start
    set timeoutlen=200
    set clipboard+=unnamedplus

    set shortmess+=at

    "coc.nvim settings
    set updatetime=500
    set nobackup
    set nowritebackup
    set cmdheight=1
    if has('patch-7.4.314')
        set shortmess+=s
    endif
    set shortmess+=c
    if has('patch-8.1.1564')
    	set signcolumn=number
    else
    	set signcolumn=auto
    endif   
endfunction
