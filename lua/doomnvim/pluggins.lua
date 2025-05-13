------------------------------------------------------
-- Default doomnvim plugin configuration 
-- Author: Pierre-Yves Douault
-- License: MIT
------------------------------------------------------
-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- GUI
        { "nvim-tree/nvim-web-devicons", lazy = true }

        -- Tools
        { "folke/which-key.nvim", lazy=true },
    },
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
