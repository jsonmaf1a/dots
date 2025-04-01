local M = {}

local cmp_ok, cmp = pcall(require, "cmp_nvim_lsp")
if cmp_ok then
    local capabilities = cmp.default_capabilities()
    capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
    }
    M.capabilities = capabilities
end

M.on_attach = function(client, _)
    if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true)
    end
end

M.configure = function()
    vim.lsp.config("*", {
        on_attach = M.on_attach,
        capabilities = M.capabilities,
        handlers = vim.lsp.handlers,
    })
end

return M
