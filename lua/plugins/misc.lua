local map = vim.keymap.set
local wk = require("which-key")

-- Requires

-- nvim-hslens
require('hlslens').setup()
local kopts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)


-- bufferline
require("bufferline").setup({
    options = {
        themable = true,
        separator_style = "slant",
    }
})

-- smartcolumn
require("smartcolumn").setup({
    disabled_filetypes = { "help", "text", "markdown", "dashboard", "NvimTree", "lazy", "checkhealth", "zsh"}
})

-- misc of misc
require("barbecue.ui").toggle(true)
require("autoclose").setup()


-- Util keymaps
map("", "<leader>hu", ":DistroUpdate<CR>",                                      { silent = true, desc = "Update doomnvim" })
map("", "<leader>tt", ":FloatermNew --wintype=split<CR>",                       { silent = true, desc = "Toggle Floating term" })
map("", "<leader>tf", ":FloatermNew<CR>",                                    { silent = true, desc = "Toggle Floating term" })
