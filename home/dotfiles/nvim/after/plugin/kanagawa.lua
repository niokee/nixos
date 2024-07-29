require("kanagawa").setup({
	overrides = function(colors)
		return {
			-- Assign a static color to strings
			Constant = { fg = colors.palette.lotusOrange2 },
		}
	end,
})
