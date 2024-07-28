vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
local wk = require("which-key")
wk.add({
    {"zR", require("ufo").openAllFolds, desc = "Open all folds" },
    {"zM", require("ufo").closeAllFolds, desc = "Close all folds" },
    {"zr", require("ufo").openFoldsExceptKinds, desc = "Open all folds except kinds" },
    {"zm", require("ufo").closeFoldsWith, desc = "Close all folds with" },
	mode = { "n" },
})

require("ufo").setup()
