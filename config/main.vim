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
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/doom-one.vim'
Plug 'bryanmylee/vim-colorscheme-icons'
Plug 'glepnir/dashboard-nvim'
Plug 'Yggdroot/indentLine'
Plug 'TaDaa/vimade'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'liuchengxu/vim-which-key'
Plug 'liuchengxu/vista.vim'
Plug 'voldikss/vim-floaterm'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for' : 'tex' }
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neoclide/coc.nvim', {'branch':'release'}



call doomnvim#functions#disable_plug()
call plug#end()
"Temp functions
call doomnvim#end()

" Source lua configurations
if g:doomnvim_nightly ==# 1
    set termguicolors
    execute 'source' g:doomnvim_root.'config/luaConfig.vim'
endif
