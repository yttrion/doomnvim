"================================================================
" DoomNvim.vim -- Init and core config
" Author: Pierre-Yves Douault
" License: MIT
"================================================================

" Force utf-8
scriptencoding utf-8

" Version
let g:doomnvim_version = '0.1.2'
"lockvar g:doomnvim_version

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
let g:doomnvim_sidebar_width = 30

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




function! doomnvim#loadConfig(file) abort
    if filereadable('$HOME/.doomnvim/config/' . a:file)
        execute 'source $HOME/.doomnvim/config' . a:file
    endif
endfunction



" Functions
function! doomnvim#begin() abort

    "call doomnvim#loadConfig('globals.vim')
    "call doomnvim#loadConfig('functions.vim')
    "call doomnvim#loadConfig('gui.vim')
    call doomnvim#default#options()    
    call doomnvim#autocmds#init()

endfunction


function! doomnvim#end() abort
    
    " Load help tags
    try
        exe ':helptags $HOME/.doomnvim/doc/'
    catch
        echo "Failed to load doomvim.txt file"
    endtry

    set smarttab
    let &expandtab = g:doomnvim_expand_tabs
    let &tabstop = g:doomnvim_indent
    let &softtabstop = g:doomnvim_indent
    let &shiftwidth = g:doomnvim_indent


    filetype plugin indent on
    syntax on


endfunction

" vim: cc=100:

