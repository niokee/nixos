local lsp = require('lsp-zero')

-- pre-installed language servers
lsp.preset('recommended')
lsp.ensure_installed({
    'rust_analyzer',
    'pyright',
    'gopls'
})
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

-- nvim-cmp setup
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Replace }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
})
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

-- nvim-autopairs setup
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

-- nvim-ufo setup
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
    require('lspconfig')[ls].setup({
        capabilities = capabilities
        -- you can add other fields for setting up lsp server in this table
    })
end
require("ufo").setup()
-- mappings
lsp.on_attach(function (client, bufnr)
    local wk = require("which-key")
    wk.register({
        name = "LSP",
        ["[d"] = { function() vim.diagnostic.goto_next() end, "Next diagnostic" },
        ["]d"] = { function() vim.diagnostic.goto_prev() end, "Previous diagnostic" },
        ["<leader>"] = {
            vd = { function() vim.diagnostic.open_float() end, "Open diagnostics" },
            vca = { require("actions-preview").code_actions, "Code actions" },
            vrn = { function() vim.lsp.buf.rename() end, "Rename" },
            f = { function() vim.lsp.buf.format({ timeout_ms = 5000 }) end, "Format" },
        },
        gd = { function() vim.lsp.buf.definition() end, "Go to definition" },
        K = { function()
            local winid = require('ufo').peekFoldedLinesUnderCursor()
            if not winid then
                vim.lsp.buf.hover()
            end
        end, "Hover" },
    }, { mode = "n" , remap = false, buffer = bufnr })
    wk.register(
        {
            ["<c-h>"] = { function() vim.lsp.buf.signature_help() end, "Signature help" },
        },
        { mode = {"i"}, buffer = bufnr, remap = false}
    )
end)

-- gopls setup
local lspconfig = require("lspconfig")
local util = require "lspconfig/util"
lspconfig.gopls.setup {
    cmd = {"gopls"},
    filetypes = {"go", "gomod", "gowork", "gotmpl", "gohtml"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams =true
            },
        },
    }
}

-- nvim-diagnostic setup
vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
})

lsp.setup()

