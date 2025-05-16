-- lspconfig
local servers = {
    --"clangd",
    --"harper_ls",
    --"eslint",
    "lua_ls",
    --"pyright",
    "bashls",
    --"ltex",
    "vimls",
    --"yamlls",
    --"dockerls",
    "marksman",
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
        --"clangd",
        --"harper_ls",
        --"eslint",
        "lua_ls",
        --"pyright",
        "bashls",
        --"ltex",
        "vimls",
        --"yamlls",
        --"dockerls",
        "marksman",
    }
}
