------------------------------------------------------
-- Exhaustive keymap configuration
-- Author: Pierre-Yves Douault
-- License: MIT
------------------------------------------------------

local map = vim.keymap.set

-- map( mode, input, command, { desc = "description" } )

-- Buffer operation --------------------------------------------------------{{{

map("n", "bp", "bp<CR>", { desc = "Buffer Previous" })
map("n", "bn", "bn<CR>", { desc = "Buffer Next" })
map("n", "bu", "bunload<CR>", { desc = "Buffer Unload" })
map("n", "bq", "q!<CR>", { desc = "Buffer Quit" })
map("n", "be", "enew<CR>", { desc = "Buffer Empty" })
map("n", "bc", "<C-u>up<bar>%bd<bar>e#<CR>", { desc = "Buffer Close burried" })
map("n", "bt", "Telescope buffers<CR>", { desc = "Buffer Telescope" })
map("n", "br", "<C-w>=<CR>", { desc = "Buffer Resize equally" })
map("n", "bsv", "vsp<CR>", { desc = "Buffer Split Vertical" })
map("n", "bsh", "sp<CR>", { desc = "Buffer Split Horizontal" })
map("n", "bmh", "<C-w>H", { desc = "Buffer Move to left" })
map("n", "bmj", "<C-w>J", { desc = "Buffer Move to Up" })
map("n", "bmk", "<C-w>K", { desc = "Buffer Move to Down" })
map("n", "bml", "<C-w>L", { desc = "Buffer Move to Right" })

-- }}}
