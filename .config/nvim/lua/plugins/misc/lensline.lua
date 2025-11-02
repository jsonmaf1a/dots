return {
    "oribarilan/lensline.nvim",
    tag = "1.1.2",
    event = "LspAttach",
    config = function()
        require("lensline").setup({
            limits = {
                exclude = {
                    ".h",
                    ".hpp",
                },
            },
        })
    end,
}
