require("neo-tree").setup({
	filesystem = {
		hijack_netrw_behavior = "open_current",
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
})
