lua << EOF

vim.opt.termguicolors = true
require("nvim-tree").setup({
  view = {
    width = g:doomnvim_sidebar_width,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


EOF
