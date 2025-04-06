local M = {}

--- @param mode table | string
--- @param keys string
--- @param action function | string
--- @param desc string | nil
--- @return nil
M.set_keymap = function(mode, keys, action, desc)
    if type(mode) == "string" then
        mode = { mode }
    end

    for _, m in ipairs(mode) do
        pcall(function()
            vim.api.nvim_del_keymap(m, keys)
        end)

        vim.keymap.set(m, keys, action, {
            silent = true,
            noremap = true,
            nowait = false,
            unique = true,
            desc = desc,
        })
    end
end

M.get_cwd = function()
    return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

M.get_lsp = function()
    local msg = "LSP"
    local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
    local clients = vim.lsp.get_clients()

    if next(clients) == nil then
        return msg
    end

    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
        end
    end
    return msg
end

M.truncate = function(str, n)
    return str:sub(1, n - 1) .. (str:len() > n and "..." or "")
end

M.load_env = function(file)
    local env_file = io.open(file, "r")
    if not env_file then
        return {}
    end

    local env = {}
    for line in env_file:lines() do
        if line:match("^[A-Z0-9_]+=.+") then
            local k, v = line:match("^([A-Z0-9_]+)=(.+)")

            env[k] = v
        end
    end

    env_file:close()
    return env
end

M.escape_wildcards = function(path)
    return path:gsub("([%[%]%?%*])", "\\%1")
end

M.strip_archive_subpath = function(path)
    path =
        vim.fn.substitute(path, "zipfile://\\(.\\{-}\\)::[^\\\\].*$", "\\1", "")
    path = vim.fn.substitute(path, "tarfile:\\(.\\{-}\\)::.*$", "\\1", "")

    return path
end
M.search_ancestors = function(startpath, func)
    vim.validate("func", func, "function")
    if func(startpath) then
        return startpath
    end
    local guard = 100
    for path in vim.fs.parents(startpath) do
        -- Prevent infinite recursion if our algorithm breaks
        guard = guard - 1
        if guard == 0 then
            return
        end

        if func(path) then
            return path
        end
    end
end

M.root_pattern = function(...)
    local patterns = vim.iter({ ... }):flatten(math.huge):totable()

    return function(startpath)
        startpath = M.strip_archive_subpath(startpath)
        for _, pattern in ipairs(patterns) do
            local match = M.search_ancestors(startpath, function(path)
                for _, p in
                    ipairs(
                        vim.fn.glob(
                            table.concat(
                                { M.escape_wildcards(path), pattern },
                                "/"
                            ),
                            true,
                            true
                        )
                    )
                do
                    if vim.uv.fs_stat(p) then
                        return path
                    end
                end
            end)

            if match ~= nil then
                return match
            end
        end
    end
end

function M.freeze(tbl)
    return setmetatable(tbl, {
        __newindex = function()
            error("Attempt to modify a frozen table", 2)
        end,
        __index = tbl,
    })
end

function M.pad_lines(lines)
    local padded = {}

    local pad_left = " "
    local pad_right = " "

    -- Vertical top padding
    table.insert(padded, "")

    for _, line in ipairs(lines) do
        table.insert(padded, pad_left .. line .. pad_right)
    end

    -- Vertical bottom padding
    table.insert(padded, "")

    return padded
end

function M.create_floating_window(opts)
    opts = opts or {}

    local width = opts.width or math.floor(vim.o.columns * 0.8)
    local height = opts.height or math.floor(vim.o.lines * 0.8)

    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    local win_config = {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal",
    }

    local win = vim.api.nvim_open_win(buf, true, win_config)

    return { buf = buf, win = win }
end

function M.hl_str(hl, str)
    return "%#" .. hl .. "#" .. str .. "%*"
end

function M.get_current_mode_color()
    local colors = require("utils.assets").colors

    local mode = vim.api.nvim_get_mode().mode
    if mode == "n" then
        return colors.lavender
    elseif mode == "i" then
        return colors.mauve
    elseif mode == "v" then
        return colors.sky
    elseif mode == "V" then
        return colors.sapphire
    elseif mode == "t" then
        return colors.red
    elseif mode == "s" then
        return colors.teal
    elseif mode == "R" then
        return colors.flamingo
    elseif mode == "c" then
        return colors.yellow
    end

    return colors.text
end

M.disabled_patterns = {
    filetypes = {
        "help",
        "qf",
        "neo-tree",
        "TelescopePrompt",
        "fugitive",
        "Lazy",
        "NvimTree",
        "aerial",
        "man",
        "dap-repl",
        "dapui_scopes",
        "dapui_breakpoints",
        "dapui_stacks",
        "dapui_watches",
        "dapui_console",
    },
    buftypes = { "terminal" },
    bufnames = {},
}

function M.should_exclude_buffer()
    local buf = vim.api.nvim_get_current_buf()
    local filetype = vim.bo[buf].filetype
    local buftype = vim.bo[buf].buftype
    local bufname = vim.api.nvim_buf_get_name(buf)

    for _, ft in ipairs(M.disabled_patterns.filetypes) do
        if filetype == ft then
            return true
        end
    end

    for _, bt in ipairs(M.disabled_patterns.buftypes) do
        if buftype == bt then
            return true
        end
    end

    for _, pattern in ipairs(M.disabled_patterns.bufnames) do
        if bufname:match(pattern) then
            return true
        end
    end

    return false
end

return M
