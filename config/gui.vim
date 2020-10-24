"====================================================
" gui configuration file for doomnvim
" Author: Pierre-Yves Douault
" License: MIT
"====================================================


if g:doomnvim_colorscheme !=# ''
    "if !filereadable("$HOME/.doomnvim/autoload/colorscheme")
    "if glob("~/.doomnvim/autoload/colorscheme") !=# ''
    if filereadable(g:doomnvim_root."autoload/colorscheme") !=# ''
        call doomnvim#logging#message("*", "Found colorscheme file", 2)
        let scheme = readfile(g:doomnvim_root."/autoload/colorscheme")
        if scheme[0] != ''
            exec 'colorscheme ' . scheme[0]
        else
            exec 'colorscheme ' . g:doomnvim_colorscheme
        endif
    else
        call doomnvim#logging#message("!", "Colorscheme file not found", 1)
        try
	    	exec 'set background=' . g:doomnvim_colorscheme_bg
	    	exec 'colorscheme ' . g:doomnvim_colorscheme
	    catch
            call doomnvim#logging#message("!", "Unable to set colorscheme globals", 1)
	    	exec 'colorscheme default'
        endtry
    endif
else
    call doomnvim#logging#message("!", "Forced default colorscheme", 1)
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

