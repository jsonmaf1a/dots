return {
    biome = function(cfg)
        return {
            capabilities = cfg.get_capabilities(),
            cmd = { "biome", "lsp-proxy" },
            root_markers = { "biome.json", "biome.jsonc" },
            filetypes = {
                "astro", "css", "graphql", "javascript", "javascriptreact",
                "json", "jsonc", "svelte", "typescript", "typescript.tsx",
                "typescriptreact", "vue",
            },
        }
    end,

    tsgo = function(cfg)
        return {
            capabilities = cfg.get_capabilities(),
            cmd = { "tsgo", "--lsp", "--stdio" },
            root_markers = {
                "package.json", "node_modules", "biome.json",
                "tsconfig.json", "vite.config.ts", "vite.config.js",
            },
            filetypes = {
                "javascript", "javascriptreact", "typescript",
                "typescript.tsx", "typescriptreact",
            },
            on_attach = function(client)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end,
        }
    end,
}
