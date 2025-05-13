------------------------------------------------------
-- Default doomnvim plugin configuration 
-- Author: Pierre-Yves Douault
-- License: MIT
------------------------------------------------------
-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- GUI
        { "nvim-tree/nvim-web-devicons", lazy = true },
        { "folke/noice.nvim", event="VeryLazy", dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } },
        
        -- Tools
        { "folke/which-key.nvim", lazy=true },
        { "dstein64/vim-startuptime", cmd="StartupTime" },
        { "hrsh7th/nvim-cmp", event = "InsertEnter", dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer" } }

    },
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
