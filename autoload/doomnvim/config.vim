"==================================================
" doomnvim config file load
" Author: Pierre-Yves Douault
" License: MIT
"==================================================

"au BufNewFile,BufRead .doomrc set filetype=doomconfig

function! doomnvim#config#checkBFC()
    " /home/username/.doomnvim/
    if filereadable(g:doomnvim_root . '../.doomrc')
        let g:doomnvim_bfc = 1
    else
        let g:doomnvim_bfc = 0
    endif
endfunction



function! doomnvim#config#loadBFC()

    if filereadable(g:doomnvim_root . '../.doomrc')
        try
            call doomnvim#logging#message('+', 'Loading the BFC', 2)
            execute 'source ' . g:doomnvim_root . '../.doomrc'
        catch
            call doomnvim#logging#message('!', 'Error while loading the BFC', 1)
        endtry
    else
        call doomnvim#logging#message('+', 'No BFC file', 2)
    endif

endfunction
