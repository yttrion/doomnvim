require("mason-lspconfig").setup {
    automatic_enable = false
}
require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = ""
        }
    }
})
