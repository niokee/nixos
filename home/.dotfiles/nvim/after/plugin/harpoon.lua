local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local wk = require("which-key")

wk.register({
	name = "harpoon",
	["<c-e>"] = { ui.toggle_quick_menu, "Toggle quick menu" },
	["<c-h>"] = {
		function()
			ui.nav_file(1)
		end,
		"Move to first file",
	},
	["<c-j>"] = {
		function()
			ui.nav_file(2)
		end,
		"Move to second file",
	},
	["<c-k>"] = {
		function()
			ui.nav_file(3)
		end,
		"Move to third file",
	},
	["<c-l>"] = {
		function()
			ui.nav_file(4)
		end,
		"Move to fourth file",
	},
	["<leader>"] = {
		a = { mark.add_file, "Add file to harpoon" },
	},
}, {
	mode = "n",
})
