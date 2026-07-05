local register_plugins = require("nvim.plugins.common").register_plugins
local _MODULE_NAME = "ui"

local plugins = {
    barbecue = "utilyre/barbecue.nvim",
    neotree = "nvim-neo-tree/neo-tree.nvim",
    colorizer = "NvChad/nvim-colorizer.lua",
    navic = "SmiteshP/nvim-navic",
    webdevicons = "nvim-tree/nvim-web-devicons",
    catppuccin = "catppuccin/nvim",
    dressing = "stevearc/dressing.nvim",
    fidget = "j-hui/fidget.nvim",
    illuminate = "RRethy/vim-illuminate",
    gitsigns = "lewis6991/gitsigns.nvim",
    nui = "MunifTanjim/nui.nvim",
    plenary = "nvim-lua/plenary.nvim",
}

register_plugins(_MODULE_NAME, plugins)
