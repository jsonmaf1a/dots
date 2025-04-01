local M = {}

local colors = require("utils.assets").colors
local bg = vim.g.CONFIG.transparency and colors.transparent or colors.bg

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
    TelescopeMatching = { fg = colors.lavender },
    TelescopeSelection = {
        fg = colors.text,
        bg = colors.gray,
        bold = true,
    },
    TelescopePromptPrefix = { bg = colors.gray },
    TelescopePromptNormal = { bg = colors.gray },
    TelescopeResultsNormal = { bg = colors.bg },
    TelescopePreviewNormal = { bg = colors.bg },
    TelescopePromptBorder = { bg = colors.gray, fg = colors.gray },
    TelescopeResultsBorder = { bg = colors.bg, fg = colors.bg },
    TelescopePreviewBorder = { bg = colors.bg, fg = colors.bg },
    TelescopePromptTitle = { bg = colors.pink, fg = colors.bg },
    TelescopeResultsTitle = { fg = colors.bg },
    TelescopePreviewTitle = { bg = colors.green, fg = colors.bg },
}

M.load = function()
    define_highlights(neovim)
    define_highlights(telescope)
end

return M
