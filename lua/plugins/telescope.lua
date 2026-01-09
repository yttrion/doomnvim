require('telescope').setup{}

local map = vim.keymap.set

map("", "<leader>xh", ":Telescope command_history<CR>",                         { silent = true, desc = "Show command history" })
map("", "<leader>bl", ":Telescope buffers<CR>",                                 { silent=true, desc="Buffer List" })
map("", "<leader>cs", ":Telescope spell_suggest<CR>",                           { silent=true, desc="Code Spell suggest" })
map("", "<leader>ff", ":Telescope find_files<CR>",                              { silent=true, desc="Find File" })
map("", "<leader>gs", ":Telescope git_status<CR>",                              { silent=true, desc="Git Status" })
map("", "<leader>gb", ":Telescope git_branch<CR>",                              { silent=true, desc="Git Branch" })
map("", "<leader>gc", ":Telescope git_commit<CR>",                              { silent=true, desc="Git Commit" })
map("", "<leader>ht", ":Telescope help_tags<CR>",                               { silent=true, desc="Help Tags" })
map("", "<leader>hk", ":Telescope keymaps<CR>",                                 { silent = true, desc = "Help Keymaps" })
map("", "<leader>sw", ":Telescope live_grep<CR>",                               { silent=true, desc="Search Word" })

