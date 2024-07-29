local wk = require("which-key")
wk.register({
	["<leader>u"] = { vim.cmd.UndotreeToggle, "Toggle undotree" },
})
