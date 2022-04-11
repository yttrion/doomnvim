"==================================================
" doomnvim config file load
" Author: Pierre-Yves Douault
" License: MIT
"==================================================

function! doomnvim#config#loadBFC()
    if filereadable(g:doomnvim_root . '../.doomrc')
        try
            execute 'source ' . g:doomnvim_root . '../.doomrc'
            call doomnvim#logging#message('+', 'Loading the BFC', 2)
        catch
            call doomnvim#logging#message('!', 'Error while loading the BFC', 1)
        endtry
    else
        call doomnvim#logging#message('+', 'No BFC file', 2)
        execute 'touch $HOME/.doomrc'  
    endif
endfunction

if empty(glob('~/.doomnvim/autoload/plug.vim'))
  	silent !curl -fLo ~/.doomnvim/autoload/plug.vim --create-dirs
    	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" On file load
if has('vim_starting')
	exe 'set encoding=utf-8'
endif
