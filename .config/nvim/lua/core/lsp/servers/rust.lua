local common = require("core.lsp.common")

vim.lsp.config.rust = {
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	handlers = common.handlers,
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	-- root_dir = function(fname)
	-- 	local cargo_crate_dir = util.root_pattern("Cargo.toml")(fname)
	-- 	local cmd = "cargo metadata --no-deps --format-version 1"
	-- 	if cargo_crate_dir ~= nil then
	-- 		cmd = cmd .. " --manifest-path " .. util.path.join(cargo_crate_dir, "Cargo.toml")
	-- 	end
	-- 	local cargo_metadata = vim.fn.system(cmd)
	-- 	local cargo_workspace_dir = nil
	-- 	if vim.v.shell_error == 0 then
	-- 		cargo_workspace_dir = vim.fn.json_decode(cargo_metadata)["workspace_root"]
	-- 	end
	-- 	return cargo_workspace_dir
	-- 		or cargo_crate_dir
	-- 		or util.root_pattern("rust-project.json")(fname)
	-- 		or util.find_git_ancestor(fname)
	-- end,
	root_markers = { "Cargo.toml", "Cargo.lock", "rustfmt.toml" },
}

vim.lsp.enable("rust")
