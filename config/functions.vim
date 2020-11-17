"=====================================================
" Functions for doomnvim
" Author: Pierre-Yves Douault
" License: MIT
"=====================================================


" Checks backspace
function! s:check_backspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~ '\s'
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_backspace() ? "\<Tab>" :
      \ coc#refresh()

"No NERDTree alone except when startify
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle a terminal in a new buffer
function! TermToggle(height)
	if win_gotoid(g:term_win)
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
		"startinsert!
		let g:term_win = win_getid()
	endif
    call doomnvim#logging#message("*", "Toggled terminal", 2)
endfunction

"Toggle layout
function! LayoutToggle()
    try
        exec ':NERDTreeClose'
    catch
        call doomnvim#logging#message('!', 'No NERDTree buffer to close', 1)
    endtry
	if g:vert_layout ==1
		exe "normal \<C-w>K<CR>"
		let g:vert_layout = 0
	else
		exe "normal \<C-w>H<CR>"
		let g:vert_layout = 1
	endif
	call doomnvim#logging#message("*", "Switched layout", 2)
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
	call doomnvim#logging#message("*", "Renamed file", 2)
endfunction


function! BufSel(pattern)
    call doomnvim#logging#message("*", "Called BufSel", 2)
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
	    call doomnvim#logging#message("!", "No matching buffers", 1)
  	endif
endfunction


function! CreateCommit()
	call doomnvim#logging#message("*", "Created commit", 2)
	let commit_msg = input('Commit message: ')
	if commit_msg != ''
		exec ':!git commit -m ' . commit_msg
	endif
endfunction

function! EditColorscheme()
    if g:doomnvim_bfc ==# 0
        exec ':!cp $HOME/.doomnvim/autoload/doomnvim/default/.doomrc $HOME/'
        call doomnvim#logging#message('*', 'Created the BFC', 2)
    else
        call doomnvim#logging#message('*', 'BFC already in directory', 2)
    endif
    exec ":!ls $HOME/.doomnvim/colors | sed -e 's/\.vim$//'"
    call doomnvim#logging#message('?', 'Asking for colorscheme', 2)
    let target = input('Select colorscheme: ')
    " Find the '${oldcolor}' string in .doomrc and change its value
    try
        call doomnvim#logging#message('*', 'Changing colorscheme sed -i', 2)
        exec 'colorscheme ' . target
        " command ==> sed -i "s/'value'/'value'" .doomrc
        try
            exec ":!sed -i \"s/'".g:doomnvim_colorscheme."'/'".target."'/\" $HOME/.doomrc"
        catch
            call doomnvim#logging#message('!', 'No element to sed', 1)
            exec "echo let g:doomnvim_colorscheme = '".target."' >> $HOME/.doomrc"
            call doomnvim#logging#message('*', 'Created the BFC', 2)
        endtry
    catch
        call doomnvim#logging#message('!', 'Unable to edit colorscheme', 1)
    endtry
endfunction


function! SwitchBuf()
    " <C-w>H/J/K/L function
    try
        exec ':NERDTreeClose'
    catch
        call doomnvim#logging#message('!', 'No NERDTree buffer to close', 1)
    endtry
    if g:buf_left == 1
        exe "normal \<C-w>L<CR>"
        let g:buf_left = 0
    else
        exe "normal \<C-w>H<CR>"
        let g:buf_left = 1
    endif
    call doomnvim#logging#message('*', 'Called switchbuf', 2)
endfunction

function! OpenInFloat(cmd)
    try
        exec ':FloatermKill'
    catch
        call doomnvim#logging#message('!', 'No Floating term to close', 1)
    endtry
    try
        exec ':FloatermNew ' . a:cmd
    catch
        call doomnvim#logging#message('!', 'Unable to execute the command', 1)
    endtry
endfunction


function! ResizeWin(width,inc)
    let win_width = winwidth(0)
    let res = g:doomnvim_resize_percent
    let perc = float2nr(res*win_width)
    if a:width ==# 1
        if a:inc ==# 1
            exec ':vertical res +'.perc
        else
            exec ':vertical res -'.perc
        endif
    else
        if a:inc ==# 1
            exec ':res +'.perc
        else
            exec ':res -'.perc
        endif
    endif
    call doomnvim#logging#message('*', 'Resized window', 2)
endfunction

function! SaveFile()
    try
        exec ":w"
    catch
        call doomnvim#logging#message('!', 'No filename parsed', 1)
        let filename = input('Save as: ')
        exec ":silent  w " . filename
    endtry
    call doomnvim#logging#message('*', 'Saved file', 2)
endfunction
