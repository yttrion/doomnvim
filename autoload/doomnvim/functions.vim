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
        call doomnvim#logging#message('*', 'Checking if colorscheme was changed...', 2)
        let target = g:colors_name
        if target != g:doomnvim_colorscheme
            exec ":!sed -i \"s/'".g:doomnvim_colorscheme."'/'".target."'/\" $HOME/.doomrc"
            call doomnvim#logging#message('*', 'Colorscheme successfully changed', 2)
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
    " Autosave session if enabled
    if g:doomnvim_sessionsave_onquit ==# 1
        execute(':SessionSave')
    endif
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
    exec ':silent !echo "\# doomnvim crash report" >> $HOME/.doomnvim/logs/report.md'
    exec ':silent !echo "\#\# Begin log dump" >> $HOME/.doomnvim/logs/report.md'
    exec ':silent !cat $HOME/.doomnvim/logs/doomnvim.log >> $HOME/.doomnvim/logs/report.md'
    exec ':silent !echo "\#\# End log dump" >> $HOME/.doomnvim/logs/report.md'
    exec ':silent echo "Report created at $HOME/.doomnvim/logs/report.md"'

endfunction

function! doomnvim#functions#installPlugs()
    call doomnvim#functions#custplug()
    source g:doomnvim_root.'/init.vim' 
    execute(':PlugInstall') 
endfunction

function! doomnvim#functions#disable_plug()
  for name in g:doomnvim_disabled_plugins
    if has_key(g:plugs, name)
        call doomnvim#logging#message('+', 'Disabling '.name, 2)
        call remove(g:plugs, name)
    endif

    let idx = index(g:plugs_order, name)
    if idx > -1
      call remove(g:plugs_order, idx)
    endif
  endfor
endfunction

function! doomnvim#functions#checkinstall(pkg)
    if isdirectory(g:doomnvim_root.'/plugged/'.a:pkg)
        return 1
    else
        return 0
    endif
endfunction

function! doomnvim#functions#install(name,author,pkg)
    call doomnvim#logging#message('+','Cloning repo for '.a:name,2)
    try
        call system('git clone -q https://github.com/'
                    \ .a:name
                    \ .' $HOME/.doomnvim/plugged/'.a:pkg)
    catch
        call doomnvim#logging#message('!','Unable to clone repo',1)
    endtry
    let cmd = "42iPlug ".string(a:name)
    call system('sed -i "'.cmd.'" $HOME/.doomnvim/config/main.vim')

endfunction

function! doomnvim#functions#custplug() abort
    call doomnvim#logging#message('+', 'Looking for custom plugins', 2)
    if len(g:doomnvim_custom_plugins) == 0
        call doomnvim#logging#message('!', 'No custom plugins found', 1)
    else
        call doomnvim#logging#message('+', 'Creating snapshot...', 2)
        execute(':PlugSnapshot '.g:doomnvim_root.'/logs/snapshot')
        for name in g:doomnvim_custom_plugins
            let author = system('echo '.name." | sed 's/\\/.*//'") 
            let pkg = system('echo '.name." | sed 's/.*\\///'") 
            call doomnvim#logging#message('+','Loading '.string(name),2)
            let tmp=execute(':call doomnvim#functions#checkinstall('.string(pkg).')')
            if tmp ==# 0
                call doomnvim#functions#install(name,author,pkg)
            endif
        endfor
    endif
endfunction

function! doomnvim#functions#clean_plugins() abort
    call doomnvim#logging#message('*','Cleaning old plugins',2)
endfunction
