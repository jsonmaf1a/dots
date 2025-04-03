local M = {}

M.signs = {
    [vim.diagnostic.severity.ERROR] = {
        text = " ",
        hl = "DiagnosticError",
    },
    [vim.diagnostic.severity.WARN] = {
        text = " ",
        hl = "DiagnosticWarn",
    },
    [vim.diagnostic.severity.HINT] = {
        text = " ",
        hl = "DiagnosticHint",
    },
    [vim.diagnostic.severity.INFO] = {
        text = " ",
        hl = "DiagnosticInfo",
    },
}

vim.diagnostic.config({
    virtual_text = {
        prefix = function(diagnostic, _, _)
            return M.signs[diagnostic.severity].text
        end,
        current_line = true,
        source = true,
    },
    update_in_insert = false,
    float = {
        source = true,
    },
    signs = {
        text = setmetatable({}, {
            __index = function(_, k)
                return M.signs[k] and M.signs[k].text
            end,
        }),
        hl = setmetatable({}, {
            __index = function(_, k)
                return M.signs[k] and M.signs[k].hl
            end,
        }),
    },
    severity_sort = true,
    severity_limit = nil,
})

return M
