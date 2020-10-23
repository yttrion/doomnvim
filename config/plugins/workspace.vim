"========================================================
" workspace.vim --- Configuration for workspace plugin
" Author: Pierre-Yves Douault
" License: MIT
"========================================================

let g:workspace_autocreate = 1
let g:workspace_persist_undo_history = 1


let g:workspace_session_directory = $HOME . '/.doomnvim/sessions/'
let g:workspace_autosave_always = 1
let g:workspace_autosave_ignore = ['gitcommit', 'nerdtree', 'tagbar', 'term://*', 'NERD_tree_*', '__Tagbar__*']

