------------------------------------------------------
-- Default doomnvim plugin configuration 
-- Author: Pierre-Yves Douault
-- License: MIT
------------------------------------------------------
-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- GUI
        { "tamton-aquib/staline.nvim", lazy=true, dependencies={ "nvim-tree/nvim-web-devicons" }},
        { "akinsho/bufferline.nvim", event="VeryLazy", version = "*", dependencies={ "nvim-tree/nvim-web-devicons" }},
        { "nvimdev/dashboard-nvim", event="VimEnter", dependencies={ "nvim-tree/nvim-web-devicons" }},
        { "utilyre/barbecue.nvim", dependencies={ "SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons" }, opts={}},
        
        -- Tools
        { "folke/which-key.nvim", lazy=true, dependencies={ "nvim-tree/nvim-web-devicons" }},
        { "dstein64/vim-startuptime", cmd="StartupTime" },
        { "nvim-tree/nvim-tree.lua", lazy=true, dependencies={ "nvim-tree/nvim-web-devicons" }},
        { "nvim-telescope/telescope.nvim", lazy=true, dependencies={ "nvim-lua/plenary.nvim" }},
        { "m4xshen/smartcolumn.nvim", lazy=true },
        { "voldikss/vim-floaterm", lazy=false },

        -- Utils
        { "Zeioth/distroupgrade.nvim", event="VeryLazy", dependencies={ "nvim-lua/plenary.nvim" }, opts={}},
        { "m4xshen/autoclose.nvim", event="VeryLazy" },
        { "kevinhwang91/nvim-hlslens", event="VeryLazy" },

        -- Colors
        { "sainnhe/everforest", lazy=true },
        { "catppuccin/nvim", lazy=true },
        { "sainnhe/gruvbox-material", lazy=true },
        { "sainnhe/sonokai", lazy=true },
        { "alexvzyl/nordic.nvim", lazy=true },
        { "rakr/vim-one", lazy=true },

        -- -- Linting/LSP/Completion
        -- { "mason-org/mason.nvim" },
        -- { "mason-org/mason-lspconfig.nvim" },
        -- { "neovim/nvim-lspconfig" },

    },
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})

-- Call plugins configuration
require("plugins.staline")
require("plugins.dashboard")

require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.misc")



--require("plugins.mason")
