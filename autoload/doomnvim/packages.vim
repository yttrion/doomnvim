"=========================================
" Custom package manager for doomnvim
" Author: Pierre-Yves Douault
" License: MIT
"=========================================

function! doomnvim#packages#checkinstall(name)
    " sed 's/:.*//'
    let author = execute("sed 's//.*//g' " . name)
    let pkg = execute("sed 's//.*//g' " . name)
    echo 'A: '.author.' pkg:'.pkg

endfunction


function! doomnvim#packages#install(name)

endfunction

function! doomnvim#packages#loadpackages()

endfunction
