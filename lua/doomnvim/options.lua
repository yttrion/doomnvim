------------------------------------------------------
-- Default doomnvim options
-- Author: Pierre-Yves Douault
-- License: MIT
------------------------------------------------------

-- Alias definition
local opt = vim.opt
local o = vim.o
local g = vim.g

-- Options -----------------------------------------------------------------{{{

-- vim.opt
opt.wildmenu = true

opt.smartindent = true
opt.smarttab = true
opt.autoindent = true

opt.splitbelow = true
opt.splitright = true

opt.undofile = true
opt.autoread = true

opt.laststatus = 3
opt.showmode = true
opt.cursorline = false
opt.hlsearch = true
opt.cmdheight = 1
opt.signcolumn = "auto"

opt.mouse = "a"
opt.encoding = "utf-8"
opt.clipboard = "unnamedplus"
opt.timeoutlen = 400
opt.updatetime = 400
opt.shortmess:append("atc")
opt.shortmess:append("s")

opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.conceallevel = 1

-- vim.o
o.noswapfile = true


-- vim.g
g.doomnvim_autocomp = 1

-- not done
-- filetype plugin indent on
-- syntax on
-- set colorcolumn=80
-- set nu rnu
-- set backspace="indent,eol,start"
-- set expandtab 1

-- }}}
