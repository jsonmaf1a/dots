return function(cfg)
    return {
        capabilities = cfg.get_capabilities(),
        on_attach = cfg.on_attach,
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = { ".luarc.json", ".luarc.jsonc", "init.lua" },
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                },
                completion = {
                    callSnippet = "Both",
                    autoRequire = false,
                },
                diagnostics = {
                    unusedLocalExclude = { "_*" },
                    globals = { "vim" },
                },
                workspace = {
                    checkThirdParty = false,
                    -- library = vim.api.nvim_get_runtime_file("", true),
                    library = {
                        -- vim.env.VIMRUNTIME,
                        vim.fn.stdpath("config") .. "/lua",
                        "${3rd}/luv/library",
                    },
                },
            },
        },
    }
end
