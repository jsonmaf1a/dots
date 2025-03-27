require("core.lsp.servers.clangd")
require("core.lsp.servers.luals")
require("core.lsp.servers.tailwindcss")
require("core.lsp.servers.jsonls")
require("core.lsp.servers.rust")

-- local common = require("core.lsp.common")
--
-- local servers = {
-- 	"bashls",
-- 	"html",
-- 	"prismals",
-- 	"emmet_ls",
-- 	"biome",
-- 	"gopls",
-- 	"rust_analyzer",
-- }
--
-- for _, server in ipairs(servers) do
-- 	vim.lsp.config[server] = {
-- 		on_attach = common.on_attach,
-- 		capabilities = common.capabilities,
-- 		handlers = common.handlers,
-- 	}
-- 	vim.lsp.enable(server)
-- end
