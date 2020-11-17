"================================================================
" Init and core config
" Author: Pierre-Yves Douault
" License: MIT
"================================================================

" Force utf-8
scriptencoding utf-8

" Version
let g:doomnvim_version = '0.1.5'
lockvar g:doomnvim_version

" Default indent size
" @default = 4
let g:doomnvim_indent = 4

" Expand tabs
" @default = 0
let g:doomnvim_expand_tabs = 0

" Numbering
" @default = relative number
let g:doomnvim_relative_num = 1

" Max columns
" @default = 100
let g:doomnvim_max_columns = 100

" Enable guicolors
" @default = 0
let g:doomnvim_enable_guicolors = 1

" Sidebar size
" @default = 25
let g:doomnvim_sidebar_width = 25

" Tagbar left 
" @default 0
let g:doomnvim_tagbar_left = 0

" Show hidden files
" @default = 1
let g:doomnvim_show_hidden = 1

" Default colorscheme
" @default = doom
let g:doomnvim_colorscheme = 'doom'

" Background color
" @default = dark
let g:doomnvim_colorscheme_bg = 'dark'

" Checkupdates on start
" @default = 1
let g:doomnvim_check_updates = 1

" Disabled plugins
" @default = []
let g:doomnvim_disabled_plugins = []

" Custom plugins
" @deafult = []
let g:doomnvim_custom_plugins = []

" Lint on save
" @default = 1
let g:doomnvim_lint_onsave = 1

" Autocomplete paranthesis
" @default = 1
let g:doomnvim_autocomplete_par = 1

" Doomnvim resize percentage
" Values : 0 - 1
" @default = 0.2
let g:doomnvim_resize_percent = 0.2

" Enable startify
" @default = 1
let g:doomnvim_enable_startmenu = 1

" Autocreate session
" @default = 0
let g:doomnvim_autocreate_session = 0

" Logging level
" 0 : No logging
" 1 : All errors, no echo (default)
" 2 : All errors and messages, no echo
" 3 : All errors and messages, echo
" @default = 1
let g:doomnvim_logging = 1


function! doomnvim#loadConfig(file) abort
    if filereadable(g:doomnvim_root . 'config/' . a:file)
        execute 'source ' . g:doomnvim_root . 'config/' . a:file
        call doomnvim#logging#message('+', 'Sourced file '.a:file, 2)
    endif
endfunction


" doomnvim path
" @default = $HOME/.doomnvim
let g:doomnvim_root = expand('<sfile>:p')[:-22]
lockvar g:doomnvim_root

" Functions
function! doomnvim#begin() abort

    call doomnvim#config#checkBFC()
    if g:doomnvim_bfc ==# 1
        call doomnvim#config#loadBFC()
    endif
    call doomnvim#autocmds#init()
    call doomnvim#system#whichos()
    call doomnvim#default#options()
    call doomnvim#autocmds#helptags()
    call doomnvim#commands#init()

endfunction


function! doomnvim#end() abort

    call doomnvim#default#loadGlob()
    "Test source system-based
    call doomnvim#system#grepconfig('config', 'gui.vim', 1)
    call doomnvim#system#grepconfig('config', 'functions.vim', 1)
    call doomnvim#system#grepconfig('config', 'globals.vim', 1)

    "Plugins 
    call doomnvim#system#grepconfig('config/plugins/', 'coc.vim', 1)
    call doomnvim#system#grepconfig('config/plugins/', 'dict.vim', 1)
    call doomnvim#system#grepconfig('config/plugins/', 'keymap.vim', 1)
    call doomnvim#system#grepconfig('config/plugins/', 'startify.vim', 1)

    call doomnvim#logging#init()

endfunction

" vim: cc=100:
