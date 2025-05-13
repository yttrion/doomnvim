------------------------------------------------------
-- Default doomnvim plugin configuration 
-- Author: Pierre-Yves Douault
-- License: MIT
------------------------------------------------------
-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- GUI
        { "nvim-lualine/lualine.nvim", lazy=true, dependencies = { 'nvim-tree/nvim-web-devicons' }},
        { "folke/noice.nvim", event="VeryLazy", dependencies={ "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } },
        
        -- Tools
        { "folke/which-key.nvim", lazy=true, dependencies = { 'nvim-tree/nvim-web-devicons' } },
        { "dstein64/vim-startuptime", cmd="StartupTime" },

    },
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
