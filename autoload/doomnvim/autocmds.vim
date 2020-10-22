"====================================================================
" doomnvim autocmds
" Author: Pierre-Yves Douault
" License: MIT
"====================================================================


function! doomnvim#autocmds#init() abort
    " Load config
    if g:doomnvim_relative_num
        autocmd BufEnter,WinEnter * if &nu | set rnu | endif
        autocmd BufLeave,WinLeave * if &nu | set nornu | endif
    endif
    
    autocmd BufNewFile,BufEnter * set cpoptions+=d
    autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)


    autocmd ColorScheme gruvbox,jellybeans,nord,srcery,NeoSolarized call s:fix_colorscheme()


endfunction




" Fix from SpaceVim
function! s:fix_colorscheme() abort
  if &background ==# 'dark'
    if g:colors_name ==# 'gruvbox'
      hi VertSplit guibg=#282828 guifg=#181A1F
    elseif g:colors_name ==# 'jellybeans'
      hi VertSplit guibg=#151515 guifg=#080808
    elseif g:colors_name ==# 'nord'
      hi VertSplit guibg=#2E3440 guifg=#262626
    elseif g:colors_name ==# 'srcery'
      hi VertSplit guibg=#1C1B19 guifg=#262626
      hi clear Visual
      hi Visual guibg=#303030
    elseif g:colors_name ==# 'NeoSolarized'
      hi VertSplit guibg=#002b36 guifg=#181a1f
      hi clear Pmenu
      hi Pmenu guifg=#839496 guibg=#073642
    endif
  else
    if g:colors_name ==# 'gruvbox'
      hi VertSplit guibg=#fbf1c7 guifg=#e7e9e1
    endif
  endif
  hi SpaceVimLeaderGuiderGroupName cterm=bold ctermfg=175 gui=bold guifg=#d3869b
endfunction
