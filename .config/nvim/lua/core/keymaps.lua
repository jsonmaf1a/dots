local set_keymap = require("utils").set_keymap

local dap = require("dap")
local dapui = require("dapui")
local langs = require("plugins.coding.dap.config.js").langs
local trouble = require("trouble")
local picker = require("snacks").picker
local ufo = require("ufo")
local splits = require("smart-splits")
local ls = require("luasnip")
local conform = require("conform")
local features = require("core.features")

-- Clear search with <esc>
set_keymap(
    { "i", "n" },
    "<esc>",
    "<cmd>Fidget clear<cr><cmd>noh<cr><esc>",
    "Escape and clear hlsearch"
)

-- Navigation in insert mode
set_keymap("i", "<A-k>", "<Up>", "Up")
set_keymap("i", "<A-j>", "<Down>", "Down")
set_keymap("i", "<A-l>", "<Right>", "Right")
set_keymap("i", "<A-h>", "<Left>", "Left")

-- Better motions
set_keymap(
    { "n", "o", "x" },
    "w",
    "<cmd>lua require('spider').motion('w')<CR>",
    "Spider-w"
)
set_keymap(
    { "n", "o", "x" },
    "e",
    "<cmd>lua require('spider').motion('e')<CR>",
    "Spider-e"
)
set_keymap(
    { "n", "o", "x" },
    "b",
    "<cmd>lua require('spider').motion('b')<CR>",
    "Spider-b"
)

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
set_keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Actions")
set_keymap("n", "K", vim.lsp.buf.hover, "Show docs")
set_keymap("n", "<leader>cD", vim.lsp.buf.declaration, "Go to declaration")
set_keymap("n", "<leader>cr", picker.lsp_references, "References")

set_keymap("n", "]d", function()
    features.diagnostic.jump(1)
end, "Go to next diagnostic")
set_keymap("n", "[d", function()
    features.diagnostic.jump(-1)
end, "Go to previous diagnostic")

-- set_keymap("n", "]d", ":lua vim.diagnostic.jump({ count = 1, float = true })<CR>", "Go to next diagnostic")
-- set_keymap("n", "[d", ":lua vim.diagnostic.jump({ count = -1, float = true })<CR>", "Go to previous diagnostic")

set_keymap("n", "<leader>cq", ":LspRestart<CR>", "Restart LSP")
-- set_keymap("n", "<leader>cX", vim.diagnostic.open_float, "Line diagnostics")
set_keymap("n", "<leader>cn", vim.lsp.buf.rename, "Smart rename")
set_keymap("n", "gd", picker.lsp_definitions, "Definitions")
set_keymap("n", "gi", picker.lsp_implementations, "Implementations")
set_keymap("n", "gt", picker.lsp_type_definitions, "Type definitions")
set_keymap("n", "<leader>ci", picker.lsp_implementations, "Implementations")
set_keymap("n", "<leader>cd", picker.lsp_definitions, "Definitions")
set_keymap("n", "<leader>ct", picker.lsp_type_definitions, "Type definitions")
set_keymap("n", "<leader>cx", picker.diagnostics_buffer, "Buffer diagnostics")
set_keymap("n", "<leader>cX", picker.diagnostics, "Diagnostics")
set_keymap(
    "n",
    "<leader>ch",
    "<cmd>LspClangdSwitchSourceHeader<CR>",
    "[clangd] Switch between header and source"
)

set_keymap("n", "<Leader>cI", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, "Toggle inlay hints")

set_keymap(
    "n",
    "<leader>cR",
    "<cmd>TSToolsFileReferences<CR>",
    "[tstools] File references"
)
set_keymap(
    "n",
    "<leader>co",
    "<cmd>TSToolsOrganizeImports<CR>",
    "[tstools] Organize imports"
)
set_keymap(
    "n",
    "<leader>cu",
    "<cmd>TSToolsRemoveUnusedImports<CR>",
    "[tstools] Remove unused imports"
)
set_keymap(
    "n",
    "<leader>cm",
    "<cmd>TSToolsAddMissingImports<CR>",
    "[tstools] Add missing imports"
)

