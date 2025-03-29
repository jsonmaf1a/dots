local M = {}
local colors = require("utils.assets").colors
local catppuccin = require("catppuccin.palettes").get_palette()
local bg = vim.g.CONFIG.transparency and "NONE" or colors.bg

local function define_highlights(highlights)
	for name, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, name, opts)
	end
end

local neovim = {
	FloatBorder = { bg = bg, fg = bg },
	DiagnosticError = { bg = bg, fg = catppuccin.red, italic = false, bold = false },
	DiagnosticWarn = { bg = bg, fg = catppuccin.yellow, italic = false, bold = false },
	DiagnosticInfo = { bg = bg, fg = catppuccin.sapphire, italic = false, bold = false },
	DiagnosticHint = { bg = bg, fg = catppuccin.teal, italic = false, bold = false },
}

local telescope = {
	TelescopeMatching = { fg = catppuccin.flamingo },
	TelescopeSelection = { fg = catppuccin.text, bg = catppuccin.surface0, bold = true },
	TelescopePromptPrefix = { bg = catppuccin.surface0 },
	TelescopePromptNormal = { bg = catppuccin.surface0 },
	TelescopeResultsNormal = { bg = catppuccin.mantle },
	TelescopePreviewNormal = { bg = catppuccin.mantle },
	TelescopePromptBorder = { bg = colors.surface0, fg = catppuccin.surface0 },
	TelescopeResultsBorder = { bg = catppuccin.mantle, fg = catppuccin.mantle },
	TelescopePreviewBorder = { bg = catppuccin.mantle, fg = catppuccin.mantle },
	TelescopePromptTitle = { bg = catppuccin.pink, fg = catppuccin.mantle },
	TelescopeResultsTitle = { fg = catppuccin.mantle },
	TelescopePreviewTitle = { bg = catppuccin.green, fg = catppuccin.mantle },
}

M.load = function()
	define_highlights(neovim)
	define_highlights(telescope)
end

return M
