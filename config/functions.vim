"=====================================================
" Functions for doomnvim
" Author: Pierre-Yves Douault
" License: MIT
"=====================================================


" Checks backspace
function! s:check_backspace() abort
	let col = col('.') -1
	return !col || getline('.')[col -1] =~ '\s'
endfunction

" Toggle a terminal in a new buffer
function! TermToggle(h)
	if win_gotoid(g:termwin)
		hide
	else
		botright new
		exec 'resize ' . a:height
		try
			exec 'buffer ' . g:term_buf
		catch
			call termopen($SHELL, {"detach":0})
			let g:term_buf = bufnr("")
			set nonumber
			set norelativenumber
			set signcolumn=no
		endtry
		startinsert!
		let g:term_win = win_getid()
	endif
endfunction

"Toggle layout
function! LayoutToggle()
	if g:vert_layout ==1
		:exe "normal \<C-w>K<CR>"
		let g:vert_layout = 0
	else
		:exe "normal \<C-w>H<CR>"
		let g:vert_layout = 1
	endif
endfunction

function! s:show_documentation()
	if (index(['vim','help'] &filetype) >= 0)
		execute 'h ' . expand('<cword>')
	else
		call CocActionAsync('doHover')
	endif
endfunction
