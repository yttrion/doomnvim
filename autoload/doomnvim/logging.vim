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

function! doomnvim#logging#init()

    if g:doomnvim_logging != 0
        let today = strftime('%c')
        let boot_msg = "[".today."] - Starting doomnvim"
        try
            exec ':silent !echo '.boot_msg.'>> $HOME/.doomnvim/logs/doomnvim.log'
        catch
            echo "Cannot write on_start log message"
            exec ":!touch $HOME/.doomnvim/logs/doomnvim.log"
        endtry
    endif

endfunction


function! doomnvim#logging#error()

    echo "[!!!] - An error occurred"

endfunction
