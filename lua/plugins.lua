------------------------------------------------------
-- Default doomnvim plugin configuration 
-- Author: Pierre-Yves Douault
-- License: MIT
------------------------------------------------------
-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- GUI
        { "akinsho/bufferline.nvim", event="VeryLazy", version = "*", dependencies={ "nvim-tree/nvim-web-devicons" }},
        { "folke/noice.nvim", event="VeryLazy", dependencies={ "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" }},
        { "lukas-reineke/indent-blankline.nvim", main="ibl" },
        { "nvim-lualine/lualine.nvim", lazy=true, dependencies={ "nvim-tree/nvim-web-devicons" }},
        { "nvimdev/dashboard-nvim", event="VimEnter", dependencies={ "nvim-tree/nvim-web-devicons" }},
        { "sphamba/smear-cursor.nvim", opts={}},
        { "utilyre/barbecue.nvim", dependencies={ "SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons" }, opts={}},

        -- Tools
        { "dstein64/vim-startuptime", cmd="StartupTime" },
        { "folke/which-key.nvim", lazy=true, dependencies={ "nvim-tree/nvim-web-devicons" }},
        { "m4xshen/smartcolumn.nvim", lazy=true },
        { "nvim-telescope/telescope.nvim", lazy=true, dependencies={ "nvim-lua/plenary.nvim" }},
        { "nvim-tree/nvim-tree.lua", lazy=true, dependencies={ "nvim-tree/nvim-web-devicons" }},
        { "voldikss/vim-floaterm", lazy=false },

        -- Utils
        { "Zeioth/distroupgrade.nvim", event="VeryLazy", dependencies={ "nvim-lua/plenary.nvim" }, opts={}},
        { "kevinhwang91/nvim-hlslens", event="VeryLazy" },
        { "lewis6991/gitsigns.nvim", event="VeryLazy" },
        { "m4xshen/autoclose.nvim", event="VeryLazy" },

        -- Colors
        { "alexvzyl/nordic.nvim", lazy=true },
        { "catppuccin/nvim", lazy=true },
        { "folke/tokyonight.nvim", lazy=true },
        { "gregsexton/atom", lazy=true },
        { "john2x/flatui.vim", lazy=true },
        { "maxmx03/fluoromachine.nvim", lazy=true },
        { "rakr/vim-one", lazy=true },
        { "rebelot/kanagawa.nvim", lazy=true },
        { "sainnhe/gruvbox-material", lazy=true },
        { "sainnhe/sonokai", lazy=true },
        { "thedenisnikulin/vim-cyberpunk", lazy=true },
        { "zaldih/themery.nvim", lazy=true },

        -- -- Linting/LSP/Completion
        { "mason-org/mason-lspconfig.nvim" },
        { "mason-org/mason.nvim", lazy=true },
        { "neovim/nvim-lspconfig" },
        { "saghen/blink.cmp", dependencies={ "rafamadriz/friendly-snippets", "xzbdmw/colorful-menu.nvim" }},

    },
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})

-- Call plugins configuration
require("plugins.lualine")
require("plugins.dashboard")

require("plugins.themery")

require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.misc")

require("plugins.mason")
require("plugins.blink")
