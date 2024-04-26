vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
local wk = require("which-key")
wk.register({
	z = {
		name = "Folds",
		R = { require("ufo").openAllFolds, "Open all folds" },
		M = { require("ufo").closeAllFolds, "Close all folds" },
		r = { require("ufo").openFoldsExceptKinds, "Open all folds except kinds" },
		m = { require("ufo").closeFoldsWith, "Close all folds with" },
	},
}, {
	mode = "n",
})

require("ufo").setup()
