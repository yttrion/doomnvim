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
local wk = require("which-key")

-- Buffer operation --------------------------------------------------------{{{
wk.add({ { "<leader>b", group = "buffer" } })
wk.add({ { "<leader>bs", group = "split" } })
wk.add({ { "<leader>bm", group = "move" } })
map("", "<leader>bp", ":bp<CR>",                                                { silent = true, desc = "Buffer Previous" })
map("", "<leader>bn", ":bn<CR>",                                                { silent = true, desc = "Buffer Next" })
map("", "<leader>bu", ":bunload<CR>",                                           { silent = true, desc = "Buffer Unload" })
map("", "<leader>bk", ":q!<CR>",                                                { silent = true, desc = "Buffer Kill" })
map("", "<leader>be", ":enew<CR>",                                              { silent = true, desc = "Buffer Empty" })
map("", "<leader>bc", ":<C-u>up<bar>%bd<bar>e#<CR>",                            { silent = true, desc = "Buffer Close burried" })
map("", "<leader>br", "<C-w>=<CR>",                                             { silent = true, desc = "Buffer Resize equally" })
map("", "<leader>bsv", ":vsp<CR>",                                              { silent = true, desc = "Buffer Split Vertical" })
map("", "<leader>bsh", ":sp<CR>",                                               { silent = true, desc = "Buffer Split Horizontal" })
map("", "<leader>bmh", "<C-w>H",                                                { silent = true, desc = "Buffer Move to left" })
map("", "<leader>bmj", "<C-w>J",                                                { silent = true, desc = "Buffer Move to up" })
map("", "<leader>bmk", "<C-w>K",                                                { silent = true, desc = "Buffer Move to down" })
map("", "<leader>bml", "<C-w>L",                                                { silent = true, desc = "Buffer Move to right" })
--map("", "<leader>bwi", ":call doomnvim#functions#resizeWin(1,1)<CR>",           { silent = true, desc = "Buffer Width Increase" })
--map("", "<leader>bwd", ":call doomnvim#functions#resizeWin(1,0)<CR>",           { silent = true, desc = "Buffer Width Decrease" })
--map("", "<leader>bhi", ":call doomnvim#functions#resizeWin(0,1)<CR>",           { silent = true, desc = "Buffer Height Increase" })
--map("", "<leader>bhd", ":call doomnvim#functions#resizeWin(0,0)<CR>",           { silent = true, desc = "Buffer Height Decrease" })
--}}}

-- Code operation ----------------------------------------------------------{{{
wk.add({ { "<leader>c", group = "code" } })
map("", "<leader>ci", "gg=G",                                                   { silent = true, desc = "Code Indent" })
map("", "<leader>cv", "<C-v>",                                                  { silent = true, desc = "Code Vertical edit" })
--}}}

-- File operation ----------------------------------------------------------{{{
wk.add({ { "<leader>f", group = "file" } })
map("", "<leader>fs", ":w!<CR>",                                                { silent = true, desc = "File Save" })
map("", "<leader>fS", ":wa!<CR>",                                               { silent = true, desc = "FileS Save" })
--}}}

-- Help --------------------------------------------------------------------{{{
wk.add({ { "<leader>h", group = "help" } })
map("", "<leader>hh", ":helpgrep .<CR>",                                        { silent = true, desc = "Help" })
-- this function is a remnant. It uses old viml function definition
-- need to know how to implement same behaviour with lua
--map("", "hu", ":call doomnvim#functions#update()<CR>",                          { silent = true, desc = "Help Update" })
--map("", "hX", ":call doomnvim#functions#uninstall()<CR>",                       { silent = true, desc = "Help Uninstall DoomNVIM" })
--}}}

-- Git ---------------------------------------------------------------------{{{
wk.add({ { "<leader>g", group = "git" } })
--}}}

