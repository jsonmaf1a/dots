local M = {}

local initial_config = vim.diagnostic.config()
function M.jump(jump_count)
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
