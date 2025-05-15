-- lspconfig
--local servers = { "ansiblels"  }
--vim.lsp.enable(servers)


require("mason-lspconfig").setup {
	automatic_enable = false,
	ensure_installed = {
		-- LSP
		--"ansiblels",
		--"bashls",
		--"clangd",
		--"cssls",
		--"dockerls",
		--"helm_ls",
		--"java_language_server",
		--"jedi_language_server",
		--"jqls",
		--"jsonls",
		--"ltex",
		--"luau_lsp",
		--"pylsp",
		--"terraformls",
		--"vimls",
		--"yamlls",
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

require("blink.cmp").setup({
	appearance = {
		-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- Adjusts spacing to ensure icons are aligned
		nerd_font_variant = 'mono'
	},
	completion = { documentation = { auto_show = true } },

	sources = {
		default = { 'lsp', 'path', 'snippets', 'buffer' },
	},
	fuzzy = { implementation = "prefer_rust_with_warning" }
})