-- Plugin ------------------------------------------------------------------{{{
wk.add({ { "<leader>p", group = "plugin" } })
map("", "<leader>pi", ":Lazy install<CR>",                                      { silent = true, desc = "Plugins Install" })
map("", "<leader>pu", ":Lazy update<CR>",                                       { silent = true, desc = "Plugins Update" })
map("", "<leader>pc", ":Lazy clean<CR>",                                        { silent = true, desc = "Plugins Clean unused" })
map("", "<leader>ph", ":Lazy help<CR>",                                         { silent = true, desc = "Plugins Help" })
map("", "<leader>ps", ":Lazy health<CR>",                                      { silent = true, desc = "Plugin manager Status" })
--}}}

-- Quit --------------------------------------------------------------------{{{
wk.add({ { "<leader>q", group = "quit" } })
map("", "<leader>qq", ":qa!<CR>",                                               { silent = true, desc = "Quit doomnvim" })
-- this function is a remnant. It uses old viml function definition
-- need to know how to implement same behaviour with lua
-- not even sure why I put two versions to quit doomnvim
--map("", "<leader>qq", ":call doomnvim#functions#quitDoom(0,0)<CR>",             { silent = true, desc = "Quit doomnvim" })
--map("", "<leader>qQ", ":call doomnvim#functions#quitDoom(1,1)<CR>",             { silent = true, desc = "Quit all doomnvim" })
--}}}

-- Search ------------------------------------------------------------------{{{
wk.add({ { "<leader>s", group = "search" } })
--}}}

-- Toggle ------------------------------------------------------------------{{{
wk.add({ { "<leader>t", group = "toggle" } })
map("", "<leader>tn", ":set invnumber<bar>set invrelativenumber<CR>",           { silent = true, desc = "Toggle line Numbers display" })
map("", "<leader>tw", ":set wrap!<CR>",                                         { silent = true, desc = "Toggle Wrap" })
map("", "<leader>th", ":noh<CR>",                                               { silent = true, desc = "Toggle Highlights display" })
map("", "<leader>te", ":hi Error NONE<CR>",                                     { silent = true, desc = "Toggle Error display" })
--map("", "<leader>tc", ":call doomnvim#functions#toggleConceal()<CR>",           { silent = true, desc = "Toggle Conceallevel" }) 
map("", "<leader>ts", ":set spell!<CR>",                                        { silent = true, desc = "Toggle Spelling display" })
--}}}

-- Window ------------------------------------------------------------------{{{
wk.add({ { "<leader>w", group = "window" } })
--map("", "<leader>wt", ":call doomnvim#functions#toggleLayout()",                { silent = true, desc = "Window Toggle layout" }) 
map("", "<leader>wn", ":tabnew<CR>",                                            { silent = true, desc = "Window open New" })
map("", "<leader>wl", ":tabnext<CR>",                                           { silent = true, desc = "Window next" })
map("", "<leader>wh", ":tabprevious<CR>",                                       { silent = true, desc = "Window previous" })
map("", "<leader>wc", ":tabclose<CR>",                                          { silent = true, desc = "Window Close" })
--}}}

-- Commands ---{{{
wk.add({ { "<leader>x", group = "command" } })
--}}}

-- Misc --------------------------------------------------------------------{{{
wk.add({ { "<leader>m", group = "misc" } })
wk.add({ { "<leader><leader>", group = "focus" } })
map("", "<leader><leader>h", "<C-w>h",                                          { silent = true, desc = "Move left" })
map("", "<leader><leader>j", "<C-w>j",                                          { silent = true, desc = "Move down" })
map("", "<leader><leader>k", "<C-w>k",                                          { silent = true, desc = "Move up" })
map("", "<leader><leader>l", "<C-w>l",                                          { silent = true, desc = "Move right" })
map("", "<leader>mc", ":Themery<CR>",                                           { silent=true, desc="Misc - Colorscheme" })
map("", "<leader>mh", ":checkhealth<CR>",                                       { silent = true, desc = "Misc - Health status" })
map("", "<leader>ms", ":source %<CR>",                                          { silent = true, desc = "Misc - Source file" })
--}}}