-- Picker
set_keymap("n", "<leader><Space>", picker.resume, "Resume last search")
set_keymap("n", "<leader>F", picker.grep, "Smart find files")
set_keymap("n", "<leader>,", picker.buffers, "Buffers")
set_keymap("n", "<leader>f/", picker.smart, "Live grep")
set_keymap("n", "<leader>fb", picker.buffers, "Buffers")
set_keymap("n", "<leader>fg", picker.grep_buffers, "Live grep buffers")
set_keymap("n", "<leader>ff", picker.files, "Find files")
set_keymap("n", "<leader>fh", picker.help, "Help")
set_keymap("n", "<leader>fi", picker.highlights, "Highlights")
set_keymap("n", "<leader>fc", picker.icons, "Icons")
set_keymap("n", "<leader>fk", picker.keymaps, "Keymaps")
set_keymap("n", "<leader>fM", picker.man, "Man")
set_keymap("n", "<leader>fm", picker.marks, "Marks")
set_keymap("n", "<leader>fn", picker.notifications, "Notifications")
set_keymap("n", "<leader>fH", picker.search_history, "Resume last search")
set_keymap("n", "<leader>fs", picker.spelling, "Spell suggestions")
set_keymap("n", "<leader>fu", picker.undo, "Undo")
set_keymap("n", "<leader>fz", picker.zoxide, "Zoxide")
set_keymap("n", "<leader>a", picker.lsp_symbols, "Zoxide")

-- Git
set_keymap("n", "<leader>gb", picker.git_branches, "Git branches")
set_keymap("n", "<leader>gs", picker.git_status, "Git status")
set_keymap("n", "<leader>gt", picker.git_stash, "Git stash")
set_keymap("n", "<leader>gf", picker.git_files, "Git files")
set_keymap("n", "<leader>gg", picker.git_grep, "Git grep")
set_keymap("n", "<leader>gl", picker.git_log, "Git log")
set_keymap("n", "<leader>gL", picker.git_log_line, "Git log line")
set_keymap("n", "<leader>gd", picker.git_diff, "Git stash")

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

set_keymap("n", "<leader>xq", function()
    trouble.toggle("quickfix")
end, "Quick fix")

set_keymap("n", "<leader>xl", function()
    trouble.toggle("loclist")
end, "Location list")

set_keymap("n", "<leader>xa", function()
    trouble.toggle("symbols")
end, "LSP Symbols")

-- Resize
set_keymap("n", "<C-Up>", "<cmd>SmartResizeUp<cr>", "Increase window height")
set_keymap("n", "<A-k>", "<cmd>SmartResizeUp<cr>", "Increase window height")
set_keymap(
    "n",
    "<C-Down>",
    "<cmd>SmartResizeDown<cr>",
    "Decrease window height"
)
set_keymap("n", "<A-j>", "<cmd>SmartResizeDown<cr>", "Decrease window height")
set_keymap(
    "n",
    "<C-Right>",
    "<cmd>SmartResizeRight<cr>",
    "Increase window width"
)
set_keymap("n", "<A-l>", "<cmd>SmartResizeRight<cr>", "Increase window width")
set_keymap("n", "<C-Left>", "<cmd>SmartResizeLeft<cr>", "Decrease window width")
set_keymap("n", "<A-h>", "<cmd>SmartResizeLeft<cr>", "Decrease window width")

set_keymap(
    "n",
    "<leader>bd",
    "<Cmd>lua MiniBufremove.delete()<CR>",
    "Close current buffer"
)

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
set_keymap("n", "<leader>uc", picker.colorschemes, "Colorscheme")

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

set_keymap(
    "x",
    "$",
    "g_",
    "Move cursor to the last non-blank character of the current line"
)

-- Translate
set_keymap(
    "x",
    "<leader>mtu",
    "<CMD>Translate uk<CR>",
    "Translate to ukrainian"
)
set_keymap("x", "<leader>mte", "<CMD>Translate en<CR>", "Translate to english")

-- Todo
set_keymap("n", "<leader>xt", "<cmd>TodoTrouble<cr>", "Todo trouble")

-- File explorer
set_keymap(
    "n",
    "<leader>e",
    "<cmd>Neotree reveal_force_cwd filesystem toggle<CR>",
    "Explorer"
)

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

-- Nerdy
set_keymap("n", "<leader>mn", "<cmd>Nerdy<CR>", "Nerdy")

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

set_keymap(
    "i",
    "<C-O>",
    "<esc>o",
    "Begin a new line below the cursor and insert text"
)

set_keymap("n", "<leader>\\", features.term.toggle, "Toggle floating terminal")
set_keymap("t", "<esc><esc>", "<c-\\><c-n>", "Exit terminal mode")
