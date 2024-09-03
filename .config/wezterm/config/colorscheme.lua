local wezterm = require("wezterm")

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

local function get_theme(appearance)
  if appearance:find 'Dark' then
    return {
      theme = 'OneDark (base16)',
      cursor = 'Bibata-Modern-Classic'
    }
  else
    return {
      theme = 'Catppuccin Latte',
      cursor = 'Bibata-Modern-Ice'
    }
  end
end

return get_theme(get_appearance())
