require("colorful-menu").setup()
require("blink.cmp").setup({
    keymap = {
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<A-Tab>'] = { 'select_prev', 'fallback' },
    },

    appearance = {
        nerd_font_variant = 'normal'
    },

    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = {
        implementation = "lua",
        sorts = {
            "exact",
            "score",
            "sort_text",
        }
    },
    enabled = function() return not vim.tbl_contains({ "dashboard", "Nerdtree", "help" }, vim.bo.filetype) end,


    completion = {
        documentation = { auto_show = true },
        menu = {
            draw = {
                -- We don't need label_description now because label and label_description are already
                -- combined together in label by colorful-menu.nvim.
                columns = { { "kind_icon" }, { "label", gap = 1 } },
                components = {
                    label = {
                        text = function(ctx)
                            return require("colorful-menu").blink_components_text(ctx)
                        end,
                        highlight = function(ctx)
                            return require("colorful-menu").blink_components_highlight(ctx)
                        end,
                    },
                },
            },
        },
    },
})

