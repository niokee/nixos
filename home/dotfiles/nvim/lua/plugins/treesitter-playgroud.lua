local M = {
	"nvim-treesitter/playground",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
}

return { M }
