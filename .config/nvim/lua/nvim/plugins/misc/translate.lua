local config = require("nvim.config")

local env = require("nvim.utils").load_env(vim.fn.stdpath("config") .. "/.env")
vim.g.deepl_api_auth_key = env.DEEPL_API_AUTH_KEY

require("translate").setup({
    default = {
        command = "deepl_free",
    },
    silent = false,
    preset = {
        output = {
            split = {
                append = true,
            },
            floating = {
                style = "minimal",
                focusable = true,
                border = config.border,
                zindex = 51,
            },
        },
    },
})
