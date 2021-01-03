"=======================================================
" Retrieve name, separator of current os and filepath
" Author: Pierre-Yves Douault
" License: MIT
"=======================================================


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

    call doomnvim#logging#message('+', 'Current OS: '.g:doomnvim_os, 2)

endfunction


function! doomnvim#system#grepconfig(folder, filename, source) abort
    " Source file or returns the full path
    let fullpath = g:doomnvim_root . a:folder . g:doomnvim_separator . a:filename
    if filereadable(fullpath)
        if a:source ==# 1
            try
                execute 'source ' fullpath
                call doomnvim#logging#message('+', 'Sourced file : '.a:filename, 2)
            catch
                call doomnvim#logging#message('!', 'Failed sourcing '.a:filename, 1)
            endtry
        else
            call doomnvim#logging#message('+', 'Returned '.a:filename.' path', 2)
            return fullpath
        endif
    endif
endfunction

function doomnvim#system#grepfolder(folder) abort
    let fullpath = g:doomnvim_root . a:folder
    try
        call doomnvim#logging#message('+', 'Returned '.a:folder.' path', 2)
        return fullpath
    catch
        call doomnvim#logging#message('!', 'Unable to return folder path', 1)
    endtry
endfunction

function! doomnvim#system#grepdoc() abort
    let fullpath = g:doomnvim_root . 'doc'
    try
        exe ':helptags ' . fullpath
    catch
        call doomnvim#logging#message('!', 'Unable to create helptags', 1)
    endtry
endfunction


function! doomnvim#system#checkupdates()
    try
        call doomnvim#logging#message('+', 'Purging outdated plugins', 2)
        execute ':PlugClean!'
        execute ':PlugUpdate'
        call doomnvim#logging#message('+', 'Done', 2)
    catch
        call doomnvim#logging#message('!', 'Unable to update plugins', 1)
    endtry
endfunction
