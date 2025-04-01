return {
    "pmizio/typescript-tools.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "neovim/nvim-lspconfig",
        {
            "axelvc/template-string.nvim",
            event = "InsertEnter",
            ft = {
                "javascript",
                "typescript",
                "javascriptreact",
                "typescriptreact",
            },
            config = function()
                require("template-string").setup()
            end,
        },
    },
}
