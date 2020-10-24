"====================================================
" Retrieve name, separator of current os
" Author: Pierre-Yves Douault
" License: MIT
"====================================================


scriptencoding utf-8

let s:system = ""

if has('win32') || has('win64')
    let s:system = 'windows'
elseif has('unix') && !has('macunix') && !has('win32unix')
    let s:system = 'linux'
elseif has('macunix')
    let s:system = 'mac'
elseif has('win32unix')
    let s:system = 'cygwin'
else
    echo "OS not recognized"
endif
