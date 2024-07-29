local wk = require("which-key")
wk.register({
	name = "File switching",
	["<leader>pv"] = { "<cmd>Neotree filesystem reveal float<CR>", "Open file tree" },
}, {
	mode = "n",
})
wk.register({
	name = "Line manipulation",
	J = { ":m '>+1<CR>gv=gv", "Move line down" },
	K = { ":m '<-2<CR>gv=gv", "Move line up" },
}, {
	mode = "v",
})
wk.register({
	name = "Movement",
	n = { "nzzzv", "Move to next search result" },
	N = { "Nzzzv", "Move to previous search result" },
	["<c-d>"] = { "<C-d>zz", "Move down half page" },
	["<c-u>"] = { "<C-u>zz", "Move up half page" },
	["<M-j>"] = { "<cmd>cprev<CR>zz", "Move to previous quickfix result" },
	["<M-k>"] = { "<cmd>cnext<CR>zz", "Move to next quickfix result" },
	["<leader>"] = {
		k = { "<cmd>lnext<CR>zz", "Move to next location list result" },
		j = { "<cmd>lprev<CR>zz", "Move to previous location list result" },
	},
})

wk.register({})
wk.register({
	name = "Yank and paste",
	J = { "mzJ`z", "Join lines" },
	["<leader>y"] = { [["+y]], "Yank to system clipboard" },
	["<leader>Y"] = { [["+Y]], "Yank one line to system clipboard" },
	["<leader>P"] = { [["_dP]], "Paste without yanking" },
	["<leader>d"] = { [["_d]], "Delete without yanking" },
}, {
	mode = { "n", "v" },
})

wk.register({
	name = "Insert mode mappings",
	["<c-s>"] = { "<C-c>:update<CR>", "Save file" },
	["<c-c>"] = { "<Esc>", "Exit insert mode" },
}, {
	mode = "i",
})
wk.register({
	name = "Misc",
	["<c-f>"] = { "<cmd>silent !tmux neww tmux-sessionizer<CR>", "Open tmux sessionizer" },
	["<leader>"] = {
		s = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replace word under cursor" },
		x = { "<cmd>!chmod +x %<CR>", "Make file executable" },
		["<leader>"] = { "<cmd>so<CR>", "Source file" },
	},
}, {
	mode = "n",
})
wk.register({
	["<c-s>"] = { "<C-c>:update<CR>", "Save file" },
}, {
	mode = { "v", "n" },
})
