"=========================================
" Custom package manager for doomnvim
" Author: Pierre-Yves Douault
" License: MIT
"=========================================

function! doomnvim#packages#checkinstall(name)
    " sed 's/:.*//'
    let author = system('echo ' .a:name.  " | sed 's/\\/.*//'")
    let pkg = system('echo ' .a:name.  " | sed 's/.*\\///'")
    " for syntax check purposes
    "echo 'A: '.author.' pkg:'.pkg
    if isdirectory(g:doomnvim_root.'/plugged/'.pkg)
        call doomnvim#logging#message('+','Found '.a:name,2)
    else
        call doomnvim#logging#message('+','Installing '.a:name.'...',2)
        call doomnvim#packages#install(author,pkg)
    endif

endfunction


function! doomnvim#packages#install(author,pkg)
    try
       call system('git clone -q https://www.github.com/'
                    \ .a:author
                    \ .'/'
                    \ .a:pkg.' '
                    \ .g:doomnvim_root
                    \ .'/plugged/') 
    catch
        call doomnvim#logging#message('!','Unable to clone '.a:name,1)
    endtry

endfunction

function! doomnvim#packages#loadpackages()
    
endfunction

function! doomnvim#packages#cleanpackages()
    " sed -n '/pattern/!p' file
endfunction
