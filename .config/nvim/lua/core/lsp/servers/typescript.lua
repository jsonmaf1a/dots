local common = require("core.lsp.common")

require("typescript-tools").setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	handlers = common.handlers,
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "svelte", "astro" },
	root_markers = { "package.json", "node_modules", "biome.json", "tsconfig.json", "vite.config.ts", "vite.config.js" },
	settings = {
		-- Performance settings
		separate_diagnostic_server = true,
		publish_diagnostic_on = "insert_leave",
		tsserver_max_memory = "auto",

		-- Formatting preferences (from default_format_options)
		tsserver_format_options = {
			includeInlayParameterNameHints = "all",
			includeCompletionsForModuleExports = true,
			quotePreference = "auto",
			insertSpaceAfterCommaDelimiter = true,
			insertSpaceAfterConstructor = false,
			insertSpaceAfterSemicolonInForStatements = true,
			insertSpaceBeforeAndAfterBinaryOperators = true,
			insertSpaceAfterKeywordsInControlFlowStatements = true,
			insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
			insertSpaceBeforeFunctionParenthesis = false,
			insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = false,
			insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
			insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
			insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = true,
			insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = false,
			insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = false,
			insertSpaceAfterTypeAssertion = false,
			placeOpenBraceOnNewLineForFunctions = false,
			placeOpenBraceOnNewLineForControlBlocks = false,
			semicolons = "ignore",
			indentSwitchCase = true,
		},

		-- File preferences (combining your inlay hints with default preferences)
		tsserver_file_preferences = {
			-- Your current inlay hint settings
			includeInlayParameterNameHints = "all",
			includeInlayParameterNameHintsWhenArgumentMatchesName = true,
			includeInlayFunctionParameterTypeHints = true,
			includeInlayVariableTypeHints = false,
			includeInlayVariableTypeHintsWhenTypeMatchesName = false,
			includeInlayPropertyDeclarationTypeHints = false,
			includeInlayFunctionLikeReturnTypeHints = false,
			includeInlayEnumMemberValueHints = true,

			-- Important default preferences
			quotePreference = "auto",
			importModuleSpecifierEnding = "auto",
			jsxAttributeCompletionStyle = "auto",
			allowTextChangesInNewFiles = true,
			providePrefixAndSuffixTextForRename = true,
			allowRenameOfImportPath = true,
			includeAutomaticOptionalChainCompletions = true,
			provideRefactorNotApplicableReason = true,
			generateReturnInDocTemplate = true,
			includeCompletionsForImportStatements = true,
			includeCompletionsWithSnippetText = true,
			includeCompletionsWithClassMemberSnippets = true,
			includeCompletionsWithObjectLiteralMethodSnippets = true,
			useLabelDetailsInCompletionEntries = true,
			allowIncompleteCompletions = true,
			displayPartsForJSDoc = true,
			disableLineTextInReferences = true,
		},

		-- Feature settings
		expose_as_code_action = "all",
		include_completions_with_insert_text = true,
		complete_function_calls = false,
		code_lens = "implementations_only",
		jsx_close_tag = {
			enable = false,
			filetypes = { "javascriptreact", "typescriptreact" },
		},
	},
})
