local options = {
    clipboard = "unnamed,unnamedplus",
    encoding = "utf-8",
    fileencoding = "utf-8",
    signcolumn = "yes:1",
    cmdheight = vim.g.CONFIG.hide_cmdline and 0 or 1,
    winborder = vim.g.CONFIG.border,
    swapfile = false,
    writebackup = false,
    completeopt = "menu,menuone,noselect",
    wildignore = "*node_modules/**",
    cursorline = false,
    splitright = true,
    undofile = true,
    emoji = false,
    wrap = false,
    number = true,
    relativenumber = vim.g.CONFIG.relative_number,
    scrolloff = 8,
    showtabline = 0,
    ignorecase = true,
    smartcase = true,
    smarttab = true,
    smartindent = true,
    autoindent = true,
    termguicolors = true,
    expandtab = true,
    pumheight = 10,
    laststatus = 3,
    tabstop = vim.g.CONFIG.indent,
    shiftwidth = vim.g.CONFIG.indent,
    softtabstop = vim.g.CONFIG.indent,
    backspace = "indent,eol,start",
    viminfo = "'1000",
    backup = false,
    conceallevel = 2,
    concealcursor = "",
    errorbells = false,
    incsearch = true,
    showmode = vim.g.CONFIG.showmode,
    foldenable = true,
    foldcolumn = "0",
    foldnestmax = 0,
    foldlevel = 99, -- ufo provider requires a large value
    foldlevelstart = 99,
    foldmethod = "expr",
    foldexpr = "v:lua.vim.lsp.foldexpr()",
    updatetime = 100,
    timeoutlen = 200,
    mouse = vim.g.CONFIG.enable_mouse and "a" or "",
    -- mousemoveevent = vim.g.CONFIG.enable_mouse,
    langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz",
}

local globals = {
    mapleader = " ",
    maplocalleader = ";",
    starry_italic_comments = true,
    skip_ts_context_commentstring_module = true,
    loaded_netrw = 1,
    loaded_netrwPlugin = 1,
}

vim.opt.fillchars:append("eob: ")
vim.opt.fillchars:append("fold: ")
vim.opt.fillchars:append("foldopen:")
vim.opt.fillchars:append("foldsep: ")
vim.opt.fillchars:append("foldclose:")

for k, v in pairs(options) do
    vim.opt[k] = v
end

for k, v in pairs(globals) do
    vim.g[k] = v
end
