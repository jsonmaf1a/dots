local M = {}

local diagnostic_signs = require("nvim.diagnostics").signs

M.set_highlights = function()
    local palette = require("catppuccin.palettes").get_palette()

    vim.api.nvim_set_hl(0, "StBase", { bg = palette.mantle })
    vim.api.nvim_set_hl(0, "StModeNormal", { fg = palette.mantle, bg = palette.green, bold = true })
    vim.api.nvim_set_hl(0, "StModeInsert", { fg = palette.mantle, bg = palette.blue, bold = true })
    vim.api.nvim_set_hl(1, "StModeVisual", { fg = palette.mantle, bg = palette.mauve, bold = true })
    vim.api.nvim_set_hl(0, "StModeOther", { fg = palette.mantle, bg = palette.red, bold = true })

    vim.api.nvim_set_hl(0, "StGitBranch", { fg = palette.subtext0, bg = "NONE" })
    vim.api.nvim_set_hl(0, "StGitAdd", { fg = palette.green, bg = "NONE" })
    vim.api.nvim_set_hl(0, "StGitChange", { fg = palette.yellow, bg = "NONE" })
    vim.api.nvim_set_hl(0, "StGitDelete", { fg = palette.red, bg = "NONE" })

    vim.api.nvim_set_hl(0, "StFileModified", { fg = palette.peach, bg = "NONE" })
    vim.api.nvim_set_hl(0, "StRecording", { fg = palette.red, bg = "NONE", bold = true })
    vim.api.nvim_set_hl(0, "StLspClient", { fg = palette.lavender, bg = "NONE" })
    vim.api.nvim_set_hl(0, "StSearchCount", { fg = palette.sky, bg = "NONE" })
end

local MODE_MAP = {
    n = { " n ", "StModeNormal" },
    i = { " i ", "StModeInsert" },
    v = { " v ", "StModeVisual" },
    V = { " v-line ", "StModeVisual" },
    ["\22"] = { " v-block ", "StModeVisual" },
    c = { " c ", "StModeOther" },
    r = { " r ", "StModeOther" },
    R = { " R ", "StModeOther" },
    t = { " t ", "StModeOther" },
}

local function get_mode()
    local mode = vim.api.nvim_get_mode().mode
    local m = MODE_MAP[mode] or { " " .. mode .. " ", "StModeOther" }
    return "%#" .. m[2] .. "#" .. m[1] .. "%#StBase#"
end

local function get_git()
    local dict = vim.b.gitsigns_status_dict
    if not dict then
        return ""
    end

    local branch = dict.head and ("%#StGitBranch#  " .. dict.head .. " ") or "" local added = dict.added and dict.added > 0 and ("%#StGitAdd#+" .. dict.added .. " ") or ""
    local changed = dict.changed and dict.changed > 0 and ("%#StGitChange#~" .. dict.changed .. " ") or ""
    local removed = dict.removed and dict.removed > 0 and ("%#StGitDelete#-" .. dict.removed .. " ") or ""

    local diff = added .. changed .. removed
    if branch == "" and diff == "" then
        return ""
    end

    return diff .. branch .. ""
end

local SEVERITY_ORDER = { "ERROR", "WARN", "INFO", "HINT" }

local function get_lsp_diagnostic_count()
    local counts = vim.diagnostic.count(0)
    local severity = vim.diagnostic.severity

    local parts = {}
    for _, name in ipairs(SEVERITY_ORDER) do
        local count = counts[severity[name]] or 0
        if count > 0 then
            local sign = diagnostic_signs[severity[name]]
            table.insert(parts, "%#" .. sign.hl .. "# " .. sign.text .. " " .. count)
        end
    end

    return table.concat(parts) .. "%#StBase#"
end

local function get_lsp_clients()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients == 0 then
        return ""
    end

    local names = {}
    for _, client in ipairs(clients) do
        table.insert(names, client.name)
    end

    return "%#StLspClient# " .. table.concat(names, ", ") .. " %#StBase#"
end

local function get_search_count()
    if vim.v.hlsearch == 0 then
        return ""
    end

    local ok, result = pcall(vim.fn.searchcount, { maxcount = 0 })
    if not ok or result.total == 0 then
        return ""
    end

    return "%#StSearchCount# " .. result.current .. "/" .. result.total .. " %#StBase#"
end

local function get_icon()
    local devicons_ok, devicons = pcall(require, "nvim-web-devicons")
    if not devicons_ok then
        return ""
    end

    local icon, icon_hl = devicons.get_icon(vim.fn.expand("%:t"), vim.fn.expand("%:e"))
    if not icon then
        return ""
    end

    return "%#" .. icon_hl .. "# " .. icon .. " %#StBase#"
end


local function get_macro_reading()
    local blink_icon = true
    local blink_timer = nil

    local is_rec = vim.fn.reg_recording()
    if is_rec == "" then
        if blink_timer then
            blink_timer:stop()
            blink_timer:close()
            blink_timer = nil
        end
        return ""
    end

    if not blink_timer then
        blink_timer = vim.uv.new_timer()
        blink_timer:start(
            0,
            500,
            vim.schedule_wrap(function()
                blink_icon = not blink_icon
                vim.cmd("redrawstatus")
            end)
        )
    end

    local icon = blink_icon and "" or " "
    return "%#StRecording#" .. icon .. "%#StBase#" .. " Rec @" .. is_rec
end


local function get_is_modified()
    local is_modified = vim.api.nvim_get_option_value("modified", { buf = 0 })
    local modified_icon = is_modified and " " or ""

    return "%#StFileModified#" .. modified_icon .. " " .. "%#StBase#"
end

local function get_filename()

    return " %t "
end

local function spacer()

    return "%="
end

function _G.Statusline()
    local is_active = vim.g.statusline_winid == vim.fn.win_getid()
    local filename = get_filename()

    if not is_active then
        return "%#StBase#" .. filename .. spacer()
    end

    return "%#StBase# "
        .. get_mode()
        .. get_filename()
        .. get_is_modified()
        .. get_lsp_diagnostic_count()
        .. spacer()
        .. get_macro_reading()
        .. get_search_count()
        .. spacer()
        .. get_git()
        .. get_icon()
        .. get_lsp_clients()
end

function M.setup()
    M.set_highlights()
    vim.opt.statusline = "%!v:lua.Statusline()"
    vim.cmd("redrawstatus")
end

return M
