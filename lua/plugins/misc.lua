local map = vim.keymap.set
local wk = require("which-key")

-- Requires
require("bufferline").setup()
require("smartcolumn").setup()
require("themery").setup({
  themes = { themery.getAvailableThemes() }, -- Your list of installed colorschemes.
  livePreview = true, -- Apply theme while picking. Default to true.
})

-- Util keymaps
map("", "<leader>hu", ":DistroUpdate<CR>",                                      { silent = true, desc = "Update doomnvim" })
map("", "<leader>tt", ":FloatermNew --wintype=split<CR>",                       { silent = true, desc = "Toggle Floating term" })
map("", "<leader>tf", ":FloatermNew<CR>",                                    { silent = true, desc = "Toggle Floating term" })

