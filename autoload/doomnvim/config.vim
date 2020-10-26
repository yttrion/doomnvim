"==================================================
" doomnvim config file load
" Author: Pierre-Yves Douault
" License: MIT
"==================================================

"au BufNewFile,BufRead .doomrc set filetype=doomconfig

function! doomnvim#config#checkBGC()
    if filereadable(g:doomnvim_root . '../.doomrc') ==# ''
        let g:doomnvim_bgc = 1
    else
        let g:doomnvim_bgc = 0
    endif
endfunction



function! doomnvim#config#loadBGC()

    call doomnvim#config#checkBGC()
    au BufNewFile,BufRead .doomrc set filetype=vim
    if filereadable(g:doomnvim_root . '../.doomrc')
        try
            call doomnvim#logging#message('+', 'Loading the BFC', 2)
            execute 'source ' . g:doomnvim_root . '../.doomrc'
        catch
            call doomnvim#logging#message('!', 'Error while loading the BFC', 1)
        endtry
    
    endif

endfunction
