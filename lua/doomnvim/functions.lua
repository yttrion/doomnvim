-- Alias definition
local opt = vim.opt
local o = vim.o
local g = vim.g -- is this really used ?
vim.g.vimtex_view_method = 'mupdf'
vim.g.vimtex_view_general_viewer = 'mupdf'
vim.g.vimtex_compiler_method = 'latexmk'
--vim.maplocalleader = " "

--- Custom functions
function GitGraph()
    require('gitgraph').draw({}, { all = true, max_count = 5000 })
end


--- Add to NVIM API
vim.api.nvim_create_user_command('GitGraph', GitGraph, {})
