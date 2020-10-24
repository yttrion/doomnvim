"===============================================================
" nerdtree.vim --- Configuration for NERDTree plugin
" Author: Pierre-Yves Douault
" License: MIT
"===============================================================

let NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 23

function! AutoOpenNERDTree()
	if has('gui_running') && argc() == 0
		:NERDTree
	endif
endfunction

function! AutoFocusAwayFromNERDTree()
	if has('gui_running') && argc() == 0
		:wincmd l
	endif
endfunction

autocmd GUIEnter * call AutoOpenNERDTree()
autocmd VimEnter * call AutoFocusAwayFromNERDTree()
