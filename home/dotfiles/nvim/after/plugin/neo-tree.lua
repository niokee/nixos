require("neo-tree").setup({
	-- Use this to add more results without clearing the trouble list
	filesystem = {
		hijack_netrw_behavior = "open_current",
		filtered_items = {
			hide_hidden = false,
			hide_dotfiles = false,
			hide_gitignored = true,
			never_show = {
				".git",
			},
		},
	},
	event_handlers = {
		{
			event = "neo_tree_buffer_enter",
			handler = function(arg)
				vim.cmd([[
                    setlocal relativenumber
                ]])
			end,
		},
	},
	window = {
		mappings = {
			["<esc>"] = "cancel",
		},
	},
})
