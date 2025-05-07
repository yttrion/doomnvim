------------------------------------------------------
-- Exhaustive keymap configuration
-- Author: Pierre-Yves Douault
-- License: MIT
------------------------------------------------------

local map = vim.keymap.set

-- map( mode, input, command, { desc = "description" } )

-- Buffer operation --------------------------------------------------------{{{

map("", "<leader>bp", "bp<CR>", { desc = "Buffer Previous" })
map("", "<leader>bn", "bn<CR>", { desc = "Buffer Next" })
map("", "<leader>bu", "bunload<CR>", { desc = "Buffer Unload" })
map("", "<leader>bq", "q!<CR>", { desc = "Buffer Quit" })
map("", "<leader>be", "enew<CR>", { desc = "Buffer Empty" })
map("", "<leader>bc", "<C-u>up<bar>%bd<bar>e#<CR>", { desc = "Buffer Close burried" })
map("", "<leader>bt", "Telescope buffers<CR>", { desc = "Buffer Telescope" })
map("", "<leader>br", "<C-w>=<CR>", { desc = "Buffer Resize equally" })
map("", "<leader>bsv", "vsp<CR>", { desc = "Buffer Split Vertical" })
map("", "<leader>bsh", "sp<CR>", { desc = "Buffer Split Horizontal" })
map("", "<leader>bmh", "<C-w>H", { desc = "Buffer Move to left" })
map("", "<leader>bmj", "<C-w>J", { desc = "Buffer Move to Up" })
map("", "<leader>bmk", "<C-w>K", { desc = "Buffer Move to Down" })
map("", "<leader>bml", "<C-w>L", { desc = "Buffer Move to Right" })

-- }}}
