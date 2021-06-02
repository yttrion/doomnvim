"====================================================
" Exhaustive keymap configuration
" Author: Pierre-Yves Douault
" License: MIT
"====================================================

let mapleader   = ' '
let g:mapleader = ' '

call which_key#register('<Space>','g:which_key_map')
" Do not use try/catch as it keeps vim-which-key
" from starting correctly

nnoremap <silent><leader> :WhichKey '<Space>'<CR>

" To move
" map <silent><space>br             :call SwitchBuf()<CR>
"
" ==> Not working
" map <silent><space>cD 			<Plug>(coc-definition)
" map <silent><space>ci 			<Plug>(coc-implementation)
" map <silent><space>ct 			<Plug>(coc-type-definition)
" map <silent><space>cr 			<Plug>(coc-reference)
" map <silent><space>cs 			<Plug>(coc-format-selected)
"
" ==> Redundant
" map <silent><space>wh 			:wincmd h<CR>
" map <silent><space>wj           :wincmd j<CR>
" map <silent><space>wk           :wincmd k<CR>
" map <silent><space>wl 			:wincmd l<CR>


" Buffer operations---------------------------------------------------------{{{
map <silent><space>bp 			:bp<CR>
map <silent><space>bn 			:bn<CR>
map <silent><space>bq           :bunload<CR>
map <silent><space>bk 			:q!<CR>
map <silent><space>be 			:enew<CR>
map <silent><space>bc 			:<C-u>up<bar>%bd<bar>e#<CR>
map <silent><space>bf 			:Telescope buffers<CR>
map <silent><space>br 			<C-w>=<CR>
map <silent><space>bt 			:call TermToggle(7)<CR>
map <silent><space>bsv 			:vsp<CR>
map <silent><space>bsh 			:sp<CR>
map <silent><space>bmh			<C-w>H
map <silent><space>bmj			<C-w>J
map <silent><space>bmk			<C-w>K
map <silent><space>bml			<C-w>L
map <silent><space>bwi 			:call ResizeWin(1,1)<CR>
map <silent><space>bwd 			:call ResizeWin(1,0)<CR>
map <silent><space>bhi 			:call ResizeWin(0,1)<CR>
map <silent><space>bhd 			:call ResizeWin(0,0)<CR>
map <silent><space>bl           :Telescope buffers<CR>
"}}}

" Code operation------------------------------------------------------------{{{
map <silent><space>ci 			gg=G<CR>
map <silent><space>cd 			:call <SID>show_documentation()<CR>
map <silent><space>cc 			<Plug>NERDCommenterToggle
map <silent><space>cv           <C-v>
map <silent><space>cf           <Plug>(coc-format-selected)
map <silent><space>cr           <Plug>(coc-rename)
map <silent><space>fh           :Telescope help_tags<CR>
"}}}

" File operation------------------------------------------------------------{{{
map <silent><space>fs 			:call SaveFile()<CR>
map <silent><space>ff          :Telescope find_files<CR>
map <silent><space>fS 			:wa<CR>
map <silent><space>fe 			:NERDTreeToggle<CR>
map <silent><space>fo 			:sp <bar>buffer<bar>call bufnr("")<bar>Ex<CR>
map <silent><space>fr 			:call RenameFile()<CR>
map <silent><space>fn           :DashboardNewFile<CR>
"}}}

" Git operation-------------------------------------------------------------{{{
map <silent><space>gg 			:GitGutterToggle<CR>
nmap <silent><space>ghp 		<Plug>(GitGutterPrevHunk)
nmap <silent><space>ghn 		<Plug>(GitGutterNextHunk)
nmap <silent><space>ghs 		<Plug>(GitGutterStageHunk)
nmap <silent><space>ghu 		<Plug>(GitGutterUndoHunk)
nmap <silent><space>ghP  		<Plug>(GitGutterPreviewHunk)
map <silent><space>gs 			:call OpenInFloat("git status")<CR>
map <silent><space>gC           :git checkout 
map <silent><space>gc 			:call CreateCommit()<CR>
"}}}

" Help----------------------------------------------------------------------{{{
map <silent><space>hh 			:helpgrep .<CR>
map <silent><space>hi 			:call OpenInFloat("$HOME/.doomnvim/install.sh --help")<CR>
map <silent><space>hu 			:call OpenInFloat("$HOME/.doomnvim/install.sh --update")<CR>
map <silent><space>hX 			:call OpenInFloat("$HOME/.doomnvim/install.sh --uninstall")<CR>
"}}}

" Plugins-------------------------------------------------------------------{{{
map <silent><space>pu 			:PlugUpdate<CR>
map <silent><space>pi 			:call doomnvim#functions#installPlugs()<CR>
map <silent><space>pc 			:PlugClean<CR>
map <silent><space>pm 			:PlugUpgrade<CR>
map <silent><space>pr 			:UpdateRemotePlugins<CR>
map <silent><space>pau 			:CocUpdate<CR>
map <silent><space>pas 			:CocUpdateSync<CR>
map <silent><space>par 			:CocRestart<CR>
"}}}

" Quit----------------------------------------------------------------------{{{
map <silent><space>qq 			:call doomnvim#functions#quitdoom(0,0)<CR>
map <silent><space>qQ 			:call doomnvim#functions#quitdoom(1,1)<CR>
map <silent><space>ql           :<C-u>SessionLoad<CR>
map <silent><space>qs           :<C-u>SessionSave<CR>
"}}}

" Search--------------------------------------------------------------------{{{
map <silent><space>sh           :DashboardFindHistory<CR>
map <silent><space>sf           :DashboardFindFile<CR>
map <silent><space>sw           :DashboardFindWord<CR>
"}}}

" Toggle--------------------------------------------------------------------{{{
map <silent><space>tl 			:set invnumber<bar>set invrelativenumber<CR>
map <silent><space>tw 			:set wrap!<CR>
map <silent><space>th 			:noh<CR>
map <silent><space>te 			:hi Error NONE<CR>
map <silent><space>tt 			:Vista<CR>
map <silent><space>tf 			:FloatermNew<CR>
map <silent><space>tc 			:call Toggleconceal()<CR>
map <silent><space>ts           :set spell!<CR>
"}}}

" Window--------------------------------------------------------------------{{{
map <silent><space>wt           :call LayoutToggle()<CR>
map <silent><space>wN           :tabnew<CR>
map <silent><space>wn           :tabnext<CR>
map <silent><space>wp           :tabprevious<CR>
map <silent><space>wc           :tabclose<CR>
map <silent><space>wr           :call SwitchBuf()<CR>
"}}}


" Misc----------------------------------------------------------------------{{{
map <silent><space>mS 			:source %<CR>
map <silent><Leader>mc          :Clap colors<CR>
map <silent><Leader>mj          :DashboardJumpMark<CR>
map <silent><Leader>mh          :checkhealth<CR>
"}}}

" Space---------------------------------------------------------------------{{{
map <silent><space><space>h		<C-w>h
map <silent><space><space>j		<C-w>j
map <silent><space><space>k		<C-w>k
map <silent><space><space>l		<C-w>l
"}}}


" Misc functions------------------------------------------------------------{{{
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

if doomnvim#functions#checkbin('fzf') == 1
    map <silent>mf      :FloatermNew fzf<CR>
endif

" Misc autogroups-----------------------------------------------------------{{{
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
"}}}
