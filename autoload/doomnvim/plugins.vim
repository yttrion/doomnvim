call plug#begin('~/doomnvim/plugged')

Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'bryanmylee/vim-colorscheme-icons'
Plug 'preservim/nerdtree'
Plug 'liuchengxu/vim-which-key'
Plug 'preservim/tagbar'
Plug 'voldikss/vim-floaterm'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'glepnir/dashboard-nvim'
Plug 'liuchengxu/vim-clap'
Plug 'glepnir/spaceline.vim'
Plug 'Yggdroot/indentLine'
Plug 'TaDaa/vimade'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for' : 'tex' }
Plug 'romgrk/doom-one.vim'
"Custom plugins

if g:doomnvim_nightly ==# 1
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'akinsho/nvim-bufferline.lua'
    " Next lines for neovim-only plugins
elseif g:doomnvim_nightly ==# 0
    Plug 'itchyny/lightline.vim'
endif



call doomnvim#functions#disable_plug()
call plug#end()
