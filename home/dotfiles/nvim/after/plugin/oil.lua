local wk = require("which-key")

require("oil").setup({
	columns = { "icon" },
	keymaps = {
		["<C-h>"] = false,
		["<C-l>"] = false,
		["<C-k>"] = false,
		["<C-j>"] = false,
		["<M-h>"] = "actions.select_split",
	},
	view_options = {
		show_hidden = true,
	},
	float = {
		padding = 10,
		max_height = 600,
		max_width = 100,
		get_win_title = function()
			return ""
		end,
	},
})

wk.add({
	{ "<leader>-", require("oil").toggle_float, desc = "Open parent directory in float" },
	mode = "n",
})
