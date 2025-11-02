vim.lsp.config.clangd = {
    cmd = {
        "clangd",
        "--completion-style=detailed",
        -- "--background-index=false",
        "--clang-tidy",
    },
    filetypes = {
        "c",
        "cc",
        "cpp",
        "h",
        "hpp",
        "ixx",
        "cppm",
        "inl",
        "objc",
        "objcpp",
        "cuda",
        "proto",
    },
    root_markers = {
        ".clang-format",
        ".clangd",
        ".git",
        "compile_commands.json",
        "CMakeLists.txt",
    },
}

vim.lsp.enable("clangd")
