local wk = require("which-key")
wk.add({
    { "<leader>pv", "<cmd>Neotree filesystem reveal float<CR>", desc = "Open file tree" },
    mode = { "n" },
})
wk.add({
    { "J", ":m '>+1<CR>gv=gv", desc = "Move line down" },
    { "K", ":m '<-2<CR>gv=gv", desc = "Move line up" },
    mode = { "v" },
})
wk.add({
    { "n",         "nzzzv",            desc = "Move to next search result" },
    { "N",         "Nzzzv",            desc = "Move to previous search result" },
    { "<c-d>",     "<C-d>zz",          desc = "Move down half page" },
    { "<c-u>",     "<C-u>zz",          desc = "Move up half page" },
    { "<M-j>",     "<cmd>cprev<CR>zz", desc = "Move to previous quickfix result" },
    { "<M-k>",     "<cmd>cnext<CR>zz", desc = "Move to next quickfix result" },
    { "<leader>k", "<cmd>lnext<CR>zz", desc = "Move to next location list result" },
    { "<leader>j", "<cmd>lprev<CR>zz", desc = "Move to previous location list result" },
    { "J",         "mzJ`z", desc = "Join lines" },
    mode = { "n" },
})

wk.add({
    { "<leader>y", '"+y',   desc = "Yank to system clipboard" },
    { "<leader>Y", '"+Y',   desc = "Yank one line to system clipboard" },
    { "<leader>P", '"_dP',  desc = "Paste without yanking" },
    { "<leader>d", '"_d',   desc = "Delete without yanking" },
    mode = { "n", "v" },
})

wk.add({
    { "<c-s>", "<C-c>:update<CR>", desc = "Save file" },
    { "<c-c>", "<Esc>",            desc = "Exit insert mode" },
    mode = { "i" },
})
wk.add({
    { "<c-f>",     "<cmd>silent !tmux neww tmux-sessionizer<CR>",          desc = "Open tmux sessionizer" },
    { "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "Replace word under cursor" },
    { "<leader>x", "<cmd>!chmod +x %<CR>",                                 desc = "Make file executable" },
    { "<leader><leader>",  "<cmd>so<CR>",                                          desc = "Source file" },
    mode = { "n" },
})
wk.add({
    { "<c-s>", "<C-c>:update<CR>", desc = "Save file" },
    mode = { "v", "n" },
})
