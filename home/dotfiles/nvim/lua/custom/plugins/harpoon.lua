return {
	{
		"ThePrimeagen/harpoon",
		build = function()
			require("plenary.install").update({ with_sync = true })
		end,
	},
}
