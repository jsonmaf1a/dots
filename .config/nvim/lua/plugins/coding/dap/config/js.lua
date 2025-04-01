local dap = require("dap")

local config = {
    langs = {
        "typescript",
        "javascript",
        "typescriptreact",
        "javascriptreact",
        "vue",
        "astro",
        "svelte",
    },
}

dap.adapters.firefox = {
    type = "executable",
    command = "node",
    args = {
        vim.env.HOME
            .. "/code/debug/vscode-firefox-debug/dist/adapter.bundle.js",
    },
}

for _, lang in ipairs(config.langs) do
    dap.configurations[lang] = {
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
        },
        {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            port = 9229,
        },
        {
            type = "pwa-chrome",
            request = "launch",
            name = "Launch & Debug Chrome",
            url = function()
                local co = coroutine.running()
                return coroutine.create(function()
                    vim.ui.input({
                        prompt = "Enter URL: ",
                        default = "http://localhost:5173",
                    }, function(url)
                        if url == nil or url == "" then
                            return
                        else
                            coroutine.resume(co, url)
                        end
                    end)
                end)
            end,
            webRoot = vim.fn.getcwd(),
            protocol = "inspector",
            sourceMaps = true,
            userDataDir = false,
        },
        {
            type = "firefox",
            request = "launch",
            reAttach = true,
            name = "Launch & Debug Firefox",
            url = function()
                local co = coroutine.running()
                return coroutine.create(function()
                    vim.ui.input({
                        prompt = "Enter URL: ",
                        default = "http://localhost:5173",
                    }, function(url)
                        if url == nil or url == "" then
                            return
                        else
                            coroutine.resume(co, url)
                        end
                    end)
                end)
            end,
            preLaunchTask = "npm: dev",
            protocol = "inspector",
            sourceMaps = true,
            userDataDir = false,
            webRoot = "${workspaceFolder}",
            firefoxExecutable = "/usr/bin/firefox",
            profile = "default",
        },
        {
            type = "pwa-node",
            request = "launch",
            cwd = "${workspaceFolder}",
            name = "Debug NestJS",
            runtimeExecutable = "npm",
            runtimeArgs = { "run", "start:debug", "--", "--inspect-brk" },
            autoAttachChildProcesses = true,
            restart = true,
            sourceMaps = true,
            stopOnEntry = false,
            resolveSourceMapLocations = {
                "${workspaceFolder}/**",
                "!**/node_modules/**",
            },
        },
    }
end

return config
