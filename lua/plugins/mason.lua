-- lspconfig
local servers = {
    "ansiblels",
    "bashls",
    "dockerls",
    "jsonls",
    "lua_ls",
    "pylsp",
    "terraformls",
    "vimls",
    "yamlls",
    "texlab",
}
vim.lsp.enable(servers)

require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = ""
        }
    }
})

require("mason-lspconfig").setup {
    automatic_enable = {
        "ansiblels",
        "bashls",
        "dockerls",
        "pylsp",
        "terraformls",
        "vimls",
        "yamlls",
        "texlab",
        "texfmt",
    },
    ensure_installed = {
        "ansiblels",
        "bashls",
        "dockerls",
        "jsonls",
        "lua_ls",
        "pylsp",
        "terraformls",
        "vimls",
        "yamlls",
        "texlab",
    }
}
