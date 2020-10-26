"====================================================================
" vim-startify config
" Author: Pierre-Yves Douault
" License: MIT
"====================================================================

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:nerdtreeBookmarks()
    let bookmarks = systemlist("cut -d' ' -f 2 ~/.NERDTreeBookmarks")
    let bookmarks = bookmarks[0:-2] " Slices an empty last line
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction


let g:startify_custom_header = [
			\ '______ _____  ________  ___',
			\ '|  _  \  _  ||  _  |  \/  |',
			\ '| | | | | | || | | | .  . |',
			\ '| | | | | | || | | | |\/| |',
			\ '| |/ /\ \_/ /\ \_/ / |  | |',
			\ '|___/  \___/  \___/\_|  |_/',
			\ '           NVIM            ',
			\ ]


let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']                        },
		  \ { 'type': function('s:gitModified'),  'header': ['   git modified']  },
		  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]


let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:webdevicons_enable_startify = g:doomnvim_enable_startmenu

let g:startify_bookmarks = [
	\ {'doomconfig' : '~/.doomnvim/'},
	\ ]

function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
