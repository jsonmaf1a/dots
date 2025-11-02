local utils = require("utils")

vim.lsp.config.biome = {
    filetypes = {
        "astro",
        "css",
        "graphql",
        "javascript",
        "javascriptreact",
        "json",
        "jsonc",
        "svelte",
        "typescript",
        "typescript.tsx",
        "typescriptreact",
        "vue",
    },
    cmd = { "biome", "lsp-proxy" },
    -- root_markers = { "biome.json", "biome.jsonc" },
    root_dir = function(fname)
        -- Ensure fname is a path, not a buffer number
        if type(fname) == "number" then
            fname = vim.api.nvim_buf_get_name(fname)
        end

        local root_files = { "biome.json", "biome.jsonc" }
        root_files = utils.insert_package_json(root_files, "biome", fname)

        local found =
            vim.fs.find(root_files, { path = fname, upward = true })[1]
        if found then
            return vim.fs.dirname(found)
        end
    end,
}
vim.lsp.enable("biome")

-- vim.lsp.config.tsgo = {
-- 	filetypes = {
-- 		"javascript",
-- 		"javascriptreact",
-- 		"typescript",
-- 		"typescript.tsx",
-- 		"typescriptreact",
-- 	},
-- 	cmd = { vim.env.HOME .. "/repos/typescript-go/built/local/tsgo", "lsp", "--stdio" },
-- 	root_markers = {
-- 		"package.json",
-- 		"node_modules",
-- 		"biome.json",
-- 		"tsconfig.json",
-- 		"vite.config.ts",
-- 		"vite.config.js",
-- 	},
-- }
-- vim.lsp.enable("tsgo")

local ok, tstools = pcall(require, "typescript-tools")
if ok then
    local common = require("core.lsp.common")

    tstools.setup({
        on_attach = common.on_attach,
        capabilities = common.capabilities,
        handlers = common.handlers,
        init_options = { hostInfo = "neovim" },
        filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
        },
        root_markers = {
            "package.json",
            "node_modules",
            "biome.json",
            "tsconfig.json",
            "vite.config.ts",
            "vite.config.js",
        },
        settings = {
            separate_diagnostic_server = true,
            publish_diagnostic_on = "insert_leave",
            tsserver_max_memory = "auto",

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

            tsserver_file_preferences = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = false,
                includeInlayFunctionLikeReturnTypeHints = false,
                includeInlayEnumMemberValueHints = true,

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
            expose_as_code_action = "all",
            include_completions_with_insert_text = true,
            complete_function_calls = false,
            code_lens = "off",
            disable_member_code_lens = true,
            jsx_close_tag = {
                enable = false,
                filetypes = { "javascriptreact", "typescriptreact" },
            },
        },
    })
end
