"==========================================================
" vim-plug --- Configuration for vimplug
" Author: Pierre-Yves Douault
" License: MIT
"==========================================================



if empty(glob('~/.doomnvim/autoload/plug.vim'))
  silent !curl -fLo ~/.doomnvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


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
Plug 'Yggdroot/indentLine'


call plug#end()
