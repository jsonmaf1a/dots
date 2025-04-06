return {
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
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
        },
        main = "ibl",
    },
    {
        "echasnovski/mini.indentscope",
        version = "*",
        opts = {
            symbol = "|",
            -- symbol = "│",
            options = { try_as_border = true },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = require("utils").disabled_patterns.filetypes,
                callback = function()
                    if require("utils").should_exclude_buffer() then
                        vim.b.miniindentscope_disable = true
                    end
                end,
            })
        end,
    },
}
