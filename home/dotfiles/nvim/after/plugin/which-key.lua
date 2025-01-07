local wk = require("which-key")

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
    { "J",         "mzJ`z",            desc = "Join lines" },
    mode = { "n" },
})

wk.add({
    { "<leader>y", '"+y',  desc = "Yank to system clipboard" },
    { "<leader>Y", '"+Y',  desc = "Yank one line to system clipboard" },
    { "<leader>P", '"_dP', desc = "Paste without yanking" },
    { "<leader>d", '"_d',  desc = "Delete without yanking" },
    mode = { "n", "v" },
})

wk.add({
    { "<c-s>", "<C-c>:update<CR>", desc = "Save file" },
    { "<c-c>", "<Esc>",            desc = "Exit insert mode" },
    mode = { "i" },
})
wk.add({
    { "<leader>s",         [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "Replace word under cursor" },
    { "<leader>X",         "<cmd>!chmod +x %<CR>",                                 desc = "Make file executable" },
    { "<leader><leader>x", ":.lua<CR>",                                            desc = "Run line" },
    { "<leader><leader>X", "<cmd>source %<CR>",                                    desc = "Source file" },
    mode = { "n" },
})
wk.add({
    { "<leader><leader>x", ":lua<CR>", desc = "Run selection" },
    mode = { "v" },
})
wk.add({
    { "<c-s>", "<C-c>:update<CR>", desc = "Save file" },
    mode = { "v", "n" },
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
    { "J",         "mzJ`z",            desc = "Join lines" },
    mode = { "n" },
})

wk.add({
    { "<leader>y", '"+y',  desc = "Yank to system clipboard" },
    { "<leader>Y", '"+Y',  desc = "Yank one line to system clipboard" },
    { "<leader>P", '"_dP', desc = "Paste without yanking" },
    { "<leader>d", '"_d',  desc = "Delete without yanking" },
    mode = { "n", "v" },
})

wk.add({
    { "<c-s>", "<C-c>:update<CR>", desc = "Save file" },
    { "<c-c>", "<Esc>",            desc = "Exit insert mode" },
    mode = { "i" },
})
wk.add({
    { "<leader>s",         [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "Replace word under cursor" },
    { "<leader>X",         "<cmd>!chmod +x %<CR>",                                 desc = "Make file executable" },
    { "<leader><leader>x", ":.lua<CR>",                                            desc = "Run line" },
    { "<leader><leader>X", "<cmd>source %<CR>",                                    desc = "Source file" },
    mode = { "n" },
})
wk.add({
    { "<leader><leader>x", ":lua<CR>", desc = "Run selection" },
    mode = { "v" },
})
wk.add({
    { "<c-s>", "<C-c>:update<CR>", desc = "Save file" },
    mode = { "v", "n" },
})

wk.add({
    { "<leader>gs", vim.cmd.Git, desc = "Git status" },
    mode = { "n" },
})
wk.add({
    { "zR", require("ufo").openAllFolds,         desc = "Open all folds" },
    { "zM", require("ufo").closeAllFolds,        desc = "Close all folds" },
    { "zr", require("ufo").openFoldsExceptKinds, desc = "Open all folds except kinds" },
    { "zm", require("ufo").closeFoldsWith,       desc = "Close all folds with" },
    mode = { "n" },
})

wk.add({
    { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle undotree" },
})

wk.add({
    {
        "<leader>xw",
        function()
            for _, client in ipairs(vim.lsp.get_clients()) do
                require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
            end
        end,
        desc = "Populate workspace diagnostics",
    },
})
