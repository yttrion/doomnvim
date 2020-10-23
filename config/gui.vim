"====================================================
" gui configuration file for doomnvim
" Author: Pierre-Yves Douault
" License: MIT
"====================================================

if g:doomnvim_colorscheme !=# ''
    "if !filereadable("$HOME/.doomnvim/autoload/colorscheme")
    if glob("~/.doomnvim/autoconfig/colorscheme") !=# ''
        echo "File found"
        let scheme = readfile(glob("~/.doomnvim/autoconfig/colorscheme"))
        exec 'colorscheme ' . scheme[0]
    else
        echo "File not found"
        try
	    	exec 'set background=' . g:doomnvim_colorscheme_bg
	    	exec 'colorscheme ' . g:doomnvim_colorscheme
	    catch
	    	exec 'colorscheme default'
	    endtry
    endif
else
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
