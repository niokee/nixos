require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "lua", "vim", "query", "python", "rust", "go", "javascript", "typescript" },
	-- Insta parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	indent = { enable = true },

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
require("nvim-treesitter.install").compilers = { "clang", "cc" }
vim.filetype.add({
	extension = {
		templ = "templ",
	},
})
