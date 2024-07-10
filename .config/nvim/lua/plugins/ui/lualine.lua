local colors = require("ui.assets").colors
local separators = require("ui.assets").separators
local utils = require("utils")

local bg = "NONE"
-- CONFIG.transparency and "NONE" or colors.bg

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
  lsp_not_empty = function()
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return false
    end
    return true
  end,
}

-- Components
local mode = {
  "mode",
  padding = { left = 2, right = 2 },
  separator = { left = separators.rounded.left, right = separators.rounded.right },
  icon = "",
  color = { gui = "italic" },
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", hint = " ", info = " " },
  sections = { "error", "warn", "info", "hint" },
  padding = { left = 2, right = 1 },
  separator = { right = "", left = "" },
  diagnostics_color = {
    error = "DiagnosticError",
    warn = "DiagnosticWarn",
    info = "DiagnosticInfo",
    hint = "DiagnosticHint",
  },
  colored = true,          -- Displays diagnostics status in color if set to true.
  update_in_insert = true, -- Update diagnostics in insert mode.
  always_visible = false,  -- Show diagnostics even if there are none.
}

local filename = {
  function()
    local name = vim.fn.expand("%:t")
    return CURRENT_FILE_ICON .. " " .. utils.truncate(name, 40)
  end,
  cond = conditions.buffer_not_empty,
  separator = { left = separators.rounded.left },
  padding = { left = 1, right = 1 },
  color = { bg = colors.red, fg = colors.bg, gui = "italic" },
}

local cwd = {
  utils.get_cwd,
  icon = "󰉖",
  separator = { left = separators.rounded.left },
  padding = { left = 1, right = 1 },
  color = { bg = colors.yellow, fg = colors.bg, gui = "italic" },
}

local branch = {
  "branch",
  icon = "",
  color = { bg = bg, fg = colors.violet, gui = "italic" },
  padding = { left = 1, right = 1 },
}

local diff = {
  "diff",
  symbols = { added = " ", modified = " ", removed = " " },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.magenta },
    removed = { fg = colors.red },
  },
  color = { bg = bg, gui = "italic" },
}

local config = {
  options = {
    globalstatus = CONFIG.global_statusline,
    component_separators = "",
    section_separators = { left = "", right = "" },
    theme = {
      normal = {
        a = { fg = colors.bg, bg = colors.violet },
        c = { bg = bg },
      },
      insert = {
        a = { fg = colors.bg, bg = colors.red },
        c = { bg = bg },
      },
      visual = {
        a = { fg = colors.bg, bg = colors.blue },
        c = { bg = bg },
      },
      replace = {
        a = { fg = colors.bg, bg = colors.red },
        c = { bg = bg },
      },
      command = {
        a = { fg = colors.bg, bg = colors.yellow },
        c = { bg = bg },
      },
    },
    disabled_filetypes = {
      "Lazy",
      "Mason",
      "neo-tree",
      "NvimTree",
      "aerial",
      "help",
      "man",
      "dap-repl",
      "dapui_scopes",
      "dapui_breakpoints",
      "dapui_stacks",
      "dapui_watches",
      "dapui_console",
    },
    ignore_focus = {
      "Lazy",
      "Mason",
      "neo-tree",
      "NvimTree",
      "aerial",
      "help",
      "man",
      "dap-repl",
      "dapui_scopes",
      "dapui_breakpoints",
      "dapui_stacks",
      "dapui_watches",
      "dapui_console",
    },
  },
  sections = {
    lualine_a = {
      mode,
    },
    lualine_b = {
      diagnostics,
    },
    lualine_c = {},
    lualine_x = {
      branch,
      diff,
    },
    lualine_y = {},
    lualine_z = {
      filename,
      cwd,
    },
  },
}

return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup(config)
    end,
  },
}
