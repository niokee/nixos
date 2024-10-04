require("todo-comments").setup({
	highlight = {
		-- Highlight TODO(name)
		pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):]],
	},
	search = {
		-- ripgrep regex, supporting the pattern TODO(name)
		pattern = [[\b(KEYWORDS)(\([\w ]*\))*:]],
	},
})
local wk = require("which-key")

wk.add({
	{
		"]t",
		function()
			require("todo-comments").jump_next()
		end,
		desc = "Next todo comment",
	},
	{
		"[t",
		function()
			require("todo-comments").jump_prev()
		end,
		desc = "Previous todo comment",
	},
	mode = { "n" },
})
