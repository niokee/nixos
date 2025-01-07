return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		opts = {},
		config = function()
			require("ufo").setup()
		end,
	},
}
