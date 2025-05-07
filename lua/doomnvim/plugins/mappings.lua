------------------------------------------------------
-- Exhaustive keymap configuration
-- Author: Pierre-Yves Douault
-- License: MIT
------------------------------------------------------

local map = vim.keymap.set

-- map( mode, input, command, { desc = "description" } )

-- Buffer operation --------------------------------------------------------{{{

map("i", "bp", "bp<CR>")

-- }}}
