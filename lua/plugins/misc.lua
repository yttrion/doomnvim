local map = vim.keymap.set
local wk = require("which-key")

-- Requires
require("bufferline").setup()
require("smartcolumn").setup()
require("toggleterm").setup()



-- Util keymaps
map("", "<leader>hu", ":DistroUpdate<CR>",                                      { silent = true, desc = "Update doomnvim" }

