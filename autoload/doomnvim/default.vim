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
    set splitright
    set splitbelow
    set noswapfile
    set showmode
    set hlsearch
    "set number rnu

    set mouse=a
    set laststatus=2
    set encoding=utf-8
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
        set relativenumber
    else
        set number
    endif
    filetype plugin indent on
    syntax on

    nnoremap Q <Nop>

endfunction



function doomnvim#default#loadGlob() 

    "NERDTREE
    let g:NERDTreeShowHidden = g:doomnvim_show_hidden
    let g:NERDTreeWinSize = g:doomnvim_sidebar_width
    if g:doomnvim_open_in_vsplit ==# 1
        let g:NERDTreeCustomOpenArgs = { 'file': { 'where': 'v' } }
    endif

    "NERDCommenter
    let g:NERDCreateDefaultMappings = 0

    "coc.nvim

    "Lightline
    let g:lightline = {
                \ 'enable' : {
                    \ 'tabline' : 0
                \ },
                \ 'separator': { 'left': '', 'right': '' },
                \ 'subseparator': { 'left': '', 'right': '' },
                \ 'colorscheme': 'deus',
                \ }

    "vim-which-key
    let mapleader = ' '


    "Tagbar
    let g:tagbar_width = g:doomnvim_sidebar_width
    let g:tagbar_left = g:doomnvim_tagbar_left

    "vim-workspace
    "let g:workspace_autocreate = g:doomnvim_autocreate_session
    "let g:workspace_persist_undo_history = 0
    "let g:workspace_session_directory = g:doomnvim_root . 'sessions/'
    "let g:workspace_autosave_always = 1
    "let g:workspace_autosave_ignore = ['gitcommit']

    "vim-floaterm
    
    "vim-gitgutter
    let g:gitgutter_map_keys = 0

    "vim-startify
    "let g:startify_session_autoload = g:doomnvim_enable_startmenu


    "Dashboard
    let g:dashboard_custom_header = [
                \ "=================     ===============     ===============   ========  ========",
                \ "\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //",
                \ "||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||",
                \ "|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
                \ "||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
                \ "|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||",
                \ "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||",
                \ "|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||",
                \ "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||",
                \ "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||",
                \ "||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||",
                \ "||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||",
                \ "||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||",
                \ "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||",
                \ "||   .=='    _-'          `-__\._-'         `-_./__-'         `' |. /|  |   ||",
                \ "||.=='    _-'                                                     `' |  /==.||",
                \ "=='    _-'                 _   _ _   _ ________  ___                  \/   `==",
                \ "\   _-'                   | \ | | | | |_   _|  \/  |                   `-_   /",
                \ " `''                      |  \\| | | | | | | | .  . |                      ``' ",
                \ "                          | . ` | | | | | | | |\/| |                          ",   
                \ "                          | |\  \ \_/ /_| |_| |  | |                          ",  
                \ "                          \_| \_/\___/ \___/\_|  |_/                          ",
                \ ]


    "Internals
    let g:term_buf = 0
    let g:term_win = 0
    let g:vert_layout = 1
    let g:buf_left = 0


endfunction
