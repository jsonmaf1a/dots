return function(cfg)
    return {
        capabilities = cfg.get_capabilities(),
        on_attach = cfg.on_attach,
        filetypes = { "go" },
        cmd = { "gopls" },
        root_markers = {
            "go.mod",
            ".git",
            "Makefile",
        },
    }
end
