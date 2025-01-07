local wk = require("which-key")
require("avante").setup()

wk.add({
	{ "<leader>gpt", "<cmd>AvanteAsk<CR>" },
	mode = "n",
})
