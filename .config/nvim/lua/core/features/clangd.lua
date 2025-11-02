local M = {}

local state = {
    paired_split = {
        buf = -1,
        win = -1,
        source_file = "",
    },
}

local function get_clangd_client(bufnr)
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    for _, client in ipairs(clients) do
        if client.name == "clangd" then
            return client
        end
    end
    return nil
end

local function create_paired_split(paired_file)
    vim.cmd("vsplit " .. paired_file)
    local new_win = vim.api.nvim_get_current_win()
    local new_buf = vim.api.nvim_get_current_buf()

    -- Return focus to original window
    vim.cmd("wincmd p")

    return { win = new_win, buf = new_buf }
end

function M.open_paired_file()
    local bufnr = vim.api.nvim_get_current_buf()
    local current_file = vim.api.nvim_buf_get_name(bufnr)

    local clangd = get_clangd_client(bufnr)
    if not clangd then
        return
    end

    clangd.request(
        "textDocument/switchSourceHeader",
        { uri = vim.uri_from_bufnr(bufnr) },
        function(err, result)
            if not err and result then
                local paired_file = vim.uri_to_fname(result)

                -- Check if we have a valid existing split
                if not vim.api.nvim_win_is_valid(state.paired_split.win) then
                    -- Create new split
                    local split_info = create_paired_split(paired_file)
                    state.paired_split.win = split_info.win
                    state.paired_split.buf = split_info.buf
                    state.paired_split.source_file = current_file
                else
                    -- Reuse existing split window
                    local paired_buf = vim.fn.bufnr(paired_file, true)
                    vim.api.nvim_win_set_buf(state.paired_split.win, paired_buf)
                    state.paired_split.buf = paired_buf
                    state.paired_split.source_file = current_file
                end
            end
        end,
        bufnr
    )
end

vim.api.nvim_create_autocmd("WinClosed", {
    callback = function(args)
        local closed_win = tonumber(args.match)
        if closed_win == state.paired_split.win then
            state.paired_split.win = -1
            state.paired_split.buf = -1
            state.paired_split.source_file = ""
        end
    end,
})

return M
