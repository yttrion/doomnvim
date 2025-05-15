-------------------------------------------------------------
-- init.lua
-- Author: Pierre-Yves Douault
-- License: MIT
-------------------------------------------------------------

-- Alias definition
local opt = vim.opt
local o = vim.o
local g = vim.g

-- vim.g
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.doomnvim_version = "2.0.0a"

-- vim.opt
opt.shortmess:append "sI"

-- vim.o
o.wildmenu = true

o.smartindent = true
o.smarttab = true
o.autoindent = true

o.splitbelow = true
o.splitright = true

o.undofile = true
o.autoread = true

o.laststatus = 3
o.showmode = true
o.cursorline = false
o.hlsearch = true
o.cmdheight = 1
o.signcolumn = "auto"

o.mouse = "a"
o.encoding = "utf-8"
o.clipboard = "unnamedplus"
o.timeoutlen = 400
o.updatetime = 400

o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.conceallevel = 1

o.numbers = true
o.relativenumbers = true


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Install lazy.nvim if not present
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


require("plugins")
require("doomnvim.mappings")

vim.g.settermguicolors = true
vim.cmd [[ colorscheme nordic ]]

