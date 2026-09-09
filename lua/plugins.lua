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
        { "tadaa/vimade", opts = { recipe = {"default", {animate = true}}, fadelevel = 0.4, }},
        { "utilyre/barbecue.nvim", dependencies={ "SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons" }, opts={}},

        -- Tools
        { "dstein64/vim-startuptime", cmd="StartupTime" },
        { "folke/which-key.nvim", lazy=true, dependencies={ "nvim-tree/nvim-web-devicons" }},
        { "m4xshen/smartcolumn.nvim", lazy=true },
        { "nvim-telescope/telescope.nvim", lazy=true, dependencies={ "nvim-lua/plenary.nvim" }},
        { "nvim-tree/nvim-tree.lua", lazy=true, dependencies={ "nvim-tree/nvim-web-devicons" }},
        { "voldikss/vim-floaterm", lazy=false },
        { "smoka7/hop.nvim", version = "*", opts = { keys = 'etovxqpdygfblzhckisuran' }},

        -- Utils
        { "Zeioth/distroupgrade.nvim", event="VeryLazy", dependencies={ "nvim-lua/plenary.nvim" }, opts={}},
        { "kevinhwang91/nvim-hlslens", event="VeryLazy" },
        { "lewis6991/gitsigns.nvim", event="VeryLazy" },
        { "m4xshen/autoclose.nvim", event="VeryLazy" },
        { "isakbm/gitgraph.nvim", lazy=true },
        { "sindrets/diffview.nvim", lazy=false },

        -- Colors
        { "alexvzyl/nordic.nvim", lazy=true },
        { "catppuccin/nvim", lazy=true },
        { "folke/tokyonight.nvim", lazy=true },
        { "joshdick/onedark.vim", lazy=true },
        { "kaicataldo/material.vim", lazy=true },
        { "liuchengxu/space-vim-dark", lazy=true },
        { "ntbbloodbath/doom-one.nvim", lazy=true },
        { "rakr/vim-one", lazy=true },
        { "sainnhe/gruvbox-material", lazy=true },
        { "sainnhe/sonokai", lazy=true },
        { "thedenisnikulin/vim-cyberpunk", lazy=true },
        { "zaldih/themery.nvim", lazy=true },

        -- Linting/LSP/Completion
        { "saghen/blink.cmp", branch='v1', dependencies={ "rafamadriz/friendly-snippets", "xzbdmw/colorful-menu.nvim" }},
        { "Saghen/blink.compat", lazy=true },

    },
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true }, -- works for docker image
})

-- Call plugins configuration
require("plugins.lualine")
require("plugins.dashboard")

require("plugins.themery")

require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.misc")

require("plugins.blink")
