local M = {}

local cmp_ok, cmp = pcall(require, "cmp_nvim_lsp")
if cmp_ok then
    M.capabilities = cmp.default_capabilities()
end

M.capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

M.capabilities.textDocument.semanticTokens = {
    multilineTokenSupport = true,
}

M.on_attach = function(client, _)
    if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true)
    end
end

M.configure = function()
    vim.lsp.config("*", {
        on_attach = M.on_attach,
        capabilities = M.capabilities,
    })
end

return M
