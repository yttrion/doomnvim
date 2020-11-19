"============================================
" init
" Author: Pierre-Yves Douault
" License: MIT
"============================================

if empty(glob('~/.doomnvim/autoload/plug.vim'))
  	silent !curl -fLo ~/.doomnvim/autoload/plug.vim --create-dirs
    	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" On load
if has('vim_starting')
	" Force utf-8
	exe 'set encoding=utf-8'
endif


call doomnvim#begin()

call plug#begin('~/.doomnvim/plugged')
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'liuchengxu/vim-which-key'
Plug 'majutsushi/tagbar'
Plug 'thaerkh/vim-workspace'
Plug 'mhinz/vim-startify'
Plug 'voldikss/vim-floaterm'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'

if g:doomnvim_nightly ==# 1
    Plug 'akinsho/nvim-bufferline.lua'
endif

call plug#end()

call doomnvim#end()



