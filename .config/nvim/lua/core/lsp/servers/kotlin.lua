local root_files = {
    "settings.gradle", -- Gradle (multi-project)
    "settings.gradle.kts", -- Gradle (multi-project)
    "build.xml", -- Ant
    "pom.xml", -- Maven
    "build.gradle", -- Gradle
    "build.gradle.kts", -- Gradle
}

local common = require("core.lsp.common")
vim.lsp.config.kotlin = {
    filetypes = { "kotlin" },
    cmd = { "kotlin-language-server" },
    root_markers = root_files,
    on_attach = common.on_attach,
    capabilities = common.capabilities,
    init_options = {
        -- Enables caching and use project root to store cache data.
        storagePath = require("utils").root_pattern(unpack(root_files))(
            vim.fn.expand("%:p:h")
        ),
    },
    settings = {
        kotlin = {
            formatter = "ktlint",
            inlayHints = {
                typeHints = true,
                parameterHints = true,
                chainedHints = true,
            },
        },
    },
}
vim.lsp.enable("kotlin")
