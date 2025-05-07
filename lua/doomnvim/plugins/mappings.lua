------------------------------------------------------
-- Exhaustive keymap configuration
-- Author: Pierre-Yves Douault
-- License: MIT
------------------------------------------------------

local map = vim.keymap.set

-- map( mode, input, command, { desc = "description" } )

-- Buffer operation --------------------------------------------------------{{{

map("i", "bp", "bp<CR>", { desc = "Buffer Previous" })
map("i", "bn", "bn<CR>", { desc = "Buffer Next" })
map("i", "bu", "bunload<CR>", { desc = "Buffer Unload" })
map("i", "bq", "q!<CR>", { desc = "Buffer Quit" })
map("i", "be", "enew<CR>", { desc = "Buffer Empty" })
map("i", "bc", "<C-u>up<bar>%bd<bar>e#<CR>", { desc = "Buffer Close burried" })
map("i", "bt", "Telescope buffers<CR>", { desc = "Buffer Telescope" })
map("i", "br", "<C-w>=<CR>", { desc = "Buffer Resize equally" })
map("i", "bsv", "vsp<CR>", { desc = "Buffer Split Vertical" })
map("i", "bsh", "sp<CR>", { desc = "Buffer Split Horizontal" })
map("i", "bmh", "<C-w>H", { desc = "Buffer Move to left" })
map("i", "bmj", "<C-w>J", { desc = "Buffer Move to Up" })
map("i", "bmk", "<C-w>K", { desc = "Buffer Move to Down" })
map("i", "bml", "<C-w>L", { desc = "Buffer Move to Right" })

-- }}}
