local none_ls = require("null-ls")

none_ls.setup({
    sources = {
        -- formatting
        none_ls.builtins.formatting.prettierd,
        none_ls.builtins.formatting.gofmt,
        none_ls.builtins.formatting.goimports,
        none_ls.builtins.formatting.stylua,
        none_ls.builtins.formatting.alejandra,
        -- linters
        none_ls.builtins.diagnostics.yamllint,
        none_ls.builtins.diagnostics.golangci_lint,
        none_ls.builtins.diagnostics.mypy,
    },
})
