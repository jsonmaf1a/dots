local catppuccin_ok, catppuccin = pcall(require, "catppuccin.palettes")
if not catppuccin_ok then
    return
end

local M = {}

local catppuccin = catppuccin.get_palette()

-- TODO: replace with catppuccin colors
M.colors = {
    transparent = "NONE",
    white = "#ffffff",
    black = "#000000",
    bg = catppuccin.mantle,
    fg = catppuccin.text,
    gray = catppuccin.overlay2,
    yellow = catppuccin.yellow,
    orange = catppuccin.peach,
    red = catppuccin.red,
    green = catppuccin.green,
    teal = catppuccin.teal,
    accent = catppuccin.mauve,
    magenta = catppuccin.pink,
    blue = catppuccin.blue,
    lavender = catppuccin.lavender,
    ltblue = catppuccin.sapphire,
    cyan = catppuccin.sky,
}

M.separators = {
    rounded = {
        left = "",
        right = "",
    },
}

return M
