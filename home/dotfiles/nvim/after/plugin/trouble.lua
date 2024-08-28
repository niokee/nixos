require("trouble").setup({
    focus = true,
	win = {
		position = "right",
		size = { width = 0.3 },
	},
	preview = {
		type = "split",
		relative = "win",
		position = "bottom",
		size = 0.4,
	},
})

require("which-key").add({
	{
		"<leader>xx",
		"<cmd>Trouble diagnostics toggle<cr>",
		desc = "Diagnostics (Trouble)",
	},
	{
		"<leader>xX",
		"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		desc = "Buffer Diagnostics (Trouble)",
	},
	{
		"<leader>cs",
		"<cmd>Trouble symbols toggle<cr>",
		desc = "Symbols (Trouble)",
	},
	{
		"<leader>cl",
		"<cmd>Trouble lsp toggle <cr>",
		desc = "LSP Definitions / references / ... (Trouble)",
	},
	{
		"<leader>xL",
		"<cmd>Trouble loclist toggle<cr>",
		desc = "Location List (Trouble)",
	},
	{
		"<leader>xQ",
		"<cmd>Trouble qflist toggle<cr>",
		desc = "Quickfix List (Trouble)",
	},
})
