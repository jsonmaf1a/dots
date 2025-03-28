local define_signs = function(signs)
	for name, opts in pairs(signs) do
		vim.fn.sign_define(name, opts)
	end
end

local signs = {
	DapBreakpoint = { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" },
	DapBreakpointCondition = {
		text = "●",
		texthl = "DapBreakpointCondition",
		linehl = "",
		numhl = "DapBreakpoint",
	},
	DapLogPoint = { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "DapLogPoint" },
	DapStopped = { text = "➜", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "DapStopped" },
	-- -- -- -- --
	DiagnosticSignError = { text = "󰨐", texthl = "DiagnosticError" },
	DiagnosticSignWarn = { text = "󰨐", texthl = "DiagnosticWarn" },
	DiagnosticSignInfo = { text = "󰨐", texthl = "DiagnosticInfo" },
	DiagnosticSignHint = { text = "󰨐", texthl = "DiagnosticHint" },
}

define_signs(signs)
