local ok, catppuccin = pcall(require, "catppuccin.palettes")
if not ok then
    return
end

local M = {}

local palette = catppuccin.get_palette()

M.colors = {
    transparent = "NONE",
    white = "#ffffff",
    black = "#000000",
    bg = vim.g.CONFIG.transparency and "NONE" or palette.mantle,
}

for k, v in pairs(palette) do
    M.colors[k] = v
end

M.separators = {
    rounded = {
        left = "",
        right = "",
    },
}

return M
