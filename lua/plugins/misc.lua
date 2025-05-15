local map = vim.keymap.set
local wk = require("which-key")

-- Requires

-- nvim-hslens
require('hlslens').setup()
local kopts = {noremap = true, silent = true}


-- bufferline
require("bufferline").setup({
    options = {
        themable = true,
        separator_style = "slant",
    }
})

-- smartcolumn
require("smartcolumn").setup({
    disabled_filetypes = { "help", "text", "markdown", "dashboard", "NvimTree", "lazy", "checkhealth", "zsh"}
})

-- misc of misc
require("barbecue.ui").toggle(true)
require("autoclose").setup()
require('gitsigns').setup()
require("ibl").setup({
    exclude = { filetypes = { "dasboard", "help", "NvimTree", "lazy", "checkhealth" } },
})

-- Util keymaps
map("", "<leader>hu", ":DistroUpdate<CR>",                                      { silent = true, desc = "Update doomnvim" })
map("", "<leader>tt", ":FloatermNew --wintype=split<CR>",                       { silent = true, desc = "Toggle Floating term" })
map("", "<leader>tf", ":FloatermNew<CR>",                                       { silent = true, desc = "Toggle Floating term" })
