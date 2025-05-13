------------------------------------------------------
-- Exhaustive keymap configuration
-- Author: Pierre-Yves Douault
-- License: MIT
------------------------------------------------------
-- Note: No plugins maps here, only vanilla & doomnvim functions

-- doomnvim functions calls
--      doomnvim#functions#resizeWin()
--      doomnvim#functions#update()
--      doomnvim#functions#uninstall()
--      doomnvim#functions#quitDoom()
--      doomnvim#functions#toggleConceal()
--      doomnvim#functions#toggleLayout()
--

local map = vim.keymap.set
-- map( mode, input, command, { desc = "description" } )

-- Buffer operation --------------------------------------------------------{{{
map("", "<leader>bp", ":bp<CR>", { desc = "Buffer Previous" })
map("", "<leader>bn", ":bn<CR>", { desc = "Buffer Next" })
map("", "<leader>bu", ":bunload<CR>", { desc = "Buffer Unload" })
map("", "<leader>bk", ":q!<CR>", { desc = "Buffer Kill" })
map("", "<leader>be", ":enew<CR>", { desc = "Buffer Empty" })
map("", "<leader>bc", "<C-u>up<bar>%bd<bar>e#<CR>", { desc = "Buffer Close burried" })
map("", "<leader>br", "<C-w>=<CR>", { desc = "Buffer Resize equally" })
map("", "<leader>bsv", ":vsp<CR>", { desc = "Buffer Split Vertical" })
map("", "<leader>bsh", ":sp<CR>", { desc = "Buffer Split Horizontal" })
map("", "<leader>bmh", "<C-w>H", { desc = "Buffer Move to left" })
map("", "<leader>bmj", "<C-w>J", { desc = "Buffer Move to up" })
map("", "<leader>bmk", "<C-w>K", { desc = "Buffer Move to down" })
map("", "<leader>bml", "<C-w>L", { desc = "Buffer Move to right" })
--map("", "<leader>bwi", ":call doomnvim#functions#resizeWin(1,1)<CR>", { desc = "Buffer Width Increase" })
--map("", "<leader>bwd", ":call doomnvim#functions#resizeWin(1,0)<CR>", { desc = "Buffer Width Decrease" })
--map("", "<leader>bhi", ":call doomnvim#functions#resizeWin(0,1)<CR>", { desc = "Buffer Height Increase" })
--map("", "<leader>bhd", ":call doomnvim#functions#resizeWin(0,0)<CR>", { desc = "Buffer Height Decrease" })
--}}}

-- Code operation ----------------------------------------------------------{{{
map("", "<leader>ci", "gg=G", { desc = "Code Indent" })
map("", "<leader>cv", "<C-v>", { desc = "Code Vertical edit" })
--}}}

-- File operation ----------------------------------------------------------{{{
map("", "<leader>fs", ":w!<CR>", { desc = "File Save" })
map("", "<leader>fS", ":wa!<CR>", { desc = "FileS Save" })
--}}}

-- Help --------------------------------------------------------------------{{{
map("", "<leader>hh", ":helpgrep .<CR>", { desc = "Help" })
-- this function is a remnant. It uses old viml function definition
-- need to know how to implement same behaviour with lua
--map("", "hu", ":call doomnvim#functions#update()<CR>", { desc = "Help Update" })
--map("", "hX", ":call doomnvim#functions#uninstall()<CR>", { desc = "Help Uninstall DoomNVIM" })
--}}}

-- Plugin ------------------------------------------------------------------{{{
map("", "<leader>pu", ":Lazy update<CR>", { desc = "Plugins Update" })
map("", "<leader>pc", ":Lazy clean<CR>", { desc = "Plugins Clean unused" })
map("", "<leader>ph", ":Lazy help<CR>", { desc = "Plugins Help" })
map("", "<leader>pmh", ":Lazy health<CR>", { desc = "Plugins Manager Health status" })
--}}}

-- Quit --------------------------------------------------------------------{{{
-- this function is a remnant. It uses old viml function definition
-- need to know how to implement same behaviour with lua
-- not even sure why I put two versions to quit doomnvim
--map("", "<leader>qq", ":call doomnvim#functions#quitDoom(0,0)<CR>", { desc = "Quit doomnvim" })
--map("", "<leader>qQ", ":call doomnvim#functions#quitDoom(1,1)<CR>", { desc = "Quit all doomnvim" })
--}}}

-- Search ------------------------------------------------------------------{{{
--}}}

-- Toggle ------------------------------------------------------------------{{{
map("", "<leader>tn", ":set invnumber<bar>set invrelativenumber<CR>", { desc = "Toggle line Numbers display" }) 
map("", "<leader>tw", ":set wrap!<CR>", { desc = "Toggle Wrap" }) 
map("", "<leader>th", ":noh<CR>", { desc = "Toggle Highlights display" }) 
map("", "<leader>te", ":hi Error NONE<CR>", { desc = "Toggle Error display" }) 
--map("", "<leader>tc", ":call doomnvim#functions#toggleConceal()<CR>", { desc = "Toggle Conceallevel" }) 
map("", "<leader>ts", ":set spell!<CR>", { desc = "Toggle Spelling display" }) 
--}}}

-- Window ------------------------------------------------------------------{{{
--map("", "<leader>wt", ":call doomnvim#functions#toggleLayout()", { desc = "Window Toggle layout" }) 
map("", "<leader>wn", ":tabnew<CR>", { desc = "Window open New" }) 
map("", "<leader>wl", ":tabnext<CR>", { desc = "Window next" }) 
map("", "<leader>wh", ":tabprevious<CR>", { desc = "Window previous" }) 
map("", "<leader>wc", ":tabclose", { desc = "Window Close" }) 
--}}}

-- Misc --------------------------------------------------------------------{{{
map("", "<leader>ms", ":source %<CR>", { desc = "Misc - Source file" }) 
map("", "<leader>mh", ":checkhealth<CR>", { desc = "Misc - Health status" }) 
map("", "<leader><leader>h", "<C-w>h", { desc = "Move left" }) 
map("", "<leader><leader>j", "<C-w>j", { desc = "Move down" }) 
map("", "<leader><leader>k", "<C-w>k", { desc = "Move up" }) 
map("", "<leader><leader>l", "<C-w>l", { desc = "Move right" }) 

--}}}

