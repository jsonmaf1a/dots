local map = require("nvim.keymaps.map")
local dap = require("dap")
local dapui = require("dapui")

map("n", "<leader>dc", dap.continue, "Continue")
map("n", "<leader>dt", dap.toggle_breakpoint, "Breakpoint")
map("n", "<leader>du", dapui.toggle, "DAP UI")

map("n", "<leader>da", function()
    require("dap").continue()
end, "Run")
