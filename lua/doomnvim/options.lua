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

opt.laststatus = 2
opt.showmode = true
opt.cursorline = false
opt.hlsearch = true
opt.cmdheight = 1
opt.signcolumn = "auto"

opt.mouse = "a"
opt.laststatus = 2
opt.encoding = "utf-8"
opt.backspace = "indent,eol,start"
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

opt.number = true
opt.relativenumber = true


-- vim.o
o.noswapfile = true


-- vim.g
g.doomnvim_version = "2.0.0a"
g.doomnvim_autocomp = 1

-- not done
-- filetype plugin indent on
-- syntax on
-- set colorcolumn=80

-- }}}
