"====================================================
" Retrieve name, separator of current os
" Author: Pierre-Yves Douault
" License: MIT
"====================================================


scriptencoding utf-8

function! doomnvim#system#whichos()

    call doomnvim#logging#message('+', 'Checking OS', 2)

    let g:doomnvim_os = ''
    let g:doomnvim_separator = ''
    
    if has('win32') || has('win64')
        let g:doomnvim_os = 'windows'
        let g:doomnvim_separator = '\\'
    elseif has('unix') && !has('macunix') && !has('win32unix')
        let g:doomnvim_os = 'linux'
        let g:doomnvim_separator = '/'
    elseif has('macunix')
        let g:doomnvim_os = 'mac'
        let g:doomnvim_separator = '/'
    elseif has('win32unix')
        let g:doomnvim_os = 'cygwin'
        let g:doomnvim_separator = '\\'
    else
        echo 'OS not recognized'
    endif

endfunction


function! doomnvim#system#grepconfig(folder, config, source) abort

    let fullpath = g:doomnvim_root . a:folder . g:doomnvim_separator . a:file

    if filereadable(fullpath)
        if a:source ==# 1
            execute 'source ' fullpath
            call doomnvim#logging#message('+', 'Sourced file :'.a:file, 2)
        else
            return fullpath
        endif
    endif

endfunction
