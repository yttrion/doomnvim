"===============================================
" Keymap configuration for vim-which-key
" Author: Pierre-Yves Douault
" License: MIT
"===============================================

call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent><leader> :WhichKey '<Space>'<CR>


" File operations----------------------------------------------------{{{

map <silent><space>fs 				:w<CR>
map <silent><space>fS 				:wa<CR>
" Fuzzy find
"map <silent><space>ff      		 :find<CR>
map <silent><space>fe 				:NERDTreeToggle<CR>
map <silent><space>fo 				:Ex<CR>
map <silent><space>fr 				:call RenameFile()<CR>

" }}}


" Buffer operations -------------------------------------------------{{{

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
map <silent><space>br 				<C-w>=<CR>
map <silent><space>bwi 				10<C-w>><CR>
map <silent><space>bwd 				10<C-w><<CR>
map <silent><space>bhi 				10<C-w>+<CR>
map <silent><space>bhd 				10<C-w>-<CR>

" }}}


" Code operations ---------------------------------------------------{{{

map <silent><space>cd 				<Plug>(coc-definition)
map <silent><space>ci 				<Plug>(coc-implementation)
map <silent><space>ct 				<Plug>(coc-type-definition)
map <silent><space>cr 				<Plug>(coc-reference)
map <silent><space>cs 				<Plug>(coc-format-selected)
map <silent><space>cf 				:gg=G<CR>
map <silent><space>cD 				:call <SID>sho<_documentation()<CR>
map <silent><space>cc 				<Plug>NERDCommenterToggle

" }}}


" Git operations ----------------------------------------------------{{{

map <silent><space>gg 				:GitGutterToggle<CR>
map <silent><space>ghp 				<Plug>(GitGutterPrevHunk)
map <silent><space>ghn 				<Plug>(GitGutterNextHunk)
map <silent><space>gs 				:!git status<CR>
map <silent><space>gcc 				:call CreateCommit()<CR>

" }}}


" Help --------------------------------------------------------------{{{

map <silent><space>hh 				:helpgrep .<CR>
map <silent><space>hi 				:!$HOME/.doomnvim/install.sh --help<CR>
map <silent><space>hu 				:!$HOME/.doomnvim/install.sh --update<CR>
map <silent><space>hX 				:!$HOME/.doomnvim/install.sh --uninstall<CR>

" }}}


" Quit --------------------------------------------------------------{{{

map <silent><space>qq 				:wa<bar>q<CR>
map <silent><space>qQ 				:qa!<CR>
" }}}


" Search ------------------------------------------------------------{{{
" }}}


" Toggle ------------------------------------------------------------{{{

map <silent><space>tl 				:set invnumber<CR>
map <silent><space>tw 				:set wrap!<CR>
"Toggle fullscreen
"map <silent><space>tf
map <silent><space>th 				:noh<CR>
map <silent><space>te 				:hi Error NONE<CR>
map <silent><space>tt 				:TagbarToggle<CR>
map <silent><space>tf 				:FloatermNew<CR>

" }}}


" Window ------------------------------------------------------------{{{
" }}}


" Plugins -----------------------------------------------------------{{{

map <silent><space>pu 				:PlugUpdate<CR>
map <silent><space>pi 				:PlugInstall<CR>
map <silent><space>pc 				:PlugClean<CR>
map <silent><space>pm 				:PlugUpgrade<CR>
map <silent><space>pr 				:UpdateRemotePlugins<CR>
map <silent><space>pau 				:CocUpdate<CR>
map <silent><space>pas 				:CocUpdateSync<CR>
map <silent><space>par 				:CocRestart<CR>

" }}}


" Misc --------------------------------------------------------------{{{

map <silent><space>ms 				:source %<CR>

" }}}


"vim:fdl=0:fdm=marker:
