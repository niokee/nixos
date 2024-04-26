local builtin = require("telescope.builtin")
local wk = require("which-key")

wk.register({
	name = "Telescope pickers",
	p = {
		g = { builtin.git_files, "Find git files" },
		s = { builtin.live_grep, "Live grep" },
		t = { builtin.diagnostics, "Diagnostics" },
		f = { builtin.find_files, "Find files" },
		c = { builtin.commands, "Commands" },
	},
}, {
	mode = "n",
	prefix = "<leader>",
})

wk.register({
	name = "LSP pickers",
	v = {
		rr = { builtin.lsp_references, "LSP references" },
		ws = { builtin.lsp_workspace_symbols, "LSP workspace symbols" },
		ds = { builtin.lsp_document_symbols, "LSP document symbols" },
	},
}, {
	mode = "n",
	prefix = "<leader>",
})
wk.register({
	name = "Neovim pickers",
	["q:"] = { builtin.command_history, "Command history" },
	["q/"] = { builtin.search_history, "Search history" },
}, {
	mode = "n",
})

-- Ideas
wk.register({
	name = "Spelling",
	["z="] = { builtin.spell_suggest, "Spelling suggestion" },
}, {
	mode = "n",
})
require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),
		},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
	},
})
require("telescope").load_extension("ui-select")
require("telescope").load_extension("fzf")
