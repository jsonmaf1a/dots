local map = require("nvim.keymaps.map")
local picker = require("snacks").picker

-- escape
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", "Clear search")

-- picker
map("n", "<leader>ff", picker.files, "Find files")
map("n", "<leader>fg", picker.grep, "Grep")
map("n", "<leader>fb", picker.buffers, "Buffers")
map("n", "<leader>gs", picker.git_status, "Git status")
map("n", "<leader>gb", picker.git_branches, "Git branches")
map("n", "<leader>fh", picker.help, "Help")
map("n", "<leader>fu", picker.undo, "Undo")
map("n", "<leader>fz", picker.zoxide, "Zoxide")
map("n", "<leader>uc", picker.colorschemes, "Colorschemes")

-- delete buffer
map("n", "<leader>bd", function()
    vim.cmd("bdelete")
end, "Close buffer")
