"============================================
" init
" Author: Pierre-Yves Douault
" License: MIT
"============================================

call doomnvim#begin()
call plug#begin('~/.doomnvim/plugged')

Plug 'tamton-aquib/staline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'bryanmylee/vim-colorscheme-icons'
Plug 'glepnir/dashboard-nvim'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'liuchengxu/vim-which-key'
Plug 'voldikss/vim-floaterm'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
"==============================================================================
" CUSTOM PLUGINS








"==============================================================================

call doomnvim#functions#disable_plug()
call plug#end()
"Temp functions
call doomnvim#end()
set termguicolors
" Source lua configurations
if g:doomnvim_nightly ==# 1
    set termguicolors
    call doomnvim#functions#sourceDirectory(g:doomnvim_root.'config/lua')
endif
