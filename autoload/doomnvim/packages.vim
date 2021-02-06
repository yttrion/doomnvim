"=========================================
" Custom package manager for doomnvim
" Author: Pierre-Yves Douault
" License: MIT
"=========================================

function! doomnvim#packages#checkinstall(name)
    " sed 's/:.*//'
    let author = execute('echo ' .a:name.  " | sed 's/\/.*//'")
    let pkg = execute('echo ' .a:name.  " | sed 's/.*\///'")
    echo 'A: '.author.' pkg:'.pkg

endfunction


function! doomnvim#packages#install(name)

endfunction

function! doomnvim#packages#loadpackages()

endfunction
