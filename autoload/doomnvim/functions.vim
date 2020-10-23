"==============================================
" Functions for doomnvim package
" Author: Pierre-Yves Douault
" License: MIT
"==============================================



function! doomnvim#functions#checkbin(bin)  abort
    if executable(a:bin)
        doomnvim#logging#message("+", a:bin . " found")
        return 1
    else
        doomnvim#logging#message("+", a:bin . " not found")
        return 0
    endif
endfunction
