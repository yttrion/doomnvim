-- lspconfig
local servers = {
	"clangd",
	"harper_ls",
	"eslint",
	"lua_ls",
	"pyright",
	"bashls",
	"ltex",
	"vimls",
	"yamlls",
	"dockerls",
	"marksman",
}
vim.lsp.enable(servers)


require("mason-lspconfig").setup {
	automatic_enable = true,
	ensure_installed = {
		"clangd",
		"harper_ls",
		"eslint",
		"lua_ls",
		"pyright",
		"bashls",
		"ltex",
		"vimls",
		"yamlls",
		"dockerls",
		"marksman",

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

