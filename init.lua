-------------------------------------------------------------
-- init.vim
-- Author: Pierre-Yves Douault
-- License: MIT
-------------------------------------------------------------

-- Globals
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        {
            "folke/which-key.nvim",
            event = "VeryLazy",
            keys = {
              {
                "<leader>?",
                function()
                  require("which-key").show({ global = true })
                end,
                desc = "Buffer Local Keymaps (which-key)",
              },
            },
        },

        { "nvim-tree/nvim-web-devicons", opts = {} }
    },
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
require("doomnvim.mappings")
