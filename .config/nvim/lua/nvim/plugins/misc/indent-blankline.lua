require("ibl").setup({
    indent = {
        char = "│",
        tab_char = "│",
    },
    scope = { enabled = false },
    exclude = {
        filetypes = {
            "dashboard",
            "neo-tree",
            "Trouble",
            "trouble",
            "lazy",
            "mason",
            "NvimTree",
            "aerial",
        },
        buftypes = {
            "terminal",
        },
    },
})
