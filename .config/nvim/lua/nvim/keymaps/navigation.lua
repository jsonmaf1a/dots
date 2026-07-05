local map = require("nvim.keymaps.map")

-- insert navigation
map("i", "<A-h>", "<Left>", "Left")
map("i", "<A-j>", "<Down>", "Down")
map("i", "<A-k>", "<Up>", "Up")
map("i", "<A-l>", "<Right>", "Right")

-- indent
map("v", "<", "<gv", "Indent left")
map("v", ">", ">gv", "Indent right")

-- delete without yank
map({ "n", "v" }, "x", '"_x', "Delete char")
map({ "n", "v" }, "X", '"_X', "Delete char")

-- paste without yank
map("v", "p", '"_dP', "Paste")

-- save
map({ "n", "i", "v" }, "<C-s>", "<Esc><cmd>w<CR>", "Save")

-- better motions
map({ "n", "o" }, "w", function() require("spider").motion("w") end)
map({ "n", "o" }, "e", function() require("spider").motion("e") end)
map({ "n", "o" }, "b", function() require("spider").motion("b") end)

-- smart navigation
map({ "n", "t" }, "<C-h>", "<CMD>SmartCursorMoveLeft<CR>", "Move left")
map({ "n", "t" }, "<C-l>", "<CMD>SmartCursorMoveRight<CR>", "Move right")
map({ "n", "t" }, "<C-k>", "<CMD>SmartCursorMoveUp<CR>", "Move up")
map({ "n", "t" }, "<C-j>", "<CMD>SmartCursorMoveDown<CR>", "Move down")

-- move visual
map("v", "<A-j>", ":m '>+1<CR>gv=gv", "Move visual down")
map("v", "<A-k>", ":m '<-2<CR>gv=gv", "Move visual up")
map("v", "<A-h>", "<gv", "Move visual left")
map("v", "<A-l>", ">gv", "Move visual right")

-- resize
map("n", "<A-k>", ":resize +2<CR>", "Increase window height")
map("n", "<A-j>", ":resize -2<CR>", "Decrease window height")
map("n", "<A-l>", ":vertical resize +2<CR>", "Increase window width")
map("n", "<A-h>", ":vertical resize -2<CR>", "Decrease window width")

-- neotree
map(
    "n",
    "<leader>e",
    "<cmd>Neotree reveal_force_cwd filesystem toggle<CR>",
    "Neotree"
)

-- better search results navigation
map('n', 'n', 'nzzzv', "Next search result")
map('n', 'N', 'Nzzzv', "Prev search result")
