"====================================================
" gui configuration file for doomnvim
" Author: Pierre-Yves Douault
" License: MIT
"====================================================

if g:doomnvim_colorscheme != ''
	try
		exec 'set background=' . g:doomnvim_colorscheme_bg
		exec 'set colorscheme=' . g:doomnvim_colorscheme
	catch
		exec 'set colorscheme default'
	endtry
else
	exec 'set colorscheme default'
fi

if g:doomnvim_enable_guicolors == 1
	if exists('+termguicolors')
		set termguicolors
	elseif exists('+guicolors')
		set guicolors
	endif
fi

let g:lightline = {
	\ 'colorscheme' : 'one',
	\ }
