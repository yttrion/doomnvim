"============================================
" Logging handler for doomnvim
" Author: Pierre-Yves
" License: MIT
"============================================


function! doomnvim#logging#message(type, msg) abort
    
    if g:doomnvim_logging == 1
        if type == "!"
            let output = "[!] - " . msg
        elseif type == "+"
            let output = "[+] - " . msg
        elseif type == "*"
            let output = "[*] - " . msg
        elseif type == "?"
            let output = "[?] - " . msg
        endif
        try
            echo output
            exec ':! echo "' . output . '" >> $HOME/.doomnvim/logs/doomnvim.log'
        catch
            exec ':! echo "[!] - Failed to echo message" >> $HOME/.doomnvim/logs/doomnvim.log'
        endtry
    endif

endfunction


function! doomnvim#logging#error()

    echo "[!!!] - An error occurred"

endfunction
