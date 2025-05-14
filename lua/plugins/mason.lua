-- lspconfig
--local servers = { "ansiblels"  }
--vim.lsp.enable(servers)


require("mason-lspconfig").setup {
	automatic_enable = false,
	ensure_installed = {
		-- LSP
		"ansiblels",
		"bashls",
		"clangd",
		"cssls",
		"dockerls",
		"helm_ls",
		"java_language_server",
		"jedi_language_server",
		"jqls",
		"jsonls",
		"ltex",
		"luau_lsp",
		"pylsp",
		"terraformls",
		"vimls",
		"yamlls",
	}
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
