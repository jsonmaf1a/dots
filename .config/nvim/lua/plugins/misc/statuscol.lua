return {
	"luukvbaal/statuscol.nvim",
	opts = function()
		local builtin = require("statuscol.builtin")
		return {
			setopt = true,
			-- override the default list of segments with:
			-- number-less fold indicator, then signs, then line number & separator
			segments = {
				{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
				{ text = { "%s" }, click = "v:lua.ScSa" },
				{
					text = { builtin.lnumfunc, " " },
					condition = { true, builtin.not_empty },
					click = "v:lua.ScLa",
				},
			},
		}
	end,
}
