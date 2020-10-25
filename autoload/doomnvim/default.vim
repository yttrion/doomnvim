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
    set number rnu

    set mouse=a
    set laststatus=2
    set encoding=UTF-8
    set backspace=indent,eol,start
    set timeoutlen=200
    set clipboard+=unnamedplus

    set shortmess+=at

    set tabs

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
