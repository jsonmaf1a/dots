return function(cfg)
    return {
        capabilities = cfg.get_capabilities(),
        on_attach = cfg.on_attach,
        cmd = {
            "clangd",
            "--completion-style=detailed",
            "--background-index=false",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--suggest-missing-includes",
            "--cross-file-rename",
            "--pch-storage=memory",
            "--ranking-model=decision_forest",
            "--limit-results=0",
        },
        filetypes = { "c", "cpp", "cc", "h", "hpp", "objc", "cuda" },
        root_markers = { ".clangd", ".git", "compile_commands.json", "CMakeLists.txt" },
    }
end
