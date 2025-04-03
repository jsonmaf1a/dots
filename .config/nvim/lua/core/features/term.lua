local M = {}
local state = {
    floating = {
        buf = -1,
        win = -1,
    },
}

function M.toggle()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = require("utils").create_floating_window({
            buf = state.floating.buf,
        })
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.terminal()
        end
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
    vim.cmd("normal i")
end

return M
