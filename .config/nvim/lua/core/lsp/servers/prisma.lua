vim.lsp.config.prisma = {
    filetypes = { "prisma" },
    cmd = { "prisma-language-server", "--stdio" },
    root_markers = { ".git", "package.json" },
    settings = {
        prisma = {
            prismaFmtBinPath = "",
        },
    },
}

vim.lsp.enable("prisma")
