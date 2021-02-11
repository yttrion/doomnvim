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

"call doomnvim#functions#custplug()
call doomnvim#begin()
call doomnvim#functions#custplug()
"call plug#begin('~/.doomnvim/plugged')
"Plug 'neoclide/coc.nvim', {'branch':'release'}
"Plug 'ryanoasis/vim-devicons'
"Plug 'bryanmylee/vim-colorscheme-icons'
"Plug 'preservim/nerdtree'
"Plug 'liuchengxu/vim-which-key'
"Plug 'preservim/tagbar'
"Plug 'voldikss/vim-floaterm'
"Plug 'preservim/nerdcommenter'
"Plug 'airblade/vim-gitgutter'
"Plug 'glepnir/dashboard-nvim'
"Plug 'liuchengxu/vim-clap'
"Plug 'glepnir/spaceline.vim'
"Plug 'Yggdroot/indentLine'
"Plug 'TaDaa/vimade'
"Plug 'lervag/vimtex'
"Plug 'xuhdev/vim-latex-live-preview', { 'for' : 'tex' }
"Plug 'romgrk/doom-one.vim'
"
"if g:doomnvim_nightly ==# 1
"    Plug 'kyazdani42/nvim-web-devicons'
"    Plug 'akinsho/nvim-bufferline.lua'
"elseif g:doomnvim_nightly ==# 0
"    Plug 'itchyny/lightline.vim'
"endif

call doomnvim#functions#disable_plug()
"call doomnvim#functions#enable_plug

call plug#end()

call doomnvim#end()

if g:doomnvim_nightly ==# 1
    set termguicolors
    lua require'bufferline'.setup{}
endif
