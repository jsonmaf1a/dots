local autocmd = vim.api.nvim_create_autocmd

-- remove trailing whitespaces on save
autocmd("BufWritePre", {
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

-- disable ufo in specific buffers
autocmd("FileType", {
    pattern = { "NvimTree", "neo-tree" },
    callback = function()
        require("ufo").detach()
        vim.opt_local.foldenable = false
        vim.wo.foldcolumn = "0"
    end,
})

-- disable insert mode in specific buffers
autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = "?*",
    callback = function(ev)
        local filename = vim.fn.fnamemodify(ev.file, ":t")
        local dap_repl = "[dap-repl]"
        if
            filename
            and (
                filename:sub(1, 3) == "DAP"
                or filename:sub(1, #dap_repl) == dap_repl
            )
        then
            return
        end
        vim.cmd("silent! stopinsert")
    end,
})

-- open help in vertical split
autocmd("BufWinEnter", {
    pattern = { "*" },
    callback = function()
        if vim.o.filetype == "help" or vim.o.filetype == "man" then
            vim.cmd.wincmd("L")
        end
    end,
})

-- highlight on yank
autocmd("TextYankPost", {
    pattern = { "*" },
    callback = function()
        vim.cmd("silent! lua vim.hl.on_yank({higroup = 'Yank', timeout = 150})")
    end,
})

-- disable diagnostics in node_modules (0 is current buffer only)
autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" }
)

-- show `` in specific buffers
autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.txt", "*.md", "*.json" },
    command = "setlocal conceallevel=0",
})

-- enable spell checking in specific buffers
autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell" }
)

-- enable text wrap in specific buffers
autocmd({ "FileType" }, {
    pattern = { "text", "markdown", "tex" },
    callback = function()
        vim.opt_local.wrap = true
    end,
})

-- toggle relativenumber
autocmd({ "CmdlineEnter" }, {
    callback = function()
        if require("nvim.utils").should_exclude_buffer() then
            return
        end

        vim.opt.relativenumber = false
        vim.cmd.redraw()
    end,
})
autocmd({ "CmdlineLeave" }, {
    callback = function()
        if require("nvim.utils").should_exclude_buffer() then
            return
        end

        vim.opt.relativenumber = true
        vim.cmd.redraw()
    end,
})

-- autofold imports
autocmd("LspNotify", {
    callback = function(args)
        if args.data.method == "textDocument/didOpen" then
            vim.lsp.foldclose("imports", vim.fn.bufwinid(args.buf))
        end
    end,
})

-- set colorscheme
autocmd("VimEnter", {
    callback = function()
        local colorscheme = require("nvim.config").colorscheme

        local ok = pcall(require, colorscheme.src)
        if ok then
            vim.cmd("colorscheme " .. colorscheme.name)
        end
    end,
})

-- redraw statusline when needed
autocmd({ "InsertEnter", "InsertLeave", "CmdlineLeave" }, {
    callback = function()
        vim.schedule(function()
            vim.cmd("redrawstatus")
        end)
    end,
})

autocmd("User", {
    pattern = "GitSignsUpdate",
    callback = function()
        vim.cmd("redrawstatus")
    end,
})

-- update statusline colors
autocmd("ColorScheme", {
    pattern = "catppuccin*",
    callback = require("nvim.statusline").set_highlights,
})

autocmd("VimEnter", {
    callback = function()
        require("nvim.statusline").setup()
    end,
})
