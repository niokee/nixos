require("nvim-treesitter").install({ "c", "lua", "vim", "query", "python", "rust", "go" })
require("nvim-treesitter.install").compilers = { "clang", "cc" }
vim.filetype.add({
    extension = {
        templ = "templ",
    },
})
