local utils = require("utils")
local colors = require("utils.assets").colors

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
}

local components = {
    mode = {
        "mode",
        color = { bg = colors.bg, fg = colors.text },
    },
    mode_prefix = {
        function()
            local color = utils.get_current_mode_color()

            local hl = "LualineModePrefix"
            vim.api.nvim_set_hl(0, hl, { fg = color, bg = colors.bg })

            return utils.hl_str(hl, "▊")
        end,
        padding = { left = 0, right = 0 },
    },
    diagnostics = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn", "info", "hint" },
        padding = { left = 0, right = 0 },
        diagnostics_color = {
            error = "DiagnosticError",
            warn = "DiagnosticWarn",
            info = "DiagnosticInfo",
            hint = "DiagnosticHint",
        },
        colored = true, -- Displays diagnostics status in color if set to true.
        update_in_insert = true, -- Update diagnostics in insert mode.
        always_visible = false, -- Show diagnostics even if there are none.
        color = { italic = false, bold = false },
    },
    progress = {
        function()
            local chars = {
                "▔",
                "🮂",
                "🬂",
                "🮃",
                "▀",
                "▄",
                "▃",
                "🬭",
                "▂",
                "▁",
            }

            local cur_line = vim.api.nvim_win_get_cursor(0)[1]
            local lines = vim.api.nvim_buf_line_count(0)

            local i = math.floor((cur_line - 1) / lines * #chars) + 1
            return string.rep(chars[i], 2)
        end,
        color = { bg = colors.bg, fg = colors.lavender },
        padding = { left = 0, right = 0 },
    },
    filepath = {
        function()
            local name = vim.fn.expand("%:t")
            local icon, color = require("nvim-web-devicons").get_icon_color(
                vim.fn.expand("%:t"),
                vim.fn.fnamemodify(vim.fn.expand("%"), ":e"),
                { default = true }
            )

            local hl = "LualineFileIcon_" .. color:gsub("#", "")
            vim.api.nvim_set_hl(0, hl, { fg = color, bg = colors.bg })

            return utils.hl_str(hl, icon)
                .. " "
                .. utils.get_cwd()
                .. "/"
                .. utils.truncate(name, 40)
        end,
        cond = conditions.buffer_not_empty,
        padding = { left = 1, right = 1 },
    },
    branch = {
        "branch",
        icon = "",
        color = { bg = colors.bg, fg = colors.lavender },
        padding = { left = 1, right = 1 },
    },
    diff = {
        "diff",
        symbols = { added = " ", modified = " ", removed = " " },
        diff_color = {
            added = { fg = colors.green },
            modified = { fg = colors.mauve },
            removed = { fg = colors.red },
        },
        color = { bg = colors.bg },
    },
}

local config = {
    options = {
        globalstatus = vim.g.CONFIG.global_statusline,
        component_separators = "",
        section_separators = { left = "", right = "" },
        theme = {
            normal = {
                a = { bg = colors.bg, fg = colors.text },
                b = { bg = colors.bg, fg = colors.text },
                c = { bg = colors.bg, fg = colors.text },
                x = { bg = colors.bg, fg = colors.text },
                y = { bg = colors.bg, fg = colors.text },
                z = { bg = colors.bg, fg = colors.text },
            },
        },
        disabled_filetypes = utils.disabled_patterns.filetypes,
        ignore_focus = utils.disabled_patterns.filetypes,
    },
    sections = {
        lualine_a = {
            components.mode_prefix,
            components.mode,
        },
        lualine_b = {
            components.diagnostics,
        },
        lualine_c = {},
        lualine_x = {
            components.diff,
            components.branch,
        },
        lualine_y = {
            components.filepath,
        },
        lualine_z = {
            "location",
            components.progress,
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
