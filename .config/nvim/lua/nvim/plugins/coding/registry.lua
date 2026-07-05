local register_plugins = require("nvim.plugins.common").register_plugins
local _MODULE_NAME = "coding"

local plugins = {
    ["nvim-ts-autotag"] = "windwp/nvim-ts-autotag",
    cmp = "hrsh7th/nvim-cmp",
    lspkind = "onsails/lspkind.nvim",
    ["cmp-path"] = "hrsh7th/cmp-path",
    ["cmp-buffer"] = "hrsh7th/cmp-buffer",
    ["cmp-nvim-lsp"] = "hrsh7th/cmp-nvim-lsp",
    ["cmp-nvim-lua"] = "hrsh7th/cmp-nvim-lua",
    ["cmp-nvim-lsp-signature-help"] = "hrsh7th/cmp-nvim-lsp-signature-help",
    LuaSnip = "L3MON4D3/LuaSnip",
    ["cmp_luasnip"] = "saadparwaiz1/cmp_luasnip",
    ["friendly-snippets"] = "rafamadriz/friendly-snippets",
    ["todo-comments"] = "folke/todo-comments.nvim",
    plenary = "nvim-lua/plenary.nvim",
    comment = "numToStr/Comment.nvim",
    ["nvim-ts-context-commentstring"] = "JoosepAlviste/nvim-ts-context-commentstring",
    lazydev = "folke/lazydev.nvim",
    treesitter = "nvim-treesitter/nvim-treesitter",
    ["treesitter-textobjects"] = "nvim-treesitter/nvim-treesitter-textobjects",
    ["treesitter-context"] = "nvim-treesitter/nvim-treesitter-context",
    ["treesitter-modules"] = "MeanderingProgrammer/treesitter-modules.nvim",
    ["rainbow-delimiters"] = "HiPhish/rainbow-delimiters.nvim",
}

register_plugins(_MODULE_NAME, plugins)
