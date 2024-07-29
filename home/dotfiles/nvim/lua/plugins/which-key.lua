return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 1000
		end,
		opts = {
			plugins = {
				spelling = {
					enabled = false,
				},
			},
			win = {
				winblend = 10,
			},
			triggers_no_wait = {
				"`",
				"'",
				"g`",
				"g'",
			},
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
}
