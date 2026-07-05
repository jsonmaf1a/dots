local map = require("nvim.keymaps.map")
local jump = require("nvim.diagnostics").jump

-- core LSP keymaps
map("n", "K", vim.lsp.buf.hover, "Hover")
map("n", "gR", vim.lsp.buf.references, "References")
map("n", "gD", vim.lsp.buf.declaration, "Declaration")
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")

-- diagnostics
map("n", "[d", function() jump(-1) end, "Jump to prev diagnostic")
map("n", "]d", function() jump(1) end, "Jump to next diagnostic")
map("n", "<leader>xx", vim.diagnostic.setqflist, "Diagnostics (quickfix)")
map("n", "<leader>xd", vim.diagnostic.open_float, "Line diagnostics")

-- quickfix
map("n", "<leader>xq", function() vim.cmd("copen") end, "Quickfix")

-- loclist
map("n", "<leader>xl", function() vim.cmd("lopen") end, "Location list")

-- workspace diagnostics (fallback)
map("n", "<leader>xw", function()
    vim.diagnostic.setqflist({ scope = "workspace" })
end, "Workspace diagnostics")

-- toggle inlay hints
map("n", "<leader>cI", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, "Toggle inlay hints")


-- format
map("n", "<leader>cf", vim.lsp.buf.format, "Format")
