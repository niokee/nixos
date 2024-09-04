require('neogen').setup {
    enabled = true,
    languages = {
        python = {
            template = {
                annotation_convention = "google_docstrings"
                }
        },
    }
}

require("which-key").add({
    {"<leader>cc", "<cmd>Neogen<cr>", desc = "Generate docstring"}
})
