local autocmd = vim.api.nvim_create_autocmd

-- Disable ufo
autocmd("FileType", {
	pattern = { "NvimTree", "neo-tree", "aerial" },
	callback = function()
		require("ufo").detach()
		vim.opt_local.foldenable = false
		vim.wo.foldcolumn = "0"
	end,
}) -- Disable insert mode
autocmd({ "BufEnter", "BufWinEnter" }, {
	group = vim.api.nvim_create_augroup("DisableInsertMode", {}),
	pattern = "?*",
	callback = function(ev)
		local filename = vim.fn.fnamemodify(ev.file, ":t")
		local dap_repl = "[dap-repl]"
		if filename and (filename:sub(1, 3) == "DAP" or filename:sub(1, #dap_repl) == dap_repl) then
			return
		end
		vim.cmd("silent! stopinsert")
	end,
})

-- Open help in vertical split
autocmd("BufWinEnter", {
	pattern = { "*" },
	callback = function()
		if vim.o.filetype == "help" or vim.o.filetype == "man" then
			vim.cmd.wincmd("L")
		end
	end,
})

-- Highlight on yank
autocmd("TextYankPost", {
	pattern = { "*" },
	callback = function()
		vim.cmd("silent! lua vim.highlight.on_yank({higroup = 'Yank', timeout = 300})")
	end,
})

-- Disable diagnostics in node_modules (0 is current buffer only)
autocmd({ "BufRead", "BufNewFile" }, { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })

-- Show `` in specific files
autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.txt", "*.md", "*.json" }, command = "setlocal conceallevel=0" })

-- Enable spell checking for certain file types
autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell" })

-- Set current file icon (needed for lualine)
autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype ~= "neo-tree" then
			CURRENT_FILE_ICON = require("nvim-web-devicons").get_icon(
				vim.fn.expand("%:t"),
				vim.fn.fnamemodify(vim.fn.expand("%"), ":e"),
				{ default = true }
			)
		end
	end,
})
