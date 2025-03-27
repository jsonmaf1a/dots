local capabilities = require("core.lsp.common").capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.colorProvider = { dynamicRegistration = false }
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

vim.lsp.config.tailwindcss = {
	cmd = { "tailwindcss" },
	filetypes = {
		"html",
		"mdx",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"vue",
		"svelte",
		"solidjs",
		"solid",
	},
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		if client.server_capabilities.colorProvider then
			require("colorizer").attach_to_buffer(
				bufnr,
				{ mode = "background", css = true, names = false, tailwind = false }
			)
		end
	end,
	settings = {
		tailwindCSS = {
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidConfigPath = "error",
				invalidScreen = "error",
				invalidTailwindDirective = "error",
				invalidVariant = "error",
				recommendedVariantOrder = "warning",
			},
			experimental = {
				classRegex = {
					"tw`([^`]*)",
					'tw="([^"]*)',
					'tw={"([^"}]*)',
					"tw\\.\\w+`([^`]*)",
					"tw\\(.*?\\)`([^`]*)",
					{ "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
					{ "classnames\\(([^)]*)\\)", "'([^']*)'" },
					{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
					{ "cn\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
				},
			},
			validate = true,
		},
	},
}

vim.lsp.enable("tailwindcss")
