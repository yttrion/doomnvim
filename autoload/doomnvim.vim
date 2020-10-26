"================================================================
" DoomNvim.vim -- Init and core config
" Author: Pierre-Yves Douault
" License: MIT
"================================================================

" Force utf-8
scriptencoding utf-8

" Version
let g:doomnvim_version = '0.1.4-1'
lockvar g:doomnvim_version

" Default indent size
" @default = 2
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
" @default = 30
let g:doomnvim_sidebar_width = 20

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
" Values : 1 - 100
" @default = 20
let g:doomnvim_resize_percent = 20

" Logging level
" 0 : No logging
" 1 : All errors, no echo (default)
" 2 : All errors and messages, no echo
" 3 : All errors and messages, echo
" @default = 1
let g:doomnvim_logging = 1


" doomnvim path
" @default = $HOME/.doomnvim
let g:doomnvim_root = expand('<sfile>:p')[:-22]

function! doomnvim#loadConfig(file) abort
    if filereadable(g:doomnvim_root . 'config/' . a:file)
    "if filereadable(glob('~/.doomnvim/config/') . a:file)
    "    execute 'source ' . glob('$HOME/.doomnvim/config/') . a:file
        execute 'source ' . g:doomnvim_root . 'config/' . a:file
        call doomnvim#logging#message('+', 'Sourced file '.a:file, 2)
    endif
endfunction



" Functions
function! doomnvim#begin() abort

    call doomnvim#system#whichos()
    call doomnvim#default#options()
    call doomnvim#autocmds#init()
    call doomnvim#logging#init()
    call doomnvim#commands#init()

endfunction


function! doomnvim#end() abort

    " Load help tags
    try
        exe ':helptags $HOME/.doomnvim/doc/'
    catch
        call doomnvim#logging#message('!', 'Failed to load doomvim.txt file', 1)
    endtry

    " Finally works
    call doomnvim#loadConfig('gui.vim')
    call doomnvim#loadConfig('functions.vim')
    call doomnvim#loadConfig('globals.vim')
    
endfunction

" vim: cc=100:

