"==============================================
" Functions for doomnvim package
" Author: Pierre-Yves Douault
" License: MIT
"==============================================



function! doomnvim#functions#checkbin(bin)  abort
    if executable(a:bin)
        call doomnvim#logging#message("+", a:bin . " found")
        return 1
    else
        call doomnvim#logging#message("+", a:bin . " not found")
        return 0
    endif
endfunction


function! doomnvim#functions#checkplugin(plugin) abort
    if isdirectory(g:doomnvim_root.'plugged/'.a:plugin)
        echo "Plugin found"
    else
        echo "Plugin not found"
    endif
endfunction
