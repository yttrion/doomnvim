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
