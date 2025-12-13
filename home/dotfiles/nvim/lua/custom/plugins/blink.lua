return {

    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
            {
                "saghen/blink.compat",

                version = "*",
                lazy = true,
                opts = {},
            },
            { "L3MON4D3/LuaSnip", version = "v2.*" },
            {
                "giuxtaposition/blink-cmp-copilot",
            },
        },

        version = "*",

        opts = {
            keymap = {
                preset = "none",
                ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<C-e>"] = { "hide" },
                ["<C-y>"] = { "select_and_accept" },

                ["<C-p>"] = {},
                ["<C-o>"] = { "select_prev", "fallback" },
                ["<C-n>"] = { "select_next", "fallback" },

                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },

                ["<Tab>"] = { "snippet_forward", "fallback" },
                ["<S-Tab>"] = { "snippet_backward", "fallback" },
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "Nerd Font",
                kind_icons = {
                    Copilot = "",
                    Text = "󰉿",
                    Method = "󰊕",
                    Function = "󰊕",
                    Constructor = "󰒓",

                    Field = "󰜢",
                    Variable = "󰆦",
                    Property = "󰖷",

                    Class = "󱡠",
                    Interface = "󱡠",
                    Struct = "󱡠",
                    Module = "󰅩",

                    Unit = "󰪚",
                    Value = "󰦨",
                    Enum = "󰦨",
                    EnumMember = "󰦨",

                    Keyword = "󰻾",
                    Constant = "󰏿",

                    Snippet = "󱄽",
                    Color = "󰏘",
                    File = "󰈔",
                    Reference = "󰬲",
                    Folder = "󰉋",
                    Event = "󱐋",
                    Operator = "󰪚",
                    TypeParameter = "󰬛",
                },
            },
            cmdline = {
                completion = {
                    menu = { auto_show = true },
                },
            },

            completion = {
                menu = {
                    border = "rounded",
                    draw = { treesitter = { "lsp" } },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                    window = { border = "rounded" },
                },
            },
            sources = {
                default = {
                    "copilot",
                    "lazydev",
                    "lsp",
                    "path",
                    "snippets",
                    "buffer",
                    "dadbod",
                },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        -- make lazydev completions top priority (see `:h blink.cmp`)
                        score_offset = 105,
                    },
                    lsp = {
                        score_offset = 100,
                    },
                    copilot = {
                        name = "copilot",
                        module = "blink-cmp-copilot",
                        score_offset = 101,
                        async = true,
                        transform_items = function(_, items)
                            local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                            local kind_idx = #CompletionItemKind + 1
                            CompletionItemKind[kind_idx] = "Copilot"
                            for _, item in ipairs(items) do
                                item.kind = kind_idx
                            end
                            return items
                        end,
                    },
                    buffer = {
                        score_offset = 90,
                    },
                    snippets = {
                        score_offset = 80,
                    },
                    path = {
                        score_offset = 70,
                    },
                    dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink", score_offset = 100 },
                },
            },

            signature = {
                window = { border = "rounded" },
                enabled = true,
            },
        },
        opts_extend = { "sources.default" },
    },
}
