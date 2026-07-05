local M = {}

local severity = vim.diagnostic.severity
local ICON = " "

M.signs = {
    [severity.ERROR] = { text = ICON, hl = "DiagnosticError" },
    [severity.WARN]  = { text = ICON, hl = "DiagnosticWarn" },
    [severity.HINT]  = { text = ICON, hl = "DiagnosticHint" },
    [severity.INFO]  = { text = ICON, hl = "DiagnosticInfo" },
}

local set_highlights = function()
    -- TODO: fix colors
    vim.api.nvim_set_hl(0, "DiagnosticError", { italic = false })
    vim.api.nvim_set_hl(0, "DiagnosticWarn", { italic = false })
    vim.api.nvim_set_hl(0, "DiagnosticHint", { italic = false })
    vim.api.nvim_set_hl(0, "DiagnosticInfo", { italic = false })
end

local sign_text, sign_hl = {}, {}
for sev, def in pairs(M.signs) do
    sign_text[sev] = def.text
    sign_hl[sev]   = def.hl
end

M.config = {
    virtual_text = {
        prefix = function(diagnostic)
            return sign_text[diagnostic.severity]
        end,
        current_line = true,
        source = true,
    },
    update_in_insert = false,
    float = { source = true },
    signs = {
        text   = sign_text,
        texthl = sign_hl,
        numhl  = sign_hl,
    },
    severity_sort = true,
}

local initial_config

function M.setup()
    set_highlights();
    vim.diagnostic.config(M.config)
    initial_config = vim.diagnostic.config()
end

function M.jump(count)
    if not initial_config then
        M.setup()
    end

    vim.diagnostic.config(vim.tbl_extend("force", initial_config, {
        virtual_text = false,
    }))

    vim.diagnostic.jump({ count = count, float = true })

    vim.schedule(function()
        vim.api.nvim_create_autocmd("CursorMoved", {
            once = true,
            group = vim.api.nvim_create_augroup("diagnostic_jump_reset", { clear = true }),
            callback = function()
                vim.diagnostic.config(initial_config)
            end,
        })
    end)
end

return M
