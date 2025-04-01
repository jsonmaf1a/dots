vim.lsp.config.rust = {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml", "Cargo.lock", "rustfmt.toml" },
}

vim.lsp.enable("rust")
