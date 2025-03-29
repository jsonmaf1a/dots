local signs = {
	[vim.diagnostic.severity.ERROR] = " ",
	[vim.diagnostic.severity.WARN] = " ",
	[vim.diagnostic.severity.HINT] = " ",
	[vim.diagnostic.severity.INFO] = " ",
}

vim.diagnostic.config({
	virtual_text = {
		prefix = function(diagnostic, _, _)
			return signs[diagnostic.severity]
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
			[vim.diagnostic.severity.ERROR] = "DiagnosticError",
			[vim.diagnostic.severity.WARN] = "DiagnosticWarn",
			[vim.diagnostic.severity.HINT] = "DiagnosticHint",
			[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
		},
	},
	severity_sort = true,
	severity_limit = nil,
})
