vim.diagnostic.config({
	virtual_text = {
		prefix = function(diagnostic, _, _)
			local sign_name = ({
				[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
				[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
				[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
				[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
			})[diagnostic.severity]

			local sign = vim.fn.sign_getdefined(sign_name)
			return sign[1] and sign[1].text
		end,
		current_line = true,
	},
	update_in_insert = false,
	float = {
		source = true,
	},
	signs = true,
	severity_sort = true,
	severity_limit = nil,
})
