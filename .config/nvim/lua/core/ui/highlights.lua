local M = {}

local colors = require("utils.assets").colors
local bg = vim.g.CONFIG.transparency and colors.transparent or colors.mantle

local function define_highlights(highlights)
    for name, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, name, opts)
    end
end

local neovim = {
    FloatBorder = { bg = bg, fg = bg },
    DiagnosticError = {
        bg = colors.transparent,
        fg = colors.red,
        italic = false,
        bold = false,
    },
    DiagnosticWarn = {
        bg = colors.transparent,
        fg = colors.yellow,
        italic = false,
        bold = false,
    },
    DiagnosticInfo = {
        bg = colors.transparent,
        fg = colors.sapphire,
        italic = false,
        bold = false,
    },
    DiagnosticHint = {
        bg = colors.transparent,
        fg = colors.teal,
        italic = false,
        bold = false,
    },
}

local telescope = {
    TelescopeMatching = { bg = colors.sapphire, fg = colors.base },

    TelescopeSelection = {
        fg = colors.base,
        bg = colors.lavender,
        bold = true,
    },
    TelescopePromptPrefix = { bg = colors.surface0 },
    TelescopePromptNormal = { bg = colors.surface0 },

    TelescopeResultsNormal = { bg = colors.mantle },
    TelescopePreviewNormal = { bg = colors.mantle },

    TelescopeResultsBorder = { bg = colors.mantle, fg = colors.lavender },
    TelescopePreviewBorder = { bg = colors.mantle, fg = colors.lavender },
    TelescopePromptBorder = { bg = colors.surface0, fg = colors.lavender },
    TelescopePromptTitle = { bg = colors.sapphire, fg = colors.lavender },
    TelescopeResultsTitle = { fg = colors.lavender },
}

M.load = function()
    define_highlights(neovim)
    define_highlights(telescope)
end

return M
