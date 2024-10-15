local builtin = require("telescope.builtin")
local wk = require("which-key")
local open_with_trouble = require("trouble.sources.telescope").open

wk.add({
	{ "<leader>pg", builtin.git_files, desc = "Find git files" },
	{ "<leader>ps", builtin.live_grep, desc = "Live grep" },
	{ "<leader>px", builtin.diagnostics, desc = "Diagnostics" },
	{
		"<leader>pf",
		function()
			builtin.find_files({
				find_command = { "fd", "--hidden", "--exclude", ".git/", "--type", "f", "--color", "never" },
			})
		end,
		desc = "Find files",
	},
	{ "<leader>pc", builtin.commands, desc = "Commands" },
	mode = { "n" },
})

wk.add({
	{ "<leader>vrr", builtin.lsp_references, desc = "LSP references" },
	{ "<leader>vws", builtin.lsp_workspace_symbols, desc = "LSP workspace symbols" },
	{ "<leader>vds", builtin.lsp_document_symbols, desc = "LSP document symbols" },
	mode = { "n" },
})
wk.add({
	{ "q:", builtin.command_history, desc = "Command history" },
	{ "q/", builtin.search_history, desc = "Search history" },
	mode = { "n" },
})

wk.add({
	{ "z=", builtin.spell_suggest, desc = "Spelling suggestion" },
	mode = { "n" },
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
	defaults = {
		mappings = {
			i = { ["<c-t>"] = open_with_trouble },
			n = { ["<c-t>"] = open_with_trouble },
		},
	},
})
require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("ui-select")
require("telescope").load_extension("fzf")
