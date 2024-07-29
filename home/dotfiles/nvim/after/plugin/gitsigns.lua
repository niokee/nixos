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
wk.add({
    {"]c",
		function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end,
		desc = "Next hunk",
	},
	{"[c" ,
		function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end,
		desc = "Previous hunk",
	},
    mode = { "n", "v" },
})
wk.add({
    {"<leader>hs", gs.stage_hunk, desc = "Git stage hunk" },
    {"<leader>hr", gs.reset_hunk, desc = "Git reset hunk" },
    {"<leader>hS", gs.stage_buffer, desc = "Git stage buffer" },
    {"<leader>hu", gs.undo_stage_hunk, desc = "Git undo stage hunk" },
    {"<leader>hR", gs.reset_buffer, desc = "Git reset buffer" },
    {"<leader>hp", gs.preview_hunk, desc = "Git preview hunk" },
    {"<leader>hb",
			function()
				gs.blame_line({ full = false })
			end,
		desc =	"Git blame line",
		},
    {"<leader>hd", gs.diffthis, desc = "Git diff against index" },
    {"<leader>hD",
			function()
				gs.diffthis("~")
			end,
			desc = "Git diff against last commit",
		},
    {"<leader>htb", gs.toggle_current_line_blame, desc = "Toggle git blame line" },
    {"<leader>htd", gs.toggle_deleted, desc = "Toggle git show deleted" },
    mode = { "n" }
})


wk.add({
    {"ih", ":<C-U>Gitsigns select_hunk<CR>", desc = "Select git hunk" },
    mode = { "o", "x" },
})
