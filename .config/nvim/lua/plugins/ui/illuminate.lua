return {
    "RRethy/vim-illuminate",
    config = function()
        require("illuminate").configure({
            providers = {
                "lsp",
                "treesitter",
                "regex",
            },
            under_cursor = true,
            min_count_to_highlight = 2,
            case_insensitive_regex = false,
        })
    end,
}
