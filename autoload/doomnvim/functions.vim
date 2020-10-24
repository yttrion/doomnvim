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



function! doomnvim#functions#getroot() abort

    let full_root =  expand('<sfile>:p')
    let root = full_root[:-18]
    return root
    " Returns
    " /home/username/.doomnvim/autoload/doomnvim/
    " Trim for 18 char from the end

endfunction
