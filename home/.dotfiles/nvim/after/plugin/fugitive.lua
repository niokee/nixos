local wk = require("which-key")
wk.register({
	["<leader>gs"] = { vim.cmd.Git, "Git status" },
}, { mode = "n" })
