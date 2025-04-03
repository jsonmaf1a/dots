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
                pattern = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "NvimTree",
                    "aerial",
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })

            vim.api.nvim_create_autocmd(
                { "BufEnter", "BufWinEnter", "BufAdd", "WinEnter" },
                {
                    pattern = "*", -- We use "*" to match all buffers, but filter by buftype
                    callback = function()
                        if vim.bo.buftype == "terminal" then
                            vim.b.miniindentscope_disable = true
                        end
                    end,
                }
            )
        end,
    },
}
