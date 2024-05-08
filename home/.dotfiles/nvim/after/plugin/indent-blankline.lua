local highlight = {
	"IblIndent",
}


vim.api.nvim_set_hl(0, "IblIndent", { fg = "#343436" })

require("ibl").setup({
	indent = { highlight = highlight },
	whitespace = {
		highlight = highlight,
		remove_blankline_trail = false,
	},
	scope = { enabled = false },
})
