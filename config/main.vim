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
	exe 'set encoding=utf-8'
endif

call doomnvim#begin()
call plug#begin('~/.doomnvim/plugged')
Plug 'tamton-aquib/staline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'bryanmylee/vim-colorscheme-icons'
Plug 'glepnir/dashboard-nvim'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'liuchengxu/vim-which-key'
Plug 'preservim/tagbar' 
Plug 'voldikss/vim-floaterm'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for' : 'tex' }
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'AlessandroYorba/Alduin'
Plug 'ajmwagar/vim-deus'
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'
Plug 'tomasr/molokai'
Plug 'dracula/vim'
Plug 'arcticicestudio/nord-vim'
Plug 'kaicataldo/material.vim'
Plug 'rakr/vim-one'
Plug 'rafamadriz/neon'
Plug 'onsails/lspkind-nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
"==============================================================================
" CUSTOM PLUGINS








"==============================================================================

call doomnvim#functions#disable_plug()
call plug#end()
"Temp functions
call doomnvim#end()

" Source lua configurations
if g:doomnvim_nightly ==# 1
    set termguicolors
    execute 'source' g:doomnvim_root.'config/lua/bufferline.vim'
    execute 'source' g:doomnvim_root.'config/lua/statusline.vim'
endif
