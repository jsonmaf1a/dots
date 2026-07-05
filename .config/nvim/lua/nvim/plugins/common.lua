local M = {}

local MISSING_MODULE_PATTERN = "module '.*' not found"
local GITHUB_BASE_URL = "https://github.com/"
local PLUGINS_PATH = "nvim.plugins."

local function get_module_path(module)
    return PLUGINS_PATH .. module .. "."
end

M.add_plugins = function(plugins)
    for name, repo in pairs(plugins) do
        vim.pack.add({
            { src = GITHUB_BASE_URL .. repo, name = name },
        })
    end
end

M.configure_plugins = function(module, plugins)
    for name in pairs(plugins) do
        local path = get_module_path(module) .. name
        local found, err = pcall(require, path)

        if not found then
            if not err:match(MISSING_MODULE_PATTERN) then
                error(err)
            end

            local loaded, plugin = pcall(require, name)
            if loaded and type(plugin.setup) == "function" then
                plugin.setup({})
            end
        end
    end
end

M.register_plugins = function(module, plugins)
    M.add_plugins(plugins)
    M.configure_plugins(module, plugins)
end

return M
