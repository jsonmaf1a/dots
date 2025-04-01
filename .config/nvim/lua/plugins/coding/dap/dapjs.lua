return {
    {
        "microsoft/vscode-js-debug",
        build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
        version = "1.*",
    },
    {
        "mxsdev/nvim-dap-vscode-js",
        dependencies = {
            {
                "Joakker/lua-json5",
                build = "./install.sh",
                config = function()
                    table.insert(vim._so_trails, "/?.dylib")
                end,
            },
        },
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require("dap-vscode-js").setup({
                debugger_path = vim.fn.resolve(
                    vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"
                ),
                adapters = {
                    "chrome",
                    "pwa-node",
                    "pwa-chrome",
                    "pwa-msedge",
                    "pwa-extensionHost",
                    "node-terminal",
                },
            })
        end,
    },
}
