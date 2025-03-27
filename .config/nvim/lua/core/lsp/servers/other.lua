local common = require("core.lsp.common")

local servers = {
	bash = {
		filetypes = { "sh" },
		cmd = { "bash-language-server" },
	},
	prisma = {
		filetypes = { "prisma" },
		cmd = { "prisma-language-server" },
	},
	emmet = {
		filetypes = { "html", "typescriptreact", "javascriptreact", "svelte" },
		cmd = { "emmet-language-server" },
	},
	biome = {
		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "svelte", "astro" },
		cmd = { "biome", "lsp-proxy" },
	},
	go = {
		filetypes = { "go" },
		cmd = { "gopls" },
	},
	rust = {
		filetypes = { "rust" },
		cmd = { "rust-analyzer" },
	},
}

for server, opts in pairs(servers) do
	vim.lsp.config[server] = {
		on_attach = common.on_attach,
		capabilities = common.capabilities,
		handlers = common.handlers,
		cmd = opts.cmd,
		filetypes = opts.filetypes,
	}
	vim.lsp.enable(server)
end
