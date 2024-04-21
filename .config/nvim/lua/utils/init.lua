local M = {}

M.set_keymap = function(mode, keys, action, desc)
	vim.keymap.set(mode, keys, action, {
		silent = true,
		noremap = true,
		nowait = false,
		desc = desc,
	})
end

M.get_cwd = function()
	return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

M.get_file_icon = function(filename)
	local icons = require("nvim-web-devicons")
	return icons.get_icon(filename, vim.fn.fnamemodify(filename, ":e"), { default = true })
end

M.get_lsp = function()
	local msg = "LSP"
	local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return client.name
		end
	end
	return msg
end

M.merge_tables = function(t1, t2)
	for k, v in pairs(t2) do
		if type(v) == "table" then
			if type(t1[k] or false) == "table" then
				M.merge_tables(t1[k] or {}, t2[k] or {})
			else
				t1[k] = v
			end
		end
	end
	return t1
end

M.get_mode = function()
	local m = vim.api.nvim_get_mode().mode
	print(m)

	if m == "i" then
		return "INSERT"
	elseif m == "v" or m == "V" then
		return "VISUAL"
	elseif m == "r" then
		return "REPLACE"
	elseif m == "c" then
		return "COMMAND"
	end

	return "NORMAL"
end

return M
