-- lspconfig
local servers = {
    "ansiblels",
    "bashls",
    "dockerls",
    "jsonls",
    "lua_ls",
    "marksman",
    "pylsp",
    "terraformls",
    "vimls",
    "yamlls"
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
    automatic_enable = true,
    ensure_installed = {
        "ansiblels",
        "bashls",
        "dockerls",
        "jsonls",
        "lua_ls",
        "marksman",
        "pylsp",
        "terraformls",
        "vimls",
        "yamlls"
    }
}

