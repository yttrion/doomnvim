------------------------------------------------------
-- Exhaustive keymap configuration
-- Author: Pierre-Yves Douault
-- License: MIT
------------------------------------------------------
-- Note: No plugins maps here, only vanilla & doomnvim functions


local map = vim.keymap.set
-- map( mode, input, command, { desc = "description" } )

-- Buffer operation --------------------------------------------------------{{{
map("", "<leader>bp", ":bp<CR>", { desc = "Buffer Previous" })
map("", "<leader>bn", ":bn<CR>", { desc = "Buffer Next" })
map("", "<leader>bu", ":bunload<CR>", { desc = "Buffer Unload" })
map("", "<leader>bq", ":q!<CR>", { desc = "Buffer Quit" })
map("", "<leader>be", ":enew<CR>", { desc = "Buffer Empty" })
map("", "<leader>bc", "<C-u>up<bar>%bd<bar>e#<CR>", { desc = "Buffer Close burried" })
map("", "<leader>br", "<C-w>=<CR>", { desc = "Buffer Resize equally" })
map("", "<leader>bsv", ":vsp<CR>", { desc = "Buffer Split Vertical" })
map("", "<leader>bsh", ":sp<CR>", { desc = "Buffer Split Horizontal" })
map("", "<leader>bmh", "<C-w>H", { desc = "Buffer Move to left" })
map("", "<leader>bmj", "<C-w>J", { desc = "Buffer Move to up" })
map("", "<leader>bmk", "<C-w>K", { desc = "Buffer Move to down" })
map("", "<leader>bml", "<C-w>L", { desc = "Buffer Move to right" })
map("", "<leader>bwi", ":call resizeWin(1,1)<CR>", { desc = "Buffer Width Increase" })
map("", "<leader>bwd", ":call resizeWin(1,0)<CR>", { desc = "Buffer Width Decrease" })
map("", "<leader>bhi", ":call resizeWin(0,1)<CR>", { desc = "Buffer Height Increase" })
map("", "<leader>bhd", ":call resizeWin(0,0)<CR>", { desc = "Buffer Height Decrease" })
--}}}

-- Code operation ----------------------------------------------------------{{{
map("", "ci", "gg=G", { desc = "Code Indent" })
map("", "cv", "<C-v>", { desc = "Code Vertical edit" })
--}}}

-- File operation ----------------------------------------------------------{{{
map("", "fs", ":w!<CR>", { desc = "File Save" })
map("", "fS", ":wa!<CR>", { desc = "FileS Save" })
--}}

-- Help --------------------------------------------------------------------{{{
map("", "hh", ":helpgrep .<CR>", { desc = "Help" })
-- this function is a remnant. It uses old viml function definition
-- need to know how to implement same behaviour with lua
--map("", "hu", "doomnvim#functions#update()<CR>", { desc = "Help Update" })
--map("", "hX", "doomnvim#functions#uninstall()<CR>", { desc = "Help Uninstall DoomNVIM" })
-- }}}

-- Plugin ------------------------------------------------------------------{{{
map("", "pu", ":Lazy update<CR>", { desc = "Plugins Update" })
map("", "pc", ":Lazy clean<CR>", { desc = "Plugins Clean unused" })
map("", "ph", ":Lazy help<CR>", { desc = "Plugins Help" })
map("", "pmh", ":Lazy health<CR>", { desc = "Plugins Manager Health status" })
-- }}}
