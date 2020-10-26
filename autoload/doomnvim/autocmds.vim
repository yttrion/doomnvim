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
        
        autocmd BufNewFile,BufEnter * set cpoptions+=d
        autocmd BufEnter * :syntax sync fromstart " ensure every file does full syntax highlight
    augroup END
endfunction

function! doomnvim#auocmds#helptags() abort
    try
        exe ':helptags $HOME/.doomnvim/doc'
    catch
        call doomnvim#logging#message('!', 'Failed to load doomnvim.txt file', 1)
    endtry

endfunction
