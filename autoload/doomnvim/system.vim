"====================================================
" Retrieve name, separator of current os
" Author: Pierre-Yves Douault
" License: MIT
"====================================================


scriptencoding utf-8

function! doomnvim#system#whichos()

    call doomnvim#logging#message('+', 'Checking OS', 2)

    let s:system = ""
    let g:doomvim_separator = ""
    
    if has('win32') || has('win64')
        let s:system = 'windows'
        let g:doomvim_separator = "\\"
    elseif has('unix') && !has('macunix') && !has('win32unix')
        let s:system = 'linux'
        let g:doomvim_separator = "/"
    elseif has('macunix')
        let s:system = 'mac'
        let g:doomvim_separator = "/"
    elseif has('win32unix')
        let s:system = 'cygwin'
        let g:doomvim_separator = "\\"
    else
        echo "OS not recognized"
    endif

endfunction
