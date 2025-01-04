require("utils.globals")

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
	return vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " "
end

M.get_lsp = function()
	local msg = "LSP"
	local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
	local clients = vim.lsp.get_clients()
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

M.truncate = function(str, n)
	return str:sub(1, n - 1) .. (str:len() > n and "..." or "")
end

M.load_env = function(file)
	local env_file = io.open(file, "r")
	if not env_file then
		return {}
	end

	local env = {}
	for line in env_file:lines() do
		if line:match("^[A-Z0-9_]+=.+") then
			local k, v = line:match("^([A-Z0-9_]+)=(.+)")

			env[k] = v
		end
	end

	env_file:close()
	return env
end

return M
