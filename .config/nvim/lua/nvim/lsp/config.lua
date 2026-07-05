local M = {}


local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, cmp = pcall(require, "cmp_nvim_lsp")
if ok then
    capabilities = cmp.default_capabilities(M.capabilities)
end

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

function M.get_capabilities()
    return vim.tbl_deep_extend("force", {}, capabilities)
end

function M.on_attach(client, bufnr)
    if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
end

return M
