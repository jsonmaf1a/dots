local hover_window_id = nil

local function process_hover_content(contents)
	local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(contents)
	local processed_lines = {}
	for _, line in ipairs(markdown_lines) do
		local split_lines = vim.split(line, "\n", { trimempty = true })
		vim.list_extend(processed_lines, split_lines)
	end
	table.insert(processed_lines, 1, "**Custom Hover Output:**")
	table.insert(processed_lines, "----")
	table.insert(processed_lines, "**End of Hover Info**")
	return processed_lines
end

local function get_current_line_diagnostics()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local current_line = cursor_pos[1] - 1
	local diagnostics = vim.diagnostic.get(0)
	local current_line_diagnostics = {}
	for _, diag in ipairs(diagnostics) do
		if diag.lnum == current_line then
			local severity_map = {
				[1] = "Error",
				[2] = "Warning",
				[3] = "Information",
				[4] = "Hint",
			}
			local severity = severity_map[diag.severity] or "Unknown"
			local message = string.format("[%d] %s: %s", diag.lnum + 1, severity, diag.message)
			table.insert(current_line_diagnostics, message)
		end
	end
	return current_line_diagnostics
end

local hover_handler = function(err, result, ctx, config)
	if err then
		vim.notify("Error: " .. err.message, vim.log.levels.ERROR)
		return
	end

	if not (result and result.contents) then
		vim.notify("No hover information available", vim.log.levels.INFO)
		return
	end

	if hover_window_id and vim.api.nvim_win_is_valid(hover_window_id) then
		vim.api.nvim_set_current_win(hover_window_id)
		return
	end

	local lines = process_hover_content(result.contents)
	local diagnostic_info = get_current_line_diagnostics()
	if diagnostic_info then
		vim.list_extend(lines, diagnostic_info)
	end

	local _, winnr = vim.lsp.util.open_floating_preview(lines, "markdown", config)
	hover_window_id = winnr

	vim.api.nvim_create_autocmd("WinClosed", {
		pattern = tostring(hover_window_id),
		callback = function()
			hover_window_id = nil
		end,
		once = true,
	})
end

local border = require("ui.assets").border

return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	opts = {},
	config = function()
		require("typescript-tools").setup({
			on_attach = function()
				if vim.fn.has("nvim-0.10") then
					vim.lsp.inlay_hint.enable(true)
				end
			end,
			handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
					silent = true,
					border = border or "rounded",
				}),
				--
				-- ["textDocument/hover"] = vim.lsp.with(hover_handler, {
				-- 	silent = true,
				-- 	border = border or "rounded",
				-- }),
				["textDocument/signatureHelp"] = vim.lsp.with(
					vim.lsp.handlers.signature_help,
					{ border = border or "rounded" }
				),
				["textDocument/publishDiagnostics"] = vim.lsp.with(
					vim.lsp.diagnostic.on_publish_diagnostics,
					{ virtual_text = CONFIG.virtual_text }
				),
			},

			settings = {
				separate_diagnostic_server = true,
				complete_function_calls = false,
				code_lens = "off",
				tsserver_file_preferences = {
					includeInlayParameterNameHints = "all",
					includeCompletionsForModuleExports = true,
					quotePreference = "auto",
				},
				jsx_close_tag = {
					enable = false,
					filetypes = { "javascriptreact", "typescriptreact" },
				},
			},
		})
	end,
}
