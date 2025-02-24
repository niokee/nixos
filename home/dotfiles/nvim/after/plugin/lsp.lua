local wk = require("which-key")

-- mappings
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if not client then
            return
        end

        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd({ "BufWritePre" }, {
                buffer = event.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = event.buf, id = client.id })
                end,
            })
        end

        local opts = { buffer = event.buf, remap = false }

        wk.add({
            { "<c-h>", vim.lsp.buf.signature_help, desc = "Signature help" },
            mode = "i",
            opts,
        })

        wk.add({
            { "gvd", vim.diagnostic.open_float,               desc = "Open float" },
            { "gr=", vim.lsp.buf.declaration,                 desc = "Go to Declaration" },
            { "grd", vim.lsp.buf.definition,                  desc = "Go to Definition" },
            { "grt", vim.lsp.buf.type_definition,             desc = "Go to Type Definition" },
            { "gri", vim.lsp.buf.implementation,              desc = "Go to Implementation" },
            { "grr", vim.lsp.buf.references,                  desc = "Go to References" },
            { "gra", require("actions-preview").code_actions, desc = "View Code Actions" },
            { "grn", vim.lsp.buf.rename,                      desc = "Rename" },
            {
                "K",
                function()
                    local winid = require("ufo").peekFoldedLinesUnderCursor()
                    if not winid then
                        vim.lsp.buf.hover()
                    end
                end,
                desc = "Hover",
            },
            mode = "n",
            opts,
        })
    end,
})

-- LSP's configs
local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

-- python setup
lspconfig.pyright.setup({
    on_attach = function(client, bufnr)
        require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
    end,
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    settings = {
        pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                autoImportCompletions = true,
                diagnosticMode = "workspace",
                typeCheckingMode = "standard",
                useLibraryCodeForTypes = true,
            },
        },
    },
})

lspconfig.ruff.setup({
    -- If uv is installed, use it to run Ruff
    cmd = vim.fn.executable("uv") == 1 and { "uv", "run", "ruff" } or { "ruff" },
    filetypes = { "python" },
    on_attach = function(client, bufnr)
        if client.name == "ruff_lsp" then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
        end
    end,
})

-- lua setup
lspconfig.lua_ls.setup({
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
})

-- golang setup
lspconfig.gopls.setup({
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl", "gohtml" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            },
        },
    },
})
lspconfig.templ.setup({})

-- nix lang setup
lspconfig.nixd.setup({
    cmd = { "nixd" },
    filetypes = { "nix" },
})

-- c setup
lspconfig.clangd.setup({
    cmd = { "clang" },
})

-- terraform setup
lspconfig.terraformls.setup({
    cmd = { "terraform-ls", "serve", "--log-file='/tmp/terraform-ls-{{pid}}.log'" },
})

lspconfig.tflint.setup({})

lspconfig.yamlls.setup({
    cmd = { "yamlls" },
})

lspconfig.jsonls.setup({
    cmd = { "jsonls" },
})

lspconfig.efm.setup({
    settings = {
        languages = {
            sh = {
                lintCommand = "shellcheck -f gcc -x",
                lintSource = "shellcheck",
                lintFormats = {
                    "%f:%l:%c: %trror: %m",
                    "%f:%l:%c: %tarning: %m",
                    "%f:%l:%c: %tote: %m",
                },
                formatCommand = "shfmt -ci -s -bn",
                formatStdin = true,
            },
        },
    },
    filetypes = { "sh" },
})

-- nvim-diagnostic setup
vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
})

-- nvim-ufo setup
local lsp_capabilities = require("blink.cmp").get_lsp_capabilities()
lsp_capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}
local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
    require("lspconfig")[ls].setup({
        capabilities = lsp_capabilities,
        -- you can add other fields for setting up lsp server in this table
    })
end

require("ufo").setup()
