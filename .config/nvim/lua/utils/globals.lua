vim.env.XDG_CACHE_HOME = os.getenv("XDG_CACHE_HOME")
vim.env.HOME = vim.uv.os_homedir()

CURRENT_FILE_ICON = ""

P = function(v)
    print(vim.print(v))
    return v
end

RELOAD = function(...)
    return require("plenary.reload").reload_module(...)
end

R = function(name)
    RELOAD(name)
    return require(name)
end

GIT_CWD = function()
    return vim.fn.systemlist("git rev-parse --show-toplevel")[1] .. "/"
end
