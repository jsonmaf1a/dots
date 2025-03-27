local set_keymap = require("utils").set_keymap

local dap = require("dap")
local dapui = require("dapui")
local langs = require("plugins.coding.dap.config.js").langs
local trouble = require("trouble")
local telescope = require("telescope.builtin")
local ufo = require("ufo")
local splits = require("smart-splits")
local ls = require("luasnip")
local conform = require("conform")
local lint = require("lint")

-- Clear search with <esc>
set_keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", "Escape and clear hlsearch")

-- Navigation in insert mode
set_keymap("i", "<A-k>", "<Up>", "Up")
set_keymap("i", "<A-j>", "<Down>", "Down")
set_keymap("i", "<A-l>", "<Right>", "Right")
set_keymap("i", "<A-h>", "<Left>", "Left")

-- Better motions
set_keymap({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", "Spider-w")
set_keymap({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", "Spider-e")
set_keymap({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", "Spider-b")

-- Better indenting
set_keymap("v", "<", "<gv", "Indent right")
set_keymap("v", ">", ">gv", "Indent left")

-- Move visual
set_keymap("v", "<A-j>", "<Plug>GoVSMDown", "Move visual down")
set_keymap("v", "<A-k>", "<Plug>GoVSMUp", "Move visual up")
set_keymap("v", "<A-h>", "<Plug>GoVSMLeft", "Move visual left")
set_keymap("v", "<A-l>", "<Plug>GoVSMRight", "Move visual right")

-- LSP
set_keymap("n", "gR", vim.lsp.buf.references, "Show references")
set_keymap("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
set_keymap("n", "]d", ":lua vim.diagnostic.jump({ count = 1, float = true })<CR>", "Go to next diagnostic")
set_keymap("n", "[d", ":lua vim.diagnostic.jump({ count = -1, float = true })<CR>", "Go to previous diagnostic")
set_keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Actions")
set_keymap("n", "K", vim.lsp.buf.hover, "Show docs")
set_keymap("n", "<leader>cD", vim.lsp.buf.declaration, "Go to declaration")
set_keymap("n", "<leader>cr", telescope.lsp_references, "References")

set_keymap("n", "<leader>cq", ":LspRestart<CR>", "Restart LSP")
set_keymap("n", "<leader>cX", vim.diagnostic.open_float, "Line diagnostics")
set_keymap("n", "<leader>cn", vim.lsp.buf.rename, "Smart rename")
set_keymap("n", "gd", telescope.lsp_definitions, "Definitions")
set_keymap("n", "gi", telescope.lsp_implementations, "Implementations")
set_keymap("n", "gt", telescope.lsp_type_definitions, "Type definitions")
set_keymap("n", "<leader>ci", telescope.lsp_implementations, "Implementations")
set_keymap("n", "<leader>cd", telescope.lsp_definitions, "Definitions")
set_keymap("n", "<leader>ct", telescope.lsp_type_definitions, "Type definitions")
set_keymap("n", "<leader>cx", telescope.diagnostics, "Buffer diagnostics")

set_keymap("n", "<leader>cR", "<cmd>TSToolsFileReferences<CR>", "File references")
set_keymap("n", "<leader>co", "<cmd>TSToolsOrganizeImports<CR>", "Organize imports")
set_keymap("n", "<leader>cu", "<cmd>TSToolsRemoveUnusedImports<CR>", "Remove unused imports")
set_keymap("n", "<leader>cm", "<cmd>TSToolsAddMissingImports<CR>", "Add missing imports")

-- Telescope
set_keymap("n", "<leader>/", "<cmd>Telescope file_browser path=%:p:h=%:p:h<cr>", "Browse files")
set_keymap("n", "<leader><Space>", telescope.resume, "Resume last search")
set_keymap("n", "<leader>F", telescope.live_grep, "Live grep")
set_keymap("n", "<leader>fl", telescope.live_grep, "Live grep")
set_keymap("n", "<leader>ff", telescope.find_files, "Find files")
set_keymap("n", "<leader>fb", telescope.buffers, "Buffers")
set_keymap("n", "<leader>fi", telescope.highlights, "Highlights")
set_keymap("n", "<leader>fh", telescope.help_tags, "Help")
set_keymap("n", "<leader>fm", telescope.man_pages, "Man")
set_keymap("n", "<leader>fk", telescope.keymaps, "Keymaps")
set_keymap("n", "<leader>fs", telescope.spell_suggest, "Spell suggestions")

-- Git
set_keymap("n", "<leader>gg", telescope.git_files, "Git files")
set_keymap("n", "<leader>gs", telescope.git_status, "Git status")
set_keymap("n", "<leader>gc", telescope.git_commits, "Git commits")
set_keymap("n", "<leader>gC", telescope.git_bcommits, "Git bcommits")
set_keymap("n", "<leader>gb", telescope.git_bcommits, "Git branches")
set_keymap("n", "<leader>gt", telescope.git_stash, "Git stash")

-- Diagnostics
set_keymap("n", "<leader>xx", function()
	trouble.toggle("diagnostics")
end, "File diagnostics")

set_keymap("n", "<leader>xw", function()
	trouble.toggle("workspace_diagnostics")
end, "Workspace diagnostics")

set_keymap("n", "<leader>xd", function()
	trouble.toggle("document_diagnostics")
end, "Document diagnostics")

set_keymap("n", "<leader>xd", function()
	trouble.toggle("quickfix")
end, "Quick fix")

set_keymap("n", "<leader>xd", function()
	trouble.toggle("loclist")
end, "Location list")

set_keymap("n", "<leader>a", function()
	trouble.toggle("symbols")
end, "LSP Symbols")

-- Resize
set_keymap("n", "<C-Up>", "<cmd>SmartResizeUp<cr>", "Increase window height")
set_keymap("n", "<A-k>", "<cmd>SmartResizeUp<cr>", "Increase window height")
set_keymap("n", "<C-Down>", "<cmd>SmartResizeDown<cr>", "Decrease window height")
set_keymap("n", "<A-j>", "<cmd>SmartResizeDown<cr>", "Decrease window height")
set_keymap("n", "<C-Right>", "<cmd>SmartResizeRight<cr>", "Increase window width")
set_keymap("n", "<A-l>", "<cmd>SmartResizeRight<cr>", "Increase window width")
set_keymap("n", "<C-Left>", "<cmd>SmartResizeLeft<cr>", "Decrease window width")
set_keymap("n", "<A-h>", "<cmd>SmartResizeLeft<cr>", "Decrease window width")

-- Buffers
-- set_keymap("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", "Move to previous buffer")
-- set_keymap("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", "Move to next buffer")
-- set_keymap("n", "<C-p>", "<Cmd>BufferLinePick<CR>", "Pick buffer")
-- set_keymap("n", "<leader>bb", "<Cmd>BufferLineCyclePrev<CR>", "Move to previous buffer")
-- set_keymap("n", "<leader>bn", "<Cmd>BufferLineCycleNext<CR>", "Move to next buffer")
-- set_keymap("n", "<leader>bc", "<Cmd>BufferLinePickClose<CR>", "Pick buffer to close")
set_keymap("n", "<leader>bd", "<Cmd>lua MiniBufremove.delete()<CR>", "Close current buffer")

-- Swap buffers
set_keymap("n", "<leader>bh", splits.swap_buf_left, "Swap left")
set_keymap("n", "<leader>bj", splits.swap_buf_down, "Swap down")
set_keymap("n", "<leader>bk", splits.swap_buf_up, "Swap up")
set_keymap("n", "<leader>bl", splits.swap_buf_right, "Swap right")

-- Smart navigation
set_keymap({ "n", "t" }, "<C-h>", "<CMD>SmartCursorMoveLeft<CR>", "Move left")
set_keymap({ "n", "t" }, "<C-l>", "<CMD>SmartCursorMoveRight<CR>", "Move right")
set_keymap({ "n", "t" }, "<C-k>", "<CMD>SmartCursorMoveUp<CR>", "Move up")
set_keymap({ "n", "t" }, "<C-j>", "<CMD>SmartCursorMoveDown<CR>", "Move down")

set_keymap("n", "<leader>uh", "<cmd>ColorizerToggle<CR>", "Toggle colorizer")
set_keymap("n", "<leader>uc", "<cmd>Telescope colorscheme<CR>", "Colorscheme")

-- Save on CTRL + S
set_keymap({ "n", "i", "v" }, "<C-s>", "<Esc><cmd>w<CR>", "Save")

-- Swap splits
set_keymap("n", "<C-x>", "<C-w>x", "Swap splits")

-- Don't yank on delete char
set_keymap("n", "x", '"_x', "Delete char")
set_keymap("n", "X", '"_X', "Delete char")
set_keymap("v", "x", '"_x', "Delete char")
set_keymap("v", "X", '"_X', "Delete char")

-- Don't yank on visual paste
set_keymap("v", "p", '"_dP', "Paste")

set_keymap("x", "$", "g_", "Move cursor to the last non-blank character of the current line")

-- Translate
set_keymap("x", "<leader>tu", "<CMD>Translate uk<CR>", "Translate to ukrainian")
set_keymap("x", "<leader>te", "<CMD>Translate en<CR>", "Translate to english")

-- Todo
set_keymap("n", "<leader>cT", "<cmd>TodoTelescope<cr>", "Todo telescope")
set_keymap("n", "<leader>xt", "<cmd>TodoTrouble<cr>", "Todo trouble")

-- File explorer
set_keymap("n", "<leader>e", "<cmd>Neotree reveal_force_cwd filesystem toggle float<CR>", "Explorer")

-- Debug
set_keymap("n", "<leader>dc", dap.continue, "Continue")
set_keymap("n", "<pageup>", dap.continue, "Continue")
set_keymap("n", "<leader>dt", dap.toggle_breakpoint, "Toggle breakpoint")
set_keymap("n", "tt", dap.toggle_breakpoint, "Toggle breakpoint")
set_keymap("n", "<leader>du", dapui.toggle, "Toggle UI")
set_keymap("n", "<leader>da", function()
	if vim.fn.filereadable(".vscode/launch.json") then
		local dap_vscode = require("dap.ext.vscode")
		dap_vscode.load_launchjs(nil, {
			["pwa-node"] = langs,
			["chrome"] = langs,
			["pwa-chrome"] = langs,
		})
	end
	require("dap").continue()
end, "Run")

-- Folds
set_keymap("n", "zR", ufo.openAllFolds, "Open all folds")
set_keymap("n", "zM", ufo.closeAllFolds, "Close all folds")

-- Lazy
set_keymap("n", "<leader>l", "<cmd>Lazy<CR>", "Lazy")

-- Mason
set_keymap("n", "<leader>m", "<cmd>Mason<CR>", "Mason")

-- CodeSnap
set_keymap("x", "<leader>cs", ":CodeSnap<CR>", "CodeSnap")

-- Luasnip
set_keymap({ "i" }, "<C-l>", function()
	ls.expand_or_jump()
end, "Jump forward or expand a snippet")

set_keymap({ "i", "s" }, "<C-h>", function()
	ls.jump(-1)
end, "Jump backward")

set_keymap({ "i", "s" }, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, "Change active choise")

set_keymap("v", "<leader>f", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, "Format selection")

-- Linting
set_keymap("n", "<leader>xl", function()
	lint.try_lint()
end, "Lint file")

set_keymap("n", "<leader>Mt", "<cmd>Precognition toggle<CR>", "Toggle Precognition")

set_keymap("i", "<C-O>", "<esc>o", "Begin a new line below the cursor and insert text")
