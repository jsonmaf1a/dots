local autocmd = vim.api.nvim_create_autocmd

-- Set colorscheme
autocmd("VimEnter", {
	callback = function()
		local adm = require("auto-dark-mode")
		adm.setup({
			update_interval = 1000,
			set_dark_mode = function()
				vim.api.nvim_set_option_value("background", "dark", {})
				vim.cmd("colorscheme " .. CONFIG.colorscheme.dark)
			end,
			set_light_mode = function()
				vim.api.nvim_set_option_value("background", "light", {})
				vim.cmd("colorscheme " .. CONFIG.colorscheme.light)
			end,
		})
	end,
})

-- Remove trailing whitespaces on save
autocmd("BufWritePre", {
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.setpos(".", save_cursor)
	end,
})

-- Disable ufo
autocmd("FileType", {
	pattern = { "NvimTree", "neo-tree", "aerial" },
	callback = function()
		require("ufo").detach()
		vim.opt_local.foldenable = false
		vim.wo.foldcolumn = "0"
	end,
})

-- Disable insert mode in specific buffers
autocmd({ "BufEnter", "BufWinEnter" }, {
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
		vim.cmd("silent! lua vim.highlight.on_yank({higroup = 'Yank', timeout = 150})")
	end,
})

-- Disable diagnostics in node_modules (0 is current buffer only)
autocmd({ "BufRead", "BufNewFile" }, { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })

-- Show `` in specific files
autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.txt", "*.md", "*.json" }, command = "setlocal conceallevel=0" })

-- Enable spell checking for certain file types
autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell" })

-- Get icon based on filetype for lualine 'filename' module
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

-- Lint
autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

-- Toggle relativenumber
autocmd({ "CmdlineEnter" }, {
	callback = function()
		vim.opt.relativenumber = false
		vim.cmd.redraw()
	end,
})
autocmd({ "CmdlineLeave" }, {
	callback = function()
		vim.opt.relativenumber = true
		vim.cmd.redraw()
	end,
})

-- NOTE: wait for neovim v0.11;
-- Autofold imports
-- autocmd("LspNotify", {
-- 	callback = function(args)
-- 		if args.data.method == "textDocument/didOpen" then
-- 			vim.lsp.foldclose("imports", vim.fn.bufwinid(args.buf))
-- 		end
-- 	end,
-- })
