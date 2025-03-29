local cmp_ok, cmp = pcall(require, "cmp_nvim_lsp")
if not cmp_ok then
	return
end

local M = {}

-- local capabilities = require("blink.cmp").get_lsp_capabilities()
local capabilities = cmp.default_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
M.capabilities = capabilities

M.on_attach = function(client, _)
	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true)
	end
end

M.configure = function()
	vim.lsp.config("*", {
		on_attach = M.on_attach,
		capabilities = M.capabilities,
		handlers = M.handlers,
	})
end

return M
