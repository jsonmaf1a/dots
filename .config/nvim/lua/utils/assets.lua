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
    -- bg = palette.mantle,
    -- fg = palette.text,
    -- gray = palette.overlay2,
    -- yellow = palette.yellow,
    -- orange = palette.peach,
    -- red = palette.red,
    -- green = palette.green,
    -- teal = palette.teal,
    -- accent = palette.mauve,
    -- magenta = palette.pink,
    -- blue = palette.blue,
    -- lavender = palette.lavender,
    -- ltblue = palette.sapphire,
    -- cyan = palette.sky,
}

M.colors.bg = vim.g.CONFIG.transparency and M.colors.transparent
    or M.colors.mantle

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
