local cfg = require("nvim.lsp.config")

local SERVERS_PATH = "nvim.lsp.servers."
local SERVERS_DIR = vim.fn.stdpath("config") .. "/lua/nvim/lsp/servers"

local function get_server_module_names()
    local names = {}
    for name, type in vim.fs.dir(SERVERS_DIR) do
        if type == "file" and name:match("%.lua$") then
            table.insert(names, (name:gsub("%.lua$", "")))
        end
    end
    return names
end

-- NOTE: a server config file may return either:
--  - single server: function(cfg) -> config_table
--  - multiple servers in one file: { name = function(cfg) -> config_table }
local function enable_server(name, server_config)
    if vim.fn.executable(name) == 0 then
        return
    end
    vim.lsp.config(name, server_config(cfg))
    vim.lsp.enable(name)
end

for _, mod_name in ipairs(get_server_module_names()) do
    local ok, result = pcall(require, SERVERS_PATH .. mod_name)
    if not ok then
        vim.notify(
            "lsp server '" .. mod_name .. "' failed to load: " .. tostring(result),
            vim.log.levels.ERROR
        )
    elseif type(result) == "function" then
        enable_server(mod_name, result)
    elseif type(result) == "table" then
        for name, server_config in pairs(result) do
            enable_server(name, server_config)
        end
    end
end
