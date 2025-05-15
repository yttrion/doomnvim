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
