local wk = require("which-key")
wk.add({
    {"<leader>gs", vim.cmd.Git, desc = "Git status" },
     mode = { "n" },
})
