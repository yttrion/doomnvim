"===========================================================
" Dictionnary 
" Author: Pierre-Yves Douault
" License: MIT
"===========================================================


let g:which_key_map = {
            \ 'name' : 'doomnvim',
            \ }

let g:which_key_map[' '] = {
            \ 'name' : '+focus',
            \ 'h' : 'Left',
            \ 'j' : 'Down',
            \ 'k' : 'Up',
            \ 'l' : 'Right',
            \ }

let g:which_key_map.b = {
            \ 'name' : '+buffer',
            \ 'p' : 'Previous buffer',
            \ 'n' : 'Next buffer',
            \ 'q' : 'Quit buffer',
            \ 'k' : 'Kill buffer',
            \ 'e' : 'Empty buffer',
            \ 'c' : 'Close all buried',
            \ 'f' : 'Focus buffer',
            \ 'r' : 'Resize equaly',
            \ 't' : 'Buffered terminal',
            \ 'l' : 'Buffer list',
            \ 's' : {
                \ 'name' : '+split',
                \ 'v' : 'vertical',
                \ 'h' : 'horizontal',
                \ },
            \ 'm' : {
                \ 'name' : '+move',
                \ 'h' : 'Left',
                \ 'j' : 'Down',
                \ 'k' : 'Up',
                \ 'l' : 'Right',
                \ },
            \ 'w' : {
                \ 'name' : '+width',
                \ 'i' : 'increase',
                \ 'd' : 'decrease',
                \ },
            \ 'h' : {
                \ 'name' : '+height',
                \ 'i' : 'increase',
                \ 'd' : 'decrease',
                \ },
            \ }

let g:which_key_map.c = {
            \ 'name' : '+code',
            \ 'd' : 'Show documentation',
            \ 'i' : 'Indent file',
            \ 'c' : 'Comment line',
            \ 'v' : 'Vertical edit',
            \ 'f' : 'Format selected',
            \ 'r' : 'Rename symbol',
            \ 't' : 'Help tags',
            \ }

let g:which_key_map.f = {
            \ 'name' : '+file',
            \ 's' : 'Save file',
            \ 'S' : 'Save all',
            \ 'e' : 'File explorer',
            \ 'o' : 'Open file',
            \ 'r' : 'Rename file',
            \ 'f' : 'Find file',
            \ 'n' : 'New file',
            \ }

let g:which_key_map.g = {
            \ 'name' : '+git',
            \ 'g' : 'Enable git symbols',
            \ 's' : 'Git status',
            \ 'C' : 'Checkout',
            \ 'c' : 'Create commit',
            \ 'h' : {
                \ 'name' : '+hunk',
                \ 'p' : 'Previous hunk',
                \ 'n' : 'Next hunk',
                \ 's' : 'Stage hunk',
                \ 'u' : 'Undo hunk',
                \ 'P' : 'Preview hunk',
                \ },
            \ }

let g:which_key_map.h = {
            \ 'name' : '+help',
            \ 'i' : 'Installer help',
            \ 'h' : 'Show help',
            \ 'u' : 'Update',
            \ 'X' : 'Uninstall',
            \ }

let g:which_key_map.p = {
            \ 'name' : '+plugins',
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


let g:which_key_map.q = {
            \ 'name' : '+quit/session',
            \ 'q' : 'Quit',
            \ 'Q' : 'Quit all',
            \ 'l' : 'Load session',
            \ 's' : 'Save session'
            \ }



let g:which_key_map.s = {
            \ 'name' : '+search',
            \ 'h' : 'Search History',
            \ 'f' : 'Search File',
            \ 'w' : 'Search word',
            \ }


let g:which_key_map.t = {
            \ 'name' : '+toggle',
            \ 'l' : 'Line number',
            \ 'w' : 'Word wrap',
            \ 'h' : 'Toggle highlights',
            \ 'e' : 'Toggle errors',
            \ 't' : 'Toggle tag bar',
            \ 'f' : 'Toggle floating terminal',
            \ 'c' : 'Toggle conceal',
            \ 's' : 'Toggle spellcheck',
            \ }


let g:which_key_map.w = {
            \ 'name' : '+window',
            \ 't' : 'Toggle layout',
            \ 'N' : 'New window',
            \ 'n' : 'Next window',
            \ 'p' : 'Previous window',
            \ 'c' : 'Close window',
            \ 'r' : 'Rotate windows',
            \ }


let g:which_key_map.m = {
            \ 'name' : '+misc',
            \ 'S' : 'Source file',
            \ 'c' : 'Change colorscheme',
            \ 'j' : 'JumpMark',
            \ 'f' : 'Open FZF',
            \ 'h' : 'Check doomnvim health',
            \ }
