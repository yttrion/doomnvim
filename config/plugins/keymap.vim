"===============================================
" Keymap configuration for vim-which-key
" Author: Pierre-Yves Douault
" License: MIT
"===============================================

call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent><leader> :WhichKey '<Space>'<CR>


" File operations
" {{{

map <silent><space>fs 				:w<CR>
map <silent><space>fS 				:wa<CR>
" Fuzzy find
"map <silent><space>ff      		 :find<CR>
map <silent><space>fe 				:NERDTreeToggle<CR>
map <silent><space>fo 				:Ex<CR>
map <silent><space>fr 				:call RenameFile()<CR>

" }}}

" Buffer operations
" {{{

map <silent><space>bp 				:bp<CR> 
map <silent><space>bn 				:bn<CR>
map <silent><space>bk 				:q<CR>
map <silent><space>bl 				:blast<CR>
map <silent><space>bt 				:call TermToggle(10)<CR>
map <silent><space>be 				:enew<CR>
map <silent><space>bc 				:<C-u>up<bar>%bd<bar>e#<CR>
map <silent><space>bsv 				:vsp<CR>
map <silent><space>bsh 				:sp<CR>
map <silent><space>bf 				:call BufSel("<args>")<CR>

" }}}





"vim:fdl=0:fdm=marker:
