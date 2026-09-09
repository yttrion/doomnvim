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

-- < > - Move cursor -------------------------------------------------------{{{
wk.add({ { "<leader><leader>", group = "focus" } })

map("", "<leader><leader>h", "<C-w>h",                                          { silent = true, desc = "Move left" })
map("", "<leader><leader>j", "<C-w>j",                                          { silent = true, desc = "Move down" })
map("", "<leader><leader>k", "<C-w>k",                                          { silent = true, desc = "Move up" })
map("", "<leader><leader>l", "<C-w>l",                                          { silent = true, desc = "Move right" })
---}}}

-- b - Buffer operation ----------------------------------------------------{{{
wk.add({ { "<leader>b", group = "buffer" } })
wk.add({ { "<leader>bs", group = "split" } })
wk.add({ { "<leader>bm", group = "move" } })

map("", "<leader>bc", ":<C-u>up<bar>%bd<bar>e#<CR>",                            { silent = true, desc = "Buffer Close burried" })
map("", "<leader>be", ":enew<CR>",                                              { silent = true, desc = "Buffer Empty" })
map("", "<leader>bk", ":q!<CR>",                                                { silent = true, desc = "Buffer Kill" })
map("", "<leader>bl", ":Telescope buffers<CR>",                                 { silent=true, desc="Buffer List" })
map("", "<leader>bmh", "<C-w>H",                                                { silent = true, desc = "Buffer Move to left" })
map("", "<leader>bmj", "<C-w>J",                                                { silent = true, desc = "Buffer Move to up" })
map("", "<leader>bmk", "<C-w>K",                                                { silent = true, desc = "Buffer Move to down" })
map("", "<leader>bml", "<C-w>L",                                                { silent = true, desc = "Buffer Move to right" })
map("", "<leader>bn", ":bn<CR>",                                                { silent = true, desc = "Buffer Next" })
map("", "<leader>bp", ":bp<CR>",                                                { silent = true, desc = "Buffer Previous" })
map("", "<leader>br", "<C-w>=<CR>",                                             { silent = true, desc = "Buffer Resize equally" })
map("", "<leader>bsh", ":sp<CR>",                                               { silent = true, desc = "Buffer Split Horizontal" })
map("", "<leader>bsv", ":vsp<CR>",                                              { silent = true, desc = "Buffer Split Vertical" })
map("", "<leader>bu", ":bunload<CR>",                                           { silent = true, desc = "Buffer Unload" })
--}}}

-- c - Code operation ------------------------------------------------------{{{
wk.add({ { "<leader>c", group = "code" } })

map("", "<leader>ci", "gg=G",                                                   { silent = true, desc = "Code Indent" })
map("", "<leader>cv", "<C-v>",                                                  { silent = true, desc = "Code Vertical edit" })
map("", "<leader>cs", ":Telescope spell_suggest<CR>",                           { silent=true, desc="Code Spell suggest" })
--}}}

-- f - File operation ------------------------------------------------------{{{
wk.add({ { "<leader>f", group = "file" } })

map("", "<leader>fS", ":wa!<CR>",                                               { silent = true, desc = "FileS Save" })
map("", "<leader>fe", ":NvimTreeToggle<CR>",                                    { silent = true, desc = "File Explorer open" })
map("", "<leader>ff", ":Telescope find_files<CR>",                              { silent=true, desc="Find File" })
map("", "<leader>fs", ":w!<CR>",                                                { silent = true, desc = "File Save" })
--}}}

-- g - Git -----------------------------------------------------------------{{{
wk.add({ { "<leader>g", group = "git" } })

map("", "<leader>gb", ":Telescope git_branch<CR>",                              { silent=true, desc="Git Branch" })
map("", "<leader>gc", ":Telescope git_commit<CR>",                              { silent=true, desc="Git Commit" })
map("", "<leader>gd", ":DiffviewOpen<CR>",                                      { silent=true, desc= "Git Diff"})
map("", "<leader>gD", ":DiffviewOpen ",                                         { silent=true, desc= "Git Diff (interactive option)"})
map("", "<leader>gg", ":GitGraph<CR>",                                          { silent=true, desc="Git graph"})
map("", "<leader>gs", ":Telescope git_status<CR>",                              { silent=true, desc="Git Status" })

--}}}

-- h - Help ----------------------------------------------------------------{{{
wk.add({ { "<leader>h", group = "help" } })

map("", "<leader>hh", ":helpgrep .<CR>",                                        { silent = true, desc = "Help" })
map("", "<leader>hk", ":Telescope keymaps<CR>",                                 { silent = true, desc = "Help Keymaps" })
map("", "<leader>ht", ":Telescope help_tags<CR>",                               { silent=true, desc="Help Tags" })
map("", "<leader>hu", ":DistroUpdate<CR>",                                      { silent = true, desc = "Update doomnvim" })
--}}}

-- m - Misc ----------------------------------------------------------------{{{
wk.add({ { "<leader>m", group = "misc" } })

map("", "<leader>mc", ":Themery<CR>",                                           { silent=true, desc="Misc - Colorscheme" })
map("", "<leader>mh", ":checkhealth<CR>",                                       { silent = true, desc = "Misc - Health status" })
map("", "<leader>ms", ":source %<CR>",                                          { silent = true, desc = "Misc - Source file" })
--}}}

-- p - Plugin --------------------------------------------------------------{{{
wk.add({ { "<leader>p", group = "plugin" } })

map("", "<leader>pc", ":Lazy clean<CR>",                                        { silent = true, desc = "Plugins Clean unused" })
map("", "<leader>ph", ":Lazy help<CR>",                                         { silent = true, desc = "Plugins Help" })
map("", "<leader>pi", ":Lazy install<CR>",                                      { silent = true, desc = "Plugins Install" })
map("", "<leader>ps", ":Lazy health<CR>",                                       { silent = true, desc = "Plugin manager Status" })
map("", "<leader>pu", ":Lazy update<CR>",                                       { silent = true, desc = "Plugins Update" })
--}}}

-- q - Quit ----------------------------------------------------------------{{{
wk.add({ { "<leader>q", group = "quit" } })

map("", "<leader>qq", ":qa!<CR>",                                               { silent = true, desc = "Quit doomnvim" })
--}}}

-- s - Search --------------------------------------------------------------{{{
wk.add({ { "<leader>s", group = "search" } })

map("", "<leader>sf", ":HopWord<CR>",                                           { silent=true, desc="Hop to Word" })
map("", "<leader>sw", ":Telescope live_grep<CR>",                               { silent=true, desc="Search Word" })
--}}}

-- t - Toggle --------------------------------------------------------------{{{
wk.add({ { "<leader>t", group = "toggle" } })

map("", "<leader>te", ":hi Error NONE<CR>",                                     { silent = true, desc = "Toggle Error display" })
map("", "<leader>tf", ":FloatermNew<CR>",                                       { silent = true, desc = "Toggle Floating term" })
map("", "<leader>th", ":noh<CR>",                                               { silent = true, desc = "Toggle Highlights display" })
map("", "<leader>tn", ":set invnumber<bar>set invrelativenumber<CR>",           { silent = true, desc = "Toggle line Numbers display" })
map("", "<leader>ts", ":set spell!<CR>",                                        { silent = true, desc = "Toggle Spelling display" })
map("", "<leader>tt", ":FloatermNew --wintype=split<CR>",                       { silent = true, desc = "Toggle Terminal" })
map("", "<leader>tw", ":set wrap!<CR>",                                         { silent = true, desc = "Toggle Wrap" })
--}}}

-- w - Window --------------------------------------------------------------{{{
wk.add({ { "<leader>w", group = "window" } })

map("", "<leader>wc", ":tabclose<CR>",                                          { silent = true, desc = "Window Close" })
map("", "<leader>wh", ":tabprevious<CR>",                                       { silent = true, desc = "Window previous" })
map("", "<leader>wl", ":tabnext<CR>",                                           { silent = true, desc = "Window next" })
map("", "<leader>wn", ":tabnew<CR>",                                            { silent = true, desc = "Window open New" })
--}}}

-- Commands ----------------------------------------------------------------{{{
wk.add({ { "<leader>x", group = "command" } })

map("", "<leader>xh", ":Telescope command_history<CR>",                         { silent = true, desc = "Show command history" })
--}}}
