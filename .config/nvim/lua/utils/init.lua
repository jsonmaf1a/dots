local M = {}

M.set_keymap = function(mode, keys, action, desc)
    vim.keymap.set(mode, keys, action, {
        silent = true,
        noremap = true,
        nowait = false,
        desc = desc,
    })
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

M.merge_tables = function(t1, t2)
    for k, v in pairs(t2) do
        if type(v) == "table" then
            if type(t1[k] or false) == "table" then
                M.merge_tables(t1[k] or {}, t2[k] or {})
            else
                t1[k] = v
            end
        end
    end
    return t1
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

M.tbl_flatten = function(t)
    return vim.iter(t):flatten(math.huge):totable()
end

M.root_pattern = function(...)
    local patterns = M.tbl_flatten({ ... })
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
        __newindex = function(_, key, value)
            error("Attempt to modify a frozen table", 2)
        end,
        __index = tbl,
    })
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
        border = "single",
        style = "minimal",
    }

    local win = vim.api.nvim_open_win(buf, true, win_config)

    return { buf = buf, win = win }
end

return M
