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
        call doomnvim#logging#message('+','Cloning repo for '.a:name.'...',2)
        call system('git clone -q https://www.github.com/'
                    \ .a:author
                    \ .'/'
                    \ .a:pkg.' '
                    \ .g:doomnvim_root
                    \ .'/plugged/'.a:pkg) 
    catch
        call doomnvim#logging#message('!','Unable to clone '.a:name,1)
    endtry

endfunction

function! doomnvim#packages#loadpackages()
    if filereadable(g:doomnvim_root.'/autoload/doomnvim/plugins.vim')
        for name in g:doomnvim_custom_plugins
            "call system("echo ".string(name)." >> "
            "            \. g:doomnvim_root."/autoload/plugins.vim")
            " New method ==> sed in line 42 for plugins
            " sed -i '8i8 This is Line 8' FILE
            "call system("sed -i '".)
            "function! AddLine()
            "let l:foundline = search("bbb") " Can return 0 on no match
            "call append(l:foundline, "ccc")
            "wq!
            let l:foundline = search("\"Custom plugins")
            call append(l:foundline, "Plug '".string(name)."'")
        endfor
    else
        call doomnvim#logging#message('!','Unable to find plugins.vim file',1)
    endif
    
endfunction

function! doomnvim#packages#createconfig()
        call system("echo call plug#begin('~/.doomnvim/plugged')>> " 
            \.g:doomnvim_root
            \."/autoload/doomnvim/plugins.vim")
        
        
        call system("echo call plug#end('~/.doomnvim/plugged')>> " 
            \.g:doomnvim_root
            \."/autoload/doomnvim/plugins.vim")
endfunction

function! doomnvim#packages#cleanpackages()
    " sed -n '/pattern/!p' file
endfunction
