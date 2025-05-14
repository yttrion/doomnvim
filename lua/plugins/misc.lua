local map = vim.keymap.set
local wk = require("which-key")

-- Requires
require("bufferline").setup({
    options = {
        themable = true,
        separator_style = "slant",
    }
})
require("smartcolumn").setup({
    config = {
        disabled_filetypes = { "help", "text", "markdown", "Dashboard" }
    }
})

-- Util keymaps
map("", "<leader>hu", ":DistroUpdate<CR>",                                      { silent = true, desc = "Update doomnvim" })
map("", "<leader>tt", ":FloatermNew --wintype=split<CR>",                       { silent = true, desc = "Toggle Floating term" })
map("", "<leader>tf", ":FloatermNew<CR>",                                    { silent = true, desc = "Toggle Floating term" })
