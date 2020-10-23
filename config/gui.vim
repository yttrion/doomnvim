"====================================================
" gui configuration file for doomnvim
" Author: Pierre-Yves Douault
" License: MIT
"====================================================


if g:doomnvim_colorscheme !=# ''
    "if !filereadable("$HOME/.doomnvim/autoload/colorscheme")
    if glob("~/.doomnvim/autoload/colorscheme") !=# ''
        call doomnvim#logging#message("+","Found colorscheme file")
        let scheme = readfile(glob("~/.doomnvim/autoload/colorscheme"))
        if scheme[0] != ''
            exec 'colorscheme ' . scheme[0]
        else
            exec 'colorscheme ' . g:doomnvim_colorscheme
        endif
    else
        call doomnvim#logging#message("+","Colorscheme file not found")
        try
	    	exec 'set background=' . g:doomnvim_colorscheme_bg
	    	exec 'colorscheme ' . g:doomnvim_colorscheme
	    catch
            call doomnvim#logging#message("!","Unable to set colorscheme globals")
	    	exec 'colorscheme default'
        endtry
    endif
else
    call doomnvim#logging#message("!!","Forced default colorscheme")
	exec 'colorscheme default'
endif

if g:doomnvim_enable_guicolors == 1
	if has('nvim')
		set termguicolors
	endif
	if exists('+termguicolors')
		set termguicolors
	elseif exists('+guicolors')
		set guicolors
	endif
endif


" TODO
" Find workaround to read globals var
"colorscheme doom
"set background=dark
"set termguicolors


let g:lightline = {
	\ 'colorscheme' : 'one',
	\ }
