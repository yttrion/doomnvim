local map = vim.keymap.set
local wk = require("which-key")

-- Requires
require("bufferline").setup()
require("smartcolumn").setup()

-- Util keymaps
map("", "<leader>hu", ":DistroUpdate<CR>",                                      { silent = true, desc = "Update doomnvim" })
map("", "<leader>tf", ":FloatermToggle<CR>",                                    { silent = true, desc = "Toggle Floating term" })
