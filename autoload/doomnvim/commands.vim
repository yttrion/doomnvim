"====================================================================
" doomnvim commands
" Author: Pierre-Yves Douault
" License: MIT
"====================================================================


function! doomnvim#commands#init()
    if g:doomnvim_autocomplete_par ==# 1
        inoremap " ""<left>
        inoremap ' ''<left>
        inoremap ( ()<left>
        inoremap [ []<left>
        inoremap { {}<left>
        inoremap {<CR> {<CR>}<ESC>O
        inoremap {;<CR> {<CR>};<ESC>O
    endif

endfunction
