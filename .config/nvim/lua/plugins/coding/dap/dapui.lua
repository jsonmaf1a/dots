return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "stevearc/dressing.nvim",
        "nvim-neotest/nvim-nio",
    },
    opts = {
        layouts = {
            {
                elements = {
                    {
                        id = "scopes",
                        size = 0,
                    },
                    {
                        id = "repl",
                        size = 1,
                    },
                },
                position = "right",
                size = 50,
            },
        },
    },
    config = function(_, opts)
        local dap, dapui = require("dap"), require("dapui")

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.after.event_terminated["dapui_config"] = function()
            -- dapui.close()
            -- if not is_prompt_showed then
            -- 	is_prompt_showed = true
            -- 	vim.ui.select({ "yes", "no" }, {
            -- 		prompt = "Close debugger ui?",
            -- 	}, function(choise)
            -- 		if choise == "yes" then
            -- 			dapui.close()
            -- 		end
            -- 	end)
            -- end
        end

        dapui.setup(opts)
    end,
}
