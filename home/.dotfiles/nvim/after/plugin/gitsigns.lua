require("gitsigns").setup({
	-- See `:help gitsigns.txt`
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
})

local wk = require("which-key")

local gs = package.loaded.gitsigns
wk.register({
	name = "Git hunk navigation",
	["]c"] = {
		function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end,
		"Next hunk",
	},
	["[c"] = {
		function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end,
		"Previous hunk",
	},
}, { mode = { "n", "v" }, expr = true })
wk.register({
	h = {
		name = "Git hunk operations",
		s = { gs.stage_hunk, "Git stage hunk" },
		r = { gs.reset_hunk, "Git reset hunk" },
		S = { gs.stage_buffer, "Git stage buffer" },
		u = { gs.undo_stage_hunk, "Git undo stage hunk" },
		R = { gs.reset_buffer, "Git reset buffer" },
		p = { gs.preview_hunk, "Git preview hunk" },
		b = {
			function()
				gs.blame_line({ full = false })
			end,
			"Git blame line",
		},
		d = { gs.diffthis, "Git diff against index" },
		D = {
			function()
				gs.diffthis("~")
			end,
			"Git diff against last commit",
		},
	},
	t = {
		name = "Git toggles",
		b = { gs.toggle_current_line_blame, "Toggle git blame line" },
		d = { gs.toggle_deleted, "Toggle git show deleted" },
	},
}, { mode = "n", prefix = "<leader>" })

wk.register({
	ih = { ":<C-U>Gitsigns select_hunk<CR>", "Select git hunk" },
}, { mode = { "o", "x" } })
