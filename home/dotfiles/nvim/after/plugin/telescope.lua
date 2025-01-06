require("custom.telescope.multi-ripgrep")

local builtin = require("telescope.builtin")
local live_multigrep = require("custom.telescope.multi-ripgrep").live_multigrep
local wk = require("which-key")
local open_with_trouble = require("trouble.sources.telescope").open

wk.add({
	{ "<leader>fh", builtin.help_tags, desc = "Find help" },
	{ "<leader>fg", live_multigrep, desc = "Find help" },
	{ "<leader>fx", builtin.diagnostics, desc = "Diagnostics" },
	{
		"<leader>fd",
		function()
			builtin.find_files({
				find_command = { "fd", "--hidden", "--exclude", ".git/", "--type", "f", "--color", "never" },
			})
		end,
		desc = "Find files",
	},
	{
		"<leader>en",
		function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end,
		desc = "Find in Neovim config",
	},
	{ "<leader>lr", builtin.lsp_references, desc = "LSP references" },
	{ "<leader>ws", builtin.lsp_workspace_symbols, desc = "LSP workspace symbols" },
	{ "<leader>ds", builtin.lsp_document_symbols, desc = "LSP document symbols" },
	{ "q:", builtin.command_history, desc = "Command history" },
	{ "q/", builtin.search_history, desc = "Search history" },
	{ "z=", builtin.spell_suggest, desc = "Spelling suggestion" },
	mode = { "n" },
})

require("telescope").setup({
	-- pickers = {
	-- 	find_files = {
	-- 		theme = "ivy",
	-- 	},
	-- },
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

require("telescope").load_extension("ui-select")
require("telescope").load_extension("fzf")
