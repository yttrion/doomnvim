"============================================
" init
" Author: Pierre-Yves Douault
" License: MIT
"============================================

" On load
if has('vim_starting')
	" Force utf-8
	exe 'set encoding=utf-8'
endif

"call doomnvim#functions#custplug()
call doomnvim#begin()
call doomnvim#functions#custplug()
"Temp functions
call doomnvim#end()

