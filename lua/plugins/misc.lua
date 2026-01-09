local map = vim.keymap.set
-- not sure why this is here
--local wk = require("which-key")

-- nvim-hslens
require('hlslens').setup()
-- same here, not sure what kopts are
local kopts = {noremap = true, silent = true}

-- bufferline
require("bufferline").setup({
    options = {
        themable = true,
        separator_style = "slant",
    }
})

-- smartcolumn
require("smartcolumn").setup({
    disabled_filetypes = { "text", "markdown", "dashboard", "NvimTree", "lazy", "checkhealth", "zsh", "mason"}
})

-- misc of misc
require("barbecue.ui").toggle(true)
require("autoclose").setup()
require('gitsigns').setup()
require("ibl").setup({
    exclude = { filetypes = { "dashboard", "NvimTree", "lazy", "checkhealth", "mason" } },
})

require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },
})

-- Util keymaps
map("", "<leader>hu", ":DistroUpdate<CR>",                                      { silent = true, desc = "Update doomnvim" })
map("", "<leader>tt", ":FloatermNew --wintype=split<CR>",                       { silent = true, desc = "Toggle Terminal" })
map("", "<leader>tf", ":FloatermNew<CR>",                                       { silent = true, desc = "Toggle Floating term" })
