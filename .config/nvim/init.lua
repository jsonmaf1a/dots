CONFIG = {
  showmode = false, --- e.g. -- INSERT --
  enable_mouse = true,
  transparency = true,
  cursorline = false,
  global_statusline = true,
  virtual_text = true,
  relative_number = false,
  hide_cmdline = true,
  colorscheme = {
    dark = "onedark",
    light = "catppuccin-latte",
  }
}

require("core")
require("lsp")
require("ui")
