"====================================================================
" doomnvim default
" Author: Pierre-Yves Douault
" License: MIT
"====================================================================

function! doomnvim#default#options() abort
    call doomnvim#logging#message('+', 'doomnvim.default.options called', 2)
    " Set options

    set wildmenu
    set smartindent
    set smarttab
    set autoindent
    set autoread
    set splitright
    set splitbelow
    set noswapfile
    set showmode
    set hlsearch
    "set number rnu

    set mouse=a
    set laststatus=2
    set encoding=UTF-8
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

    set smarttab
    let &expandtab = g:doomnvim_expand_tabs
    let &tabstop = g:doomnvim_indent
    let &softtabstop = g:doomnvim_indent
    let &shiftwidth = g:doomnvim_indent
    let &colorcolumn = g:doomnvim_max_columns
    if g:doomnvim_relative_num ==# 1
        set rnu
    else
        set nu
    endif
    filetype plugin indent on
    syntax on


endfunction
