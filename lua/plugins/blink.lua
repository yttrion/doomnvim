require("colorful-menu").setup()
require("blink.cmp").setup({
    keymap = {
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<A-Tab>'] = { 'select_prev', 'fallback' },
        ['<C-space>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },
        ['<A-space>'] = { 'accept' }
        
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
        documentation = {
            auto_show = true
        },
        list = {
            max_items = 10,
            selection = {
                preselect = true,
                auto_insert = true,
            }
        },
        ghost_text = {
            enabled = true,
            show_with_selection = true,
            show_without_selection = true,
        },
        keyword = {
            range = "prefix",
        },
        menu = {
            enabled = true,
            draw = {
                align_to = "label",
                columns = { { "kind_icon" }, { "label", gap = 1 }, {"source_name"} },
                components = {
                    kind_icon = {
                        ellipsis = false,
                        text = function(ctx) return ctx.kind_icon .. ctx.icon_gap end,
                        highlight = function(ctx) return { { group = ctx.kind_hl, priority = 20000 } } end,
                    },
                    kind = {
                      ellipsis = false,
                      width = { fill = true },
                      text = function(ctx) return ctx.kind end,
                      highlight = function(ctx) return ctx.kind_hl end,
                    },
                    label = {
                        text = function(ctx)
                            return require("colorful-menu").blink_components_text(ctx)
                        end,
                        highlight = function(ctx)
                            return require("colorful-menu").blink_components_highlight(ctx)
                        end,
                    },
                    source_name = {
                        width = { max = 30 },
                        text = function(ctx) return ctx.source_name end,
                        highlight = 'BlinkCmpSource',
                    },
                },
            },
        },
        trigger = {
            prefetch_on_insert = true,
        },
    },
})
