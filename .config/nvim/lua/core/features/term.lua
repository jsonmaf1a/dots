local M = {}

local state = {
    floating = {
        buf = -1,
        win = -1,
    },
    hl = {
        win = "FloatTerm",
        border = "FloatTermBorder",
    },
}

function M.toggle()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = require("utils").create_floating_window({
            buf = state.floating.buf,
        })

        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.terminal()

            vim.api.nvim_win_set_option(
                state.floating.win,
                "winhl",
                "Normal:" .. state.hl.win .. ",FloatBorder:" .. state.hl.border
            )

            vim.api.nvim_create_autocmd(
                { "BufWinEnter", "WinEnter", "BufEnter" },
                {
                    callback = function(args)
                        if args.buf == state.buf then
                            vim.b.miniindentscope_disable = true
                        end
                    end,
                }
            )
        end
    else
        vim.api.nvim_win_hide(state.floating.win)
    end

    vim.cmd("normal i")
end

return M
