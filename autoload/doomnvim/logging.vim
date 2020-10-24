"============================================
" Logging handler for doomnvim
" Author: Pierre-Yves
" License: MIT
"============================================


function! doomnvim#logging#message(type, msg, level)
    " + : doomnvim internal
    " * : external command
    " ? : Prompt
    " ! : Error
    " !!! : CRITICAL

    if g:doomnvim_logging != 0
        " Generate log message
        if a:type == "!"
            let output = "[!] - " . a:msg
        elseif a:type == "+"
            let output = "[+] - " . a:msg
        elseif a:type == "*"
            let output = "[*] - " . a:msg
        elseif a:type == "?"
            let output = "[?] - " . a:msg
        elseif a:type == "!!!"
            let output = '[!!!] = ' . a:msg
        endif

        try
            if g:doomnvim_logging >= a:level
                if g:doomnvim_logging == 3
                    echo output
                endif
                exec ':silent !echo '.output.' >> $HOME/.doomnvim/logs/doomnvim.log'
            endif
        catch
            let err_msg = "[!] - Cannot save: " . a:msg . ''
            exec ':silent !echo '.err_msg.' >> $HOME/.doomnvim/logs/doomnvim.log'
        endtry

    endif

endfunction

function! doomnvim#logging#init()

    if g:doomnvim_logging != 0
        let today = strftime('%c')
        let boot_msg = "[".today."] - Starting doomnvim"
        try
            exec ':silent !echo '.boot_msg.' >> $HOME/.doomnvim/logs/doomnvim.log'
        catch
            echo "Cannot write on_start log message"
            exec ":!touch $HOME/.doomnvim/logs/doomnvim.log"
        endtry
    endif

endfunction

