"====================================================================
" doomnvim default
" Author: Pierre-Yves Douault
" License: MIT
"====================================================================
scriptencoding utf-8

function! doomnvim#default#options() abort
    call doomnvim#logging#message('+', 'doomnvim.default.options called', 2)
    " Set options
    set wildmenu
    set smartindent
    set smarttab
    set autoindent
    set autoread
    set splitbelow
    set splitright
    set noswapfile
    set showmode
    set hlsearch
    set mouse=a
    set laststatus=2
    set encoding=utf-8
    set backspace=indent,eol,start
    set timeoutlen=200
    set clipboard+=unnamedplus
    set shortmess+=atc

    let &expandtab = g:doomnvim_expand_tabs
    let &tabstop = g:doomnvim_indent
    let &softtabstop = g:doomnvim_indent
    let &shiftwidth = g:doomnvim_indent
    let &colorcolumn = g:doomnvim_max_columns
    let &conceallevel = g:doomnvim_conceallevel
    let &spelllang = g:doomnvim_spelllang
    if g:doomnvim_relative_num ==# 1
        set number relativenumber
    else
        set number
    endif
    if g:doomnvim_spell ==# 1
        set spell
    endif
    filetype plugin indent on
    syntax on
    
    if g:doomnvim_autocomplete_par ==# 1
        inoremap " ""<left>
        inoremap ' ''<left>
        inoremap ( ()<left>
        inoremap [ []<left>
        inoremap { {}<left>
        inoremap ` ``<left>
        inoremap < <><left>
        inoremap {<CR> {<CR>}<ESC>O
    endif


    nnoremap Q <Nop>
    nnoremap ZZ :call doomnvim#functions#quitdoom(1,1)<CR>
endfunction



function doomnvim#default#loadGlob() 

    "NERDCommenter
    let g:NERDCreateDefaultMappings = 0

    "coc.vim
    set updatetime=500
    set nobackup
    set nowritebackup
    set cmdheight=1
    if has('patch-7.4.314')
        set shortmess+=s
    endif
    if has('patch-8.1.1564')
    	set signcolumn=number
    else
    	set signcolumn=auto
    endif

    "vim-gitgutter
    let g:gitgutter_map_keys = 0
    let g:indentLine_enabled = g:doomnvim_show_indent
    let g:indentLine_fileTypeExclude = ['dashboard']

    "indent-blankline
    let g:indent_blankline_char = "|"
    let g:indent_blankline_char_list = ['|', '|', '|', '|']
    

    " Nvim-tree.lua
    let g:nvim_tree_width = g:doomnvim_sidebar_width
    let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ]
    let g:nvim_tree_width_allow_resize  = 0 
    highlight NvimTreeFolderIcon guibg=blueo


    "Internals
    let g:term_buf = 0
    let g:term_win = 0
    let g:vert_layout = 1
    let g:buf_left = 0
    let g:vista = 0

endfunction
