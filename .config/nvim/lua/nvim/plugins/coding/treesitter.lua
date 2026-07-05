
require("nvim-treesitter").setup()

local ensure_installed = {
    "json", "javascript", "typescript", "tsx",
    "yaml", "toml", "html", "css",
    "markdown", "markdown_inline",
    "bash", "lua", "vim", "dockerfile",
    "c", "go", "rust", "cpp"
}
require("nvim-treesitter").install(ensure_installed)

require("treesitter-modules").setup({
    incremental_selection = {
        enable = true,
        disable = false,
        keymaps = {
            init_selection = "vv",
            node_incremental = "vv",
            scope_incremental = false,
            node_decremental = false,
        },
    },
})

-- ts_context_commentstring
require("ts_context_commentstring").setup({})

-- treesitter-context
require("treesitter-context").setup({
    enable = true,
    multiwindow = false,
    max_lines = 5,
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 20,
    trim_scope = "outer",
    mode = "cursor",
    separator = "",
    zindex = 20,
})
