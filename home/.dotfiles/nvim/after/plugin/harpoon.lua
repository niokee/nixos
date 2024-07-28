local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local wk = require("which-key")

wk.add({
    { "<c-e>", ui.toggle_quick_menu, desc = "Toggle quick menu" },
    {"<c-h>",
		function()
			ui.nav_file(1)
		end,
		desc = "Move to first file",
	},
    {"<c-j>",
		function()
			ui.nav_file(2)
		end,
		desc = "Move to second file",
	},
    {"<c-k>",
		function()
			ui.nav_file(3)
		end,
		desc = "Move to third file",
	},
    {"<c-l>",
		function()
			ui.nav_file(4)
		end,
		desc = "Move to fourth file",
	},
    {"<leader>a", mark.add_file, desc = "Add file to harpoon" },
	mode = { "n" },
})
