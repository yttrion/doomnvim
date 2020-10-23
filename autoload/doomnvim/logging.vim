"============================================
" Logging handler for doomnvim
" Author: Pierre-Yves
" License: MIT
"============================================


function! doomnvim#logging#message(type, msg)
   
    if g:doomnvim_logging != 0
        if a:type == "!"
            let output = "[!] - " . a:msg
        elseif a:type == "+"
            let output = "[+] - " . a:msg
        elseif a:type == "*"
            let output = "[*] - " . a:msg
        elseif a:type == "?"
            let output = "[?] - " . a:msg
        endif
        try
            exec ':silent !echo '.output.' >> $HOME/.doomnvim/logs/doomnvim.log'
        catch
            let err_msg = "[!] - Cannot save: [" . a:msg . ']'
            exec ':silent !echo '.err_msg.' >> $HOME/.doomnvim/logs/doomnvim.log'
        endtry
    endif

endfunction


function! doomnvim#logging#error()

    echo "[!!!] - An error occurred"

endfunction
