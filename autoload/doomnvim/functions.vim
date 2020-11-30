"==============================================
" Functions for doomnvim package
" Author: Pierre-Yves Douault
" License: MIT
"==============================================



function! doomnvim#functions#checkbin(bin)  abort
    if executable(a:bin)
        call doomnvim#logging#message('*', a:bin . ' found', 2)
        return 1
    else
        call doomnvim#logging#message('*', a:bin . ' not found', 1)
        return 0
    endif
endfunction


function! doomnvim#functions#checkplugin(plugin) abort
    if isdirectory(g:doomnvim_root.'plugged/'.a:plugin)
        echo 'Plugin found'
    else
        echo 'Plugin not found'
    endif
endfunction



function! doomnvim#functions#getroot() abort

    call doomnvim#logging#message('+', 'doomnvim.functions.getroot called', 2)
    let full_root =  expand('<sfile>:p')
    let root = full_root[:-22]
    return root
    " Returns
    " /home/username/.doomnvim/autoload/functions.vim
    " Trim for 18 char from the end
endfunction


function! doomnvim#functions#quitdoom(write, force) abort

    try
        let target = g:colors_name
        if target != g:doomnvim_colorscheme
            call doomnvim#logging#message('*', 'Checking if colorscheme was changed...', 2)
            exec ":!sed -i \"s/'".g:doomnvim_colorscheme."'/'".target."'/\" $HOME/.doomrc"
        else
            call doomnvim#logging#message('*', 'No need to write colors (same)', 2)
        endif
    catch
        call doomnvim#logging#message('!', 'Unable to write to the BFC', 1)
    endtry

    exec ':silent !echo "[---] - Dumping :messages" >> $HOME/.doomnvim/logs/doomnvim.log'
    exec 'redir >> $HOME/.doomnvim/logs/doomnvim.log'
    exec ':silent messages'
    exec ':redir END'
    exec ':silent !echo " " >> $HOME/.doomnvim/logs/doomnvim.log'
    exec ':silent !echo "[---] - End of dump" >> $HOME/.doomnvim/logs/doomnvim.log'

    let quit_cmd = ''

    if a:write == 1
        let quit_cmd .= 'wa | '
    endif
    if a:force == 0
        exec quit_cmd.'q!'
    elseif a:force == 1
        exec quit_cmd.'qa!'
    endif

endfunction


function! doomnvim#functions#createReport() abort
    " Creates a markdown report to use when bugs occurs
    exec ':silent !echo "# doomnvim crash report" >> $HOME/.doomnvim/logs/report.md'
    exec ':silent !echo "## Begin log dump" >> $HOME/.doomnvim/logs/report.md'
    exec ':silent !echo | cat $HOME/.doomnvim/logs/doomnvim.log >> $HOME/.doomnvim/logs/report.md'
    exec ':silent !echo "## End log dump" >> $HOME/.doomnvim/logs/report.md'
    exec ':silent echo "Report created at $HOME/.doomnvim/logs/report.md"'

endfunction

