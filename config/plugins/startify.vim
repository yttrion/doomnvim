let g:startify_custom_header = [
			\ '______ _____  ________  ___ _   _ _   _ ________  ___',
			\ '|  _  \  _  ||  _  |  \/  || \ | | | | |_   _|  \/  |',
			\ '| | | | | | || | | | .  . ||  \| | | | | | | | .  . |',
			\ '| | | | | | || | | | |\/| || . ` | | | | | | | |\/| |',
			\ '| |/ /\ \_/ /\ \_/ / |  | || |\  \ \_/ /_| |_| |  | |',
			\ '|___/  \___/  \___/\_|  |_/\_| \_/\___/ \___/\_|  |_/',
			\ ]


let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]


let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:webdevicons_enable_startify = 1

let g:startify_bookmarks = [
	\ {'doomconfig' : '~/.doomnvim/'},
	\ ]

function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
    endfunction
