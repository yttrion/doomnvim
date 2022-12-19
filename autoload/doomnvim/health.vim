"====================================================================
" doomnvim health 
" Author: Pierre-Yves Douault
" License: MIT
"====================================================================

function! doomnvim#health() abort
    call doomnvim#logging#message('+', 'Checking health', 2)
    execute("checkhealth")
endfunction
   
function! doomnvim#findBinary(name) abort
    if executable(a:name)
        return 1
    endif
    return 0
endfunction

" vim:cc=80:
