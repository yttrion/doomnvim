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
                  require("which-key").show({ global = false })
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
