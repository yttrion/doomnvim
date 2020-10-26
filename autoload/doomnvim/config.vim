"==================================================
" doomnvim config file load
" Author: Pierre-Yves Douault
" License: MIT
"==================================================

"au BufNewFile,BufRead .doomrc set filetype=doomconfig

function! doomnvim#config#checkBGC()
    if glob('~/.doom') ==# ''
        let g:doomnvim_bgc = 1
    else
        let g:doomnvim_bgc = 0
    endif
endfunction



function! doomnvim#config#loadBGC()

    au BufNewFile,BufRead .doom set filetype=vim


endfunction
