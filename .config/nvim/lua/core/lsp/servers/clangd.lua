local common = require("core.lsp.common")

vim.lsp.config.clangd = {
	cmd = {
		"clangd",
		"--completion-style=detailed",
		"--background-index=false",
		"--experimental-modules-support",
		"--clang-tidy",
		"--query-driver=/usr/bin/g++", -- Use GCC 14's standard library
		"--header-insertion=never",
	},
	filetypes = { "c", "cc", "cpp", "h", "hpp", "ixx", "cppm", "inl", "objc", "objcpp", "cuda", "proto" },
	root_markers = { ".clang-format", ".git", "compile_commands.json", "CMakeLists.txt" },
}

vim.lsp.enable("clangd")
