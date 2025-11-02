vim.lsp.config.go = {
    filetypes = { "go" },
    cmd = { "gopls" },
    root_markers = {
        "go.mod",
        ".git",
        "Makefile",
    },
}

vim.lsp.enable("go")
