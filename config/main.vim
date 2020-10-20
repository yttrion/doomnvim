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




if has('nvim')
	set termguicolors
endif


source $HOME/.doomnvim/config/globals.vim
source $HOME/.doomnvim/config/options.vim
source $HOME/.doomnvim/config/functions.vim
source $HOME/.doomnvim/config/plugins/startify.vim
source $HOME/.doomnvim/config/plugins/workspace.vim
source $HOME/.doomnvim/config/plugins/nerdtree.vim
source $HOME/.doomnvim/config/plugins/tagbar.vim
source $HOME/.doomnvim/config/plugins/keymap.vim
source $HOME/.doomnvim/config/plugins/vimplug.vim



