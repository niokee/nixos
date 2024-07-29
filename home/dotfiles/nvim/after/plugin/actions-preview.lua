require("actions-preview").setup({
	-- options for vim.diff(): https://neovim.io/doc/user/lua.html#vim.diff()
	diff = {
		ctxlen = 15,
	},

	highlight_command = {
		require("actions-preview.highlight").delta("delta --side-by-side --line-numbers --syntax-theme TwoDark"),
	},
	backend = { "telescope" },
	telescope = {
		sorting_strategy = "ascending",
		layout_strategy = "vertical",
		layout_config = {
			width = 0.8,
			height = 0.9,
			prompt_position = "top",
			preview_cutoff = 20,
			preview_height = function(_, _, max_lines)
				return max_lines - 15
			end,
		},
	},
})
