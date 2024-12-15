return {
	"noti-rs/noti.nvim",
	build = "python3 clone_queries.py",
	opts = {},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
}
