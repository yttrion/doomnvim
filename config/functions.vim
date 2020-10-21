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


function! RenameFile()
	let old = expand('%')
	let new = input('Save as: ', expand('%'), 'file')
	if new != '' && new != old
		exec ':saveas ' . new
		exec ':silent !rm ' . old
		exec 'bd ' . old
		redraw!
	endif
endfunction


function! BufSel(pattern)
  	let bufcount = bufnr("$")
  	let currbufnr = 1
  	let nummatches = 0
  	let firstmatchingbufnr = 0
  	while currbufnr <= bufcount
  	  	if(bufexists(currbufnr))
  	  	  	let currbufname = bufname(currbufnr)
  	  	  	if(match(currbufname, a:pattern) > -1)
  	  	  	  	echo currbufnr . ": ". bufname(currbufnr)
  	  	  	  	let nummatches += 1
  	  	  	  	let firstmatchingbufnr = currbufnr
  	  	  	endif
  	  	endif
  	  	let currbufnr = currbufnr + 1
  	endwhile
  	if(nummatches == 1)
  	  	execute ":buffer ". firstmatchingbufnr
  	elseif(nummatches > 1)
  	  	let desiredbufnr = input("Enter buffer number: ")
  	  	if(strlen(desiredbufnr) != 0)
  	    	execute ":buffer ". desiredbufnr
  	  	endif
  		else
  	  	echo "No matching buffers"
  	endif
endfunction


function! CreateCommit()
	let commit_msg = input('Commit message: ')
	if commit_msg != ''
		exec ':!git commit -m ' . commit_msg
	endif
endfunction
