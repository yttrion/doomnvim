"==============================================
" Functions for doomnvim package
" Author: Pierre-Yves Douault
" License: MIT
"==============================================

function! doomnvim#functions#update()
    try
        exec ':FloatermKill'
        exec ':FloatermNew cd $HOME/.doomnvim && git pull --no-edit'
    endtry
    execute 'source' g:doomnvim_root.'init.vim'
endfunction

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
    return full_root[:-22]
endfunction


function! doomnvim#functions#quitdoom(write, force)
    try
        let target = g:colors_name
        call doomnvim#logging#message('*', 'Checking if colorscheme was changed...', 2)
        let run = system(":silent !sed -i \"s/'"
            \ .g:doomnvim_colorscheme."'/'".target."'/\" $HOME/.doomrc || echo 1")
        if run == 1
            call doomnvim#logging#message('*', 'Colorscheme successfully changed', 2)
        else
            call doomnvim#logging#message('!', 'GNU sed error. Using fallback function', 1)
            exec ":silent !echo let g:doomnvim_colorscheme=\"".g:colors_name."\""
        endif
    catch
        call doomnvim#logging#message('!', 'Unable to write the BFC.', 1)
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
        execute(':silent :SessionSave')
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

" Create a MD report
function! doomnvim#functions#createReport() abort
    " Creates a markdown report to use when bugs occurs
    exec ':silent !echo "\# doomnvim crash report" >> $HOME/.doomnvim/logs/report.md'
    exec ':silent !echo "\#\# Begin log dump" >> $HOME/.doomnvim/logs/report.md'
    exec ':silent !cat $HOME/.doomnvim/logs/doomnvim.log >> $HOME/.doomnvim/logs/report.md'
    exec ':silent !echo "\#\# End log dump" >> $HOME/.doomnvim/logs/report.md'
    exec ':silent echo "Report created at $HOME/.doomnvim/logs/report.md"'
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
    return isdirectory(g:doomnvim_root.'/plugged/'.a:pkg)
endfunction


function doomnvim#functions#installPlugs()
    call doomnvim#functions#checkUserPlugins()
    execute 'source' g:doomnvim_root.'init.vim'
    execute(':PlugInstall') 
endfunction


function doomnvim#functions#checkUserPlugins() abort
    if filereadable(g:doomnvim_root.'logs/upkg')
        call doomnvim#logging#message('+', 'Found backup of user pkg', 2)
    else
        call doomnvim#logging#message('+', 'Creating backup of user pkg', 2)
        call system('touch $HOME/.doomnvim/logs/upkg')
    endif
    call doomnvim#logging#message('+', 'Looking for custom plugins', 2)
    if len(g:doomnvim_custom_plugins) ==# 0
        call doomnvim#logging#message('+', 'No custom plugins', 2)
    else
        call doomnvim#logging#message('+', 'Found user plugins. Generating backup', 2)
        for name in g:doomnvim_custom_plugins
            let author = system('echo '.name." | sed 's/\\/.*//'") 
            let pkg = system('echo '.name." | sed 's/.*\\///'") 
            let found = system('grep -Rc "'.name.'" $HOME/.doomnvim/logs/upkg') 
            let enabled = system('grep -Rc "'.name.'" $HOME/.doomnvim/config/main.vim') 
            if found == 0
                exec ':silent !echo '.name.' >> $HOME/.doomnvim/logs/upkg'
                call doomnvim#functions#addPlugin(name, author, pkg)
            else
                call doomnvim#logging#message('+', 'Pkg already backed up', 2)
            endif
            if enabled == 0
                call doomnvim#functions#addPlugin(name, author, pkg)
            else
                call doomnvim#logging#message('+', "Plugin already enabled", 2)
            endif
        endfor
    endif
endfunction


function doomnvim#functions#addPlugin(name, author, pkg)
    call doomnvim#logging#message('+','Cloning repo for '.a:name,2)
    try
        call system('git clone -q https://github.com/'
                    \ .a:name
                    \ .' $HOME/.doomnvim/plugged/'.a:pkg)
    catch
        call doomnvim#logging#message('!','Unable to clone repo',1)
    endtry
    call doomnvim#logging#message('+','Checking if plugins is already flagged',2)
    let found = system('grep -Rc "'.a:name.'" $HOME/.doomnvim/config/main.vim')
    if found == 0
        call doomnvim#logging#message('+','Adding plugin to main.vim',2)
        let cmd = g:doomnvim_custom_line."iPlug ".string(a:name)
        call system('sed -i "'.cmd.'" $HOME/.doomnvim/config/main.vim')
    else
        call doomnvim#logging#message('+','Plugin already installed',2)
    endif
endfunction


function doomnvim#functions#cleanPlugin()
    let userpkg = readfile(g:doomnvim_root.'logs/upkg')
    for value in userpkg
        let author = system('echo '.value." | sed 's/\\/.*//'") 
        let pkg = system('echo '.value." | sed 's/.*\\///'") 
        if index(g:doomnvim_custom_plugins, value) == -1
            call doomnvim#logging#message('+', 'Found obsolete plugin', 2)
            call system(':!sed -i "/'.value.'/d" $HOME/.doomnvim/config/main.vim')
            call system(':!sed -i "/'.value.'/d" $HOME/.doomnvim/logs/upkg')
        endif
    endfor
    execute(':PlugClean') 
endfunction


function! doomnvim#functions#sourceDirectory(file) abort
  for s:fpath in split(globpath(a:file, '*.vim'), '\n')
    exe 'source' s:fpath
  endfor
endfunction
