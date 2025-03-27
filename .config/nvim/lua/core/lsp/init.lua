require("core.lsp.servers")

local signs = {
	[vim.diagnostic.severity.ERROR] = "󰨐",
	[vim.diagnostic.severity.WARN] = "󰨐",
	[vim.diagnostic.severity.HINT] = "󰨐",
	[vim.diagnostic.severity.INFO] = "󰨐",
}

vim.diagnostic.config({
	virtual_text = {
		prefix = function(diagnostic, _, _)
			return signs[diagnostic.severity]
		end,
		format = function(diagnostic)
			if diagnostic.severity == vim.diagnostic.severity.HINT then
				return nil
			end
			return diagnostic.message
		end,
		current_line = true,
	},
	update_in_insert = false,
	float = {
		source = true,
	},
	signs = {
		text = signs,
		hl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
		},
	},
	severity_sort = true,
	severity_limit = nil,
})
