"==============================================
" Dictionnary for vim_which_key
" Author: Pierre-Yves Douault
" License: MIT
"==============================================


let g:which_key_map = {
			\ 'name' : 'doomnvim',
			\ }


let g:which_key_map.f = {
			\ 'name' : '+file',
			\ 's' : 'Save file',
			\ 'S' : 'Save all',
			\ 'o' : 'Open file',
			\ 'r' : 'Rename file',
            \ 'e' : 'Open file explorer',
			\ }


let g:which_key_map.b = {
			\ 'name' : '+buffer',
			\ 'p' : 'Previous buffer',
			\ 'n' : 'Next buffer',
			\ 'k' : 'Kill buffer',
			\ 'l' : 'Last buffer',
			\ 't' : 'Open terminal',
			\ 'e' : 'Empty buffer',
			\ 'c' : 'Close all except focused',
			\ 'f' : 'Select buffer',
			\ 'R' : 'Rezise equally',
            \ 'r' : 'Rotate buffers',
			\ 's' : {
				\ 'name' : '+split',
				\ 'v' : 'Split vertically',
				\ 'h' : 'Split horizontally'
				\ },
			\ 'w' : {
				\ 'name' : '+width',
				\ 'i' : 'Increase width',
				\ 'd' : 'Decrease width',
				\ },
			\ 'h' : {
				\ 'name' : '+height',
				\ 'i' : 'Increase height',
				\ 'd' : 'Decrease height',
				\ },
			\ }


let g:which_key_map.c = {
			\ 'name' 	: '+code',
			\ 'd' 		: 'Goto definiton',
			\ 'i' 		: 'Goto implementation',
			\ 't' 		: 'Goto type definiton',
			\ 'r' 		: 'Goto reference',
			\ 's' 		: 'Format selected',
			\ 'I' 		: 'Indent file',
			\ 'f' 		: 'Format file',
			\ 'D' 		: 'Show documentation',
			\ 'c' 		: 'Toggle comment',
            \ 'C'       : 'Column edition',
			\ }


let g:which_key_map.g = {
			\ 'name' : '+git',
			\ 'g' : 'GitGutterToggle',
			\ 'h' : {
				\ 'name' : '+hunk',
				\ 'p' : 'Previous hunk',
				\ 'n' : 'Next hunk',
				\ 's' : 'Stage hunk',
				\ 'u' : 'Undo hunk',
				\ 'P' : 'Preview hunk',
				\ } ,
			\ 's' : 'Status',
			\ 'c' : {
				\ 'name' : '+create',
				\ 'c' : 'Create commit',
				\ 'p' : 'Create pull request',
				\ 'i' : 'Create issue',
				\ 'b' : 'Create branch',
				\ },
			\ 'C' : 'Checkout',
			\ }


let g:which_key_map.h = {
			\ 'name' : '+help',
			\ 'h' : 'doomnvim help',
			\ 'i' : 'doomnvim info',
			\ 'u' : 'doomnvim update',
			\ 'X' : 'doomnvim uninstall',
			\ }


let g:which_key_map.q = {
			\ 'name' : '+quit',
			\ 'q' : 'Quit',
			\ 'Q' : 'Quit all',
			\ }


let g:which_key_map.s = {
			\ 'name' : '+search',
			\ }


let g:which_key_map.t = {
			\ 'name' : '+toggle',
			\ 'l' : 'Line number',
			\ 'w' : 'Word wrap',
			\ 'h' : 'Toggle highlights',
			\ 'e' : 'Toggle errors',
			\ 't' : 'Toggle tagbar',
			\ 'f' : 'Toggle floating terminal',
			\ }



let g:which_key_map.w = {
			\ 'name' : '+window',
			\ 'h' : 'Focus left',
			\ 'j' : 'Focus down',
			\ 'k' : 'Focus up',
			\ 'l' : 'Focus right',
			\ 't' : 'Toggle vertical/horizontal layout',
            \ 'N' : 'New window',
            \ 'n' : 'Next window',
            \ 'p' : 'Previous window',
            \ 'c' : 'Close window',
			\ }


let g:which_key_map.p = {
			\ 'name' : '+plugin',
			\ 'u' : 'Update plugins',
			\ 'i' : 'Install plugins',
			\ 'c' : 'Clean plugins',
			\ 'm' : 'Upgrade plugin manager',
			\ 'r' : 'Update Remote Plugins',
			\ 'a' : {
				\ 'name' : '+autocompleter',
				\ 'u' : 'Update',
				\ 's' : 'Sync Update',
				\ 'r' : 'Restart',
				\ },
			\ }

let g:which_key_map.m = {
			\ 'name' : '+misc',
			\ 's' : 'Start menu',
            \ 'S' : 'Source file',
            \ 'c' : 'Change colorscheme',
            \ 'f' : 'Open FZF',
            \ 'W' : 'Save workspace',
			\ }
