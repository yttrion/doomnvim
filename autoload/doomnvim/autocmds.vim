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
    
    autocmd BufNewFile,BufEnter * set cpoptions+=d
    autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)

endfunction
