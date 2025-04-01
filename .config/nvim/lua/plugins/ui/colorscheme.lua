return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        opts = {
            flavor = "mocha",
            background = {
                light = "latte",
                dark = "mocha",
            },
            transparent_background = vim.g.CONFIG.transparency,
            default_integrations = true,
            dim_inactive = {
                enabled = true,
                shade = "dark",
                percentage = 1.00,
            },
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                fidget = true,
                mason = true,
                neotree = true,
                ufo = true,
                lsp_trouble = true,
                which_key = true,
                dap = true,
                dap_ui = true,
                illuminate = {
                    enabled = true,
                    lsp = true,
                },
                mini = {
                    enabled = false,
                },
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                    },
                    underlines = {
                        errors = { "undercurl" },
                        hints = { "undercurl" },
                        warnings = { "undercurl" },
                        information = { "undercurl" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
            },
        },
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = vim.g.CONFIG.transparency,
        },
    },
}
