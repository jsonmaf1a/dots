local M = {}

M.Mode = {
    Dark = 1,
    Light = 2,
    Unknown = 0,
}

M.ColorScheme = {
    [M.Mode.Dark] = "prefer-dark",
    [M.Mode.Light] = "prefer-light",
}

local function get_system_color_scheme()
    local cmd =
        { "gsettings", "get", "org.gnome.desktop.interface", "color-scheme" }
    local result = vim.system(cmd, { text = true }):wait()

    if result.code ~= 0 then
        return M.Mode.Unknown
    end

    local stdout = result.stdout:gsub("'", ""):gsub("\n", "")

    if stdout == M.ColorScheme[M.Mode.Dark] then
        return M.Mode.Dark
    elseif stdout == M.ColorScheme[M.Mode.Light] then
        return M.Mode.Light
    end

    return M.Mode.Unknown
end

--- @return number
function M.get_initial()
    local ok, mode = pcall(get_system_color_scheme)
    return ok and mode or M.Mode.Unknown
end

function M.apply(mode)
    local theme
    if mode == M.Mode.Light then
        theme = vim.g.CONFIG.colorscheme.light
    else
        theme = vim.g.CONFIG.colorscheme.dark
    end

    if vim.g.current_colorscheme ~= theme then
        vim.g.current_colorscheme = theme
        vim.cmd("colorscheme " .. theme)
    end

    require("core.ui.highlights").load()
end

function M.start_dbus_listener()
    local dbus_cmd = {
        "gdbus",
        "monitor",
        "--session",
        "--dest",
        "org.freedesktop.portal.Desktop",
    }

    local job_id = vim.fn.jobstart(dbus_cmd, {
        stdout_buffered = false,
        on_stdout = function(_, data, _)
            if not data then
                return
            end
            local line = table.concat(data, "\n")
            if
                line:match("org%.freedesktop%.portal%.Settings%.SettingChanged")
                and line:match("org%.freedesktop%.appearance")
            then
                local mode = tonumber(line:match("<uint32 (%d+)>"))
                if mode then
                    M.apply(mode)
                end
            end
        end,
        on_stderr = function(_, data, _)
            error("DBus error: " .. (data or "unknown error"), 1)
        end,
        on_exit = function(_, code, _)
            error("DBus monitor exited with code: " .. (code or "unknown"), 1)
        end,
    })

    if job_id <= 0 then
        error("Failed to start DBus monitor job", 1)
    else
        -- print("DBus monitor job started successfully")
    end
end

return M
