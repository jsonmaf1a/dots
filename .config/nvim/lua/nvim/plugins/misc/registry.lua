local register_plugins = require("nvim.plugins.common").register_plugins
local _MODULE_NAME = "misc"

local plugins = {
    autopairs = "windwp/nvim-autopairs",
    ["indent-blankline"] = "lukas-reineke/indent-blankline.nvim",
    indentscope = "echasnovski/mini.indentscope",
    lspkind = "onsails/lspkind.nvim",
    nerdy = "2kabhishek/nerdy.nvim",
    numb = "nacro90/numb.nvim",
    snacks = "folke/snacks.nvim",
    spider = "chrisgrieser/nvim-spider",
    ["smart-splits"] = "mrjones2014/smart-splits.nvim",
    surround = "echasnovski/mini.surround",
    ufo = "kevinhwang91/nvim-ufo",
    ["promise-async"] = "kevinhwang91/promise-async",
    ["visual-whitespace"] = "mcauley-penney/visual-whitespace.nvim",
    wakatime = "wakatime/vim-wakatime",
    ["which-key"] = "folke/which-key.nvim",
    translate = "uga-rosa/translate.nvim",
}

register_plugins(_MODULE_NAME, plugins)
