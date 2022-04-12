"================================================================
" Init and core config
" Author: Pierre-Yves Douault
" License: MIT
"================================================================

" Force utf-8
scriptencoding utf-8

" Version
let g:doomnvim_version = '0.1.82'
lockvar g:doomnvim_version

" Default indent size
" @default = 4
let g:doomnvim_indent = 4

" Show IndentLines
" @default = 1
let g:doomnvim_show_indent = 1

" Expand tabs
" @default = 0
let g:doomnvim_expand_tabs = 1

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

" Show icons in file explorer
" @default = 1
let g:doomnvim_show_icons = 1

" Show identlines for explorer
" @default = 0
let g:doomnvim_explorer_indentlines = 0

" Show hidden files
" @default = 1
let g:doomnvim_show_hidden = 1

" Default colorscheme
" @default = doom
let g:doomnvim_colorscheme = 'doomnvim'

" Background color
" @default = dark
let g:doomnvim_colorscheme_bg = 'dark'

" Checkupdates on start
" @default = 1
let g:doomnvim_check_updates = 0

" coc.nvim extensions
" @default = []
" Check 
" for a list of supported languages
let g:doomnvim_lsp = []

" Disabled plugins
" @default = []
" example:
" let g:doomnvim_disabled_plugins = ['nerdtree']
let g:doomnvim_disabled_plugins = []

" Custom plugins
" @default = []
" example
" let g:doomnvim_custom_plugins = ['author/name']
" Note that it will only work with github plugins
let g:doomnvim_custom_plugins = []

" Save session on quit
" @default = 1
" UNUSED
let g:doomnvim_sessionsave_onquit = 0

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

" Automatically open new files in a vertical split
" @default = 0
let g:doomnvim_open_in_vsplit = 0

"Conceal level
" 0: Disabled
" 1: Enabled
" @default = 1
let g:doomnvim_conceallevel = 1

" Show spell
" 0 : disable spell check on start
" 1 : enable spell check on start
" @default = 0
let g:doomnvim_spell = 0

" Logging level
" 0 : No logging
" 1 : All errors, no echo (default)
" 2 : All errors and messages, no echo
" 3 : All errors and messages, echo
" @default = 1
let g:doomnvim_logging = 1

" Spell lang
" Check http://vimdoc.sourceforge.net/htmldoc/spell.html for more details
" @default = en
let g:doomnvim_spelllang='en'

" Vim type
" 0 : vim
" 1 : neovim
if has('nvim')
    let g:doomnvim_neovim = 1
    if has('nvim-0.5')
        let g:doomnvim_nightly = 1
    else
        let g:doomnvim_nightly = 0
    endif
else
    let g:doomnvim_neovim = 0
endif    
lockvar g:doomnvim_neovim

" Custom lines
" DO NOT EDIT
let g:doomnvim_custom_line = 34

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

    call doomnvim#config#loadBFC()
    call doomnvim#autocmds#init()
    call doomnvim#default#options()
    call doomnvim#autocmds#helptags()
    call doomnvim#autocmds#plugload()
endfunction


function! doomnvim#end() abort
    call doomnvim#default#loadGlob()
    "Test source system-based
    call doomnvim#system#grepconfig('config', 'gui.vim', 1)
    call doomnvim#system#grepconfig('config', 'functions.vim', 1)

    "Plugins 
    call doomnvim#system#grepconfig('config/plugins/', 'coc.vim', 1)
    call doomnvim#system#grepconfig('config/plugins/', 'dict.vim', 1)
    call doomnvim#system#grepconfig('config/plugins/', 'keymap.vim', 1)

    call doomnvim#logging#init()
    if g:doomnvim_check_updates ==# 1
        call doomnvim#system#checkupdates()
    endif
    call doomnvim#functions#sourceDirectory(g:doomnvim_root.'config/lua')
endfunction

" vim: cc=100:
