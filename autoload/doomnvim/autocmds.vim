"====================================================================
" doomnvim autocmds
" Author: Pierre-Yves Douault
" License: MIT
"====================================================================


function! doomnvim#autocmds#init() abort

    " Load config
    if g:doomnvim_relative_num
        autocmd BufEnter,WinEnter * if &nu | set rnu | endif
        autocmd BufLeave,WinLeave * if &nu | set nornu | endif
    endif
    if
endfunction
