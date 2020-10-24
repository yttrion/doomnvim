"==============================================
" Functions for doomnvim package
" Author: Pierre-Yves Douault
" License: MIT
"==============================================



function! doomnvim#functions#checkbin(bin)  abort
    if executable(a:bin)
        call doomnvim#logging#message("+", a:bin . " found", 2)
        return 1
    else
        call doomnvim#logging#message("+", a:bin . " not found", 1)
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

    call doomnvim#logging#message('+', 'doomnvim#functions#getroot called', 2)
    let full_root =  expand('<sfile>:p')
    let root = full_root[:-22]
    return root
    " Returns
    " /home/username/.doomnvim/autoload/functions.vim
    " Trim for 18 char from the end

endfunction
