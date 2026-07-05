return {
    bash = function ()
        return {
            filetypes = { "sh", "bash" },
            cmd = { "bash-language-server", "start" },
        }
    end,
    emmet = function ()
        return{
            filetypes = { "html", "typescriptreact", "javascriptreact", "svelte" },
            cmd = { "emmet-language-server", "--stdio" },
        }
    end
}
