"===============================================
" Keymap configuration for vim-which-key
" Author: Pierre-Yves Douault
" License: MIT
"===============================================

let mapleader = " "
call which_key#register('<Space>', "g:which_key_map")
" Try catch causes which key not to show when installed
"try
"	call which_key#register('<Space>', "g:which_key_map")
"catch
"	echo "Installing all plugins..."
"endtry

nnoremap <silent><leader> :WhichKey '<Space>'<CR>


" File operations----------------------------------------------------{{{

map <silent><space>fs 				:w<CR>
map <silent><space>fS 				:wa<CR>
map <silent><space>fe 				:NERDTreeToggle<CR>
map <silent><space>fo 				:Ex<CR>
map <silent><space>fr 				:call RenameFile()<CR>

" }}}


" Buffer operations -------------------------------------------------{{{

map <silent><space>bp 				:bp<CR>
map <silent><space>bn 				:bn<CR>
map <silent><space>bk 				:q!<CR>
map <silent><space>bl 				:blast<CR>
map <silent><space>bt 				:call TermToggle(7)<CR>
map <silent><space>be 				:enew<CR>
map <silent><space>bc 				:<C-u>up<bar>%bd<bar>e#<CR>
map <silent><space>bsv 				:vsp<CR>
map <silent><space>bsh 				:sp<CR>
map <silent><space>bf 				:call BufSel("")<CR>
map <silent><space>bR 				<C-w>=<CR>
map <silent><space>bwi 				10<C-w>><CR>
map <silent><space>bwd 				10<C-w><<CR>
map <silent><space>bhi 				10<C-w>+<CR>
map <silent><space>bhd 				10<C-w>-<CR>
map <silent><space>br               :call SwitchBuf()<CR>

" }}}


" Code operations ---------------------------------------------------{{{

map <silent><space>cd 				<Plug>(coc-definition)
map <silent><space>ci 				<Plug>(coc-implementation)
map <silent><space>ct 				<Plug>(coc-type-definition)
map <silent><space>cr 				<Plug>(coc-reference)
map <silent><space>cs 				<Plug>(coc-format-selected)
map <silent><space>cf 				:gg=G<CR>
map <silent><space>cD 				:call <SID>show_documentation()<CR>
map <silent><space>cc 				<Plug>NERDCommenterToggle
map <silent><space>cC               <C-v>

" }}}


" Git operations ----------------------------------------------------{{{

map <silent><space>gg 				:GitGutterToggle<CR>
nmap <silent><space>ghp 			<Plug>(GitGutterPrevHunk)
nmap <silent><space>ghn 			<Plug>(GitGutterNextHunk)
nmap <silent><space>ghs 			<Plug>(GitGutterStageHunk)
nmap <silent><space>ghu 			<Plug>(GitGutterUndoHunk)
nmap <silent><space>ghP  			<Plug>(GitGutterPreviewHunk)
map <silent><space>gs 				:!git status<CR>
map <silent><space>gcc 				:call CreateCommit()<CR>

" }}}


" Help --------------------------------------------------------------{{{

map <silent><space>hh 				:helpgrep .<CR>
map <silent><space>hi 				:call OpenInFloat("$HOME/.doomnvim/install.sh --help")<CR>
map <silent><space>hu 				:call OpenInFloat("$HOME/.doomnvim/install.sh --update")<CR>
map <silent><space>hX 				:call OpenInFloat("$HOME/.doomnvim/install.sh --uninstall")<CR>

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
map <silent><space>th 				:noh<CR>
map <silent><space>te 				:hi Error NONE<CR>
map <silent><space>tt 				:TagbarToggle<CR>
map <silent><space>tf 				:FloatermNew<CR>

" }}}


" Window ------------------------------------------------------------{{{

map <silent><space>wh 				:wincmd h<CR>
map <silent><space>wj               :wincmd j<CR>
map <silent><space>wk               :wincmd k<CR>
map <silent><space>wl 				:wincmd l<CR>
map <silent><space>wt               :call LayoutToggle()<CR>

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

map <silent><space>mS 				:source %<CR>
map <silent><space>ms 				:Startify<CR>
map <silent><space>mc               :call ChangeColors()<CR>

" }}}

" Conditional keymaps -----------------------------------------------{{{

" Allows FZF keymap if FZF is present
if doomnvim#functions#checkbin('fzf') == 1
    map <silent><space>mf           :FloatermNew fzf<CR>
endif
" }}}


"vim:fdl=0:fdm=marker:
