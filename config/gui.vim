"====================================================
" gui configuration file for doomnvim
" Author: Pierre-Yves Douault
" License: MIT
"====================================================


if g:doomnvim_colorscheme !=# ''
    try
        exec 'set background=' . g:doomnvim_colorscheme_bg
        exec 'colorscheme ' . g:doomnvim_colorscheme
    catch
        call doomnvim#logging#message('!', 'Colorscheme not found', 1)
        exec 'colorscheme ' . g:doomnvim_colorscheme
    endtry
else
    call doomnvim#logging#message('!', 'Forced default colorscheme', 1)
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

