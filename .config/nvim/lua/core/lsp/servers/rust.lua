local common = require("core.lsp.common")

vim.lsp.config.rust = {
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	handlers = common.handlers,
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { "Cargo.toml", "Cargo.lock", "rustfmt.toml" },
}

vim.lsp.enable("rust")
