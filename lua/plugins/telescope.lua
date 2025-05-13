require('telescope').setup{}

local map = vim.keymap.set

map("", "<leader>bl", ":Telescope buffers<CR>",       { silent=true, desc="Buffer List" })
map("", "<leader>cs", ":Telescope spell_suggest<CR>", { silent=true, desc="Code Spell suggest" })
map("", "<leader>ff", ":Telescope find_files<CR>",    { silent=true, desc="Find File" })
wk.add({ { "<leader>g", group = "git" } })
map("", "<leader>gs", ":Telescope git_status<CR>",    { silent=true, desc="Git Status" })
map("", "<leader>gb", ":Telescope git_branch<CR>",    { silent=true, desc="Git Branch" })
map("", "<leader>gc", ":Telescope git_commit<CR>",    { silent=true, desc="Git Commit" })
map("", "<leader>ht", ":Telescope help_tags<CR>",     { silent=true, desc="Help Tags" })
map("", "<leader>sw", ":Telescope live_grep<CR>",     { silent=true, desc="Search Word" })
map("", "<leader>mc", ":Telescope colorscheme<CR>",   { silent=true, desc="Misc - Colorscheme" })

