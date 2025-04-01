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

local initial_config = vim.diagnostic.config()
function M.diagnostic_jump(jump_count)
    local group_name = "diagnostic_jump"
    local augroup = vim.api.nvim_create_augroup(group_name, { clear = true })

    vim.diagnostic.config(vim.tbl_extend("force", initial_config, {
        virtual_text = false,
    }))
    vim.diagnostic.jump({ count = jump_count, float = true })

    vim.schedule(function()
        vim.api.nvim_create_autocmd("CursorMoved", {
            desc = "Reset diagnostics to original config",
            once = true,
            group = augroup,
            callback = function()
                vim.diagnostic.config(initial_config)
            end,
        })
    end)
end

return M
