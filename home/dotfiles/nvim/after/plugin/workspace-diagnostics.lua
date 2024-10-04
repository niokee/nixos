vim.api.nvim_set_keymap("n", "<leader>xw", "", {
	noremap = true,
	callback = function()
		for _, client in ipairs(vim.lsp.get_clients()) do
			require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
		end
	end,
})

require("which-key").add({
	{
		"<leader>xw",
		desc = "Populate workspace diagnostics",
	},
})
