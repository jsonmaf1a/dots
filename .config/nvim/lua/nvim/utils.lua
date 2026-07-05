local M = {}

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

return M
