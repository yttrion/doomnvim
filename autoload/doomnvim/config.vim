"==================================================
" doomnvim config file load
" Author: Pierre-Yves Douault
" License: MIT
"==================================================

function! doomnvim#config#loadBFC()
    if filereadable(g:doomnvim_root . '../.doomrc')
        try
            execute 'source ' . g:doomnvim_root . '../.doomrc'
            call doomnvim#logging#message('+', 'Loading the BFC', 2)
        catch
            call doomnvim#logging#message('!', 'Error while loading the BFC', 1)
        endtry
    else
        call doomnvim#logging#message('+', 'No BFC file', 2)
        execute ':silent !touch $HOME/.doomrc'  
    endif
endfunction

" On file load
if has('vim_starting')
	exe 'set encoding=utf-8'
endif
