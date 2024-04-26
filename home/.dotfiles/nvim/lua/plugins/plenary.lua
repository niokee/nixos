local M = {
	"ThePrimeagen/harpoon",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
}

return { M }
