return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter-context",
            "HiPhish/rainbow-delimiters.nvim",
            "nushell/tree-sitter-nu",
        },
        config = function()
            -- New API: no more require("nvim-treesitter.configs").setup()
            -- highlight, indent, etc. are enabled via vim.g or direct module calls
            require("nvim-treesitter").setup()

            -- Ensure parsers are installed
            local ensure_installed = {
                "json", "javascript", "typescript", "tsx",
                "yaml", "toml", "html", "css", "prisma",
                "markdown", "markdown_inline", "svelte",
                "graphql", "bash", "lua", "vim", "dockerfile",
                "gitignore", "c", "go", "rust", "cpp", "nu",
            }
            require("nvim-treesitter").install(ensure_installed)

            -- Highlight (on by default in new API, but explicit is fine)
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(ev)
                    pcall(vim.treesitter.start, ev.buf)
                end,
            })

            -- Incremental selection keymaps
            vim.keymap.set("n", "vv", function()
                require("nvim-treesitter.incremental_selection").init_selection()
            end, { desc = "TS init selection" })

            -- Filetypes
            vim.filetype.add({
                extension = {
                    hurl = "hurl",
                },
                pattern = {
                    [".*/hypr/.*%.conf"] = "hyprlang",
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
        end,
    },
}
