local none_ls = require("null-ls")

none_ls.setup({
    sources = {
        none_ls.builtins.formatting.gofmt,
        none_ls.builtins.formatting.goimports,
        none_ls.builtins.formatting.isort,
        none_ls.builtins.formatting.black,
        none_ls.builtins.diagnostics.ruff,
        none_ls.builtins.formatting.stylua,
        none_ls.builtins.completion.spell,

    },
})
