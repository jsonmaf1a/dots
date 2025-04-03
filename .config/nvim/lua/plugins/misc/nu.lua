return {
    "nushell/tree-sitter-nu",
    build = ":TSUpdate nu",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
}
