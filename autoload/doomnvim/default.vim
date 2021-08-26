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

    "vim-which-key
    let mapleader = ' '
    let g:which_key_hspace = 30
    let g:which_key_use_floating_win = 1

    "vim-gitgutter
    let g:gitgutter_map_keys = 0
    let g:indentLine_enabled = g:doomnvim_show_indent
    let g:indentLine_fileTypeExclude = ['dashboard']

    "indent-blankline
    let g:indent_blankline_char = "|"
    let g:indent_blankline_char_list = ['|', '|', '|', '|']

    "Dashboard
    let g:dashboard_default_executive ='telescope'
    let g:dashboard_session_directory = g:doomnvim_root . 'sessions'
    let g:dashboard_custom_shortcut={
      \ 'last_session'       : 'SPC q l',
      \ 'find_history'       : 'SPC f h',
      \ 'find_file'          : 'SPC f f',
      \ 'new_file'           : 'SPC f n',
      \ 'change_colorscheme' : 'SPC m c',
      \ 'find_word'          : 'SPC s w',
      \ 'book_marks'         : 'SPC f h',
      \ }
    let g:dashboard_custom_header = [
                \ "=================     ===============     ===============   ========  ========",
                \ "\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //",
                \ "||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||",
                \ "|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
                \ "||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
                \ "|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
                \ "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
                \ "|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||",
                \ "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
                \ "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
                \ "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
                \ "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
                \ "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
                \ "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
                \ "||   .=='    _-'          `-__\\._-'         `-_./__-'         `' |. /|  |   ||",
                \ "||.=='    _-'                                                     `' |  /==.||",
                \ "=='    _-'                 _   _ _   _ ________  ___                  \\/   `==",
                \ "\\   _-'                   | \\ | | | | |_   _|  \\/  |                   `-_   /",
                \ " `''                      |  \\| | | | | | | | .  . |                      ``' ",
                \ "                          | . ` | | | | | | | |\\/| |                          ",   
                \ "                          | |\\  \\ \\_/ /_| |_| |  | |                          ",  
                \ "                          \\_| \\_/\\___/ \\___/\\_|  |_/                          ",
                \ ]


    

    " Nvim-tree.lua
    let g:nvim_tree_width = g:doomnvim_sidebar_width
    let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache', '.github' ] "empty by default
    let g:nvim_tree_gitignore = g:doomnvim_show_hidden
    let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ]
    let g:nvim_tree_quit_on_open = 0
    let g:nvim_tree_follow = 1 
    let g:nvim_tree_auto_close = 1 
    let g:nvim_tree_indent_markers = g:doomnvim_explorer_indentlines
    let g:nvim_tree_hide_dotfiles = !g:doomnvim_show_hidden 
    let g:nvim_tree_git_hl = 1 
    let g:nvim_tree_root_folder_modifier = ':~' 
    let g:nvim_tree_tab_open = 1 
    let g:nvim_tree_width_allow_resize  = 0 
    let g:nvim_tree_disable_netrw = 0
    let g:nvim_tree_add_trailing = 1
    let g:nvim_tree_lsp_diagnostics = 1 
    let g:nvim_tree_disable_window_picker = 1 
    let g:nvim_tree_hijack_cursor = 0 
    let g:nvim_tree_icon_padding = ' ' 
    let g:nvim_tree_update_cwd = 1 
    let g:nvim_tree_window_picker_exclude = {
        \   'filetype': [
        \     'packer',
        \     'qf'
        \   ],
        \   'buftype': [
        \     'terminal'
        \   ]
        \ }
    let g:nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE', '.gitignore' ]
    let g:nvim_tree_show_icons = {
        \ 'git': g:doomnvim_show_icons,
        \ 'folders': g:doomnvim_show_icons,
        \ 'files': g:doomnvim_show_icons,
        \ 'folder_arrows': 1,
        \ }
    let g:nvim_tree_icons = {
        \ 'default': '',
        \ 'symlink': '',
        \ 'git': {
        \   'unstaged': "✗",
        \   'staged': "✓",
        \   'unmerged': "",
        \   'renamed': "➜",
        \   'untracked': "★",
        \   'deleted': "",
        \   'ignored': "◌"
        \   },
        \ 'folder': {
        \   'arrow_open': "",
        \   'arrw_closed': "",
        \   'default': "",
        \   'open': "",
        \   'empty': "",
        \   'empty_open': "",
        \   'symlink': "",
        \   'symlink_open': "",
        \   },
        \   'lsp': {
        \     'hint': "",
        \     'info': "",
        \     'warning': "",
        \     'error': "",
        \   }
        \ }
    highlight NvimTreeFolderIcon guibg=blueo


    "Internals
    let g:term_buf = 0
    let g:term_win = 0
    let g:vert_layout = 1
    let g:buf_left = 0
    let g:vista = 0

endfunction
