require("todo-comments").setup({})
local wk = require("which-key")

wk.register({
	["]t"] = {
		function()
			require("todo-comments").jump_next()
		end,
		"Next todo comment",
	},
	["[t"] = {
		function()
			require("todo-comments").jump_prev()
		end,
		"Previous todo comment",
	},
}, { mode = "n" })
