return {
    "mcauley-penney/visual-whitespace.nvim",
    opts = {
        highlight = { link = "Comment" },
        space_char = "·",
        tab_char = "→",
        nl_char = "↲",
        cr_char = "←",
        enabled = true,
        excluded = {
            filetypes = {},
            buftypes = {},
        },
    },
    config = true,
}
