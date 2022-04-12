"====================================================================
" doomnvim autocmds
" Author: Pierre-Yves Douault
" License: MIT
"====================================================================

function! doomnvim#autocmds#init() abort
    augroup doomnvim_core
        " Load config
        call doomnvim#logging#message('+', 'doomnvim.autocmds.init called', 2)
        if g:doomnvim_relative_num
            autocmd BufEnter,WinEnter * if &nu | set rnu | endif
            autocmd BufLeave,WinLeave * if &nu | set nornu | endif
        endif
        autocmd BufNewFile,BufRead .doomrc set filetype=vim
        autocmd BufNewFile,BufEnter * set cpoptions+=d
        autocmd BufEnter * :syntax sync fromstart " ensure every file does full syntax highlight
    augroup END

    autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2

endfunction

function! doomnvim#autocmds#helptags() abort
    call doomnvim#system#grepdoc()
endfunction



let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

autocmd TermOpen * silent! call ToggleHiddenAll()<CR>
autocmd TermLeave * silent! call ToggleHiddenAll()<CR>



function! doomnvim#autocmds#plugload() abort
    if empty(glob(g:doomnvim_root . '/autoload/plug.vim'))
        silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

endfunction
