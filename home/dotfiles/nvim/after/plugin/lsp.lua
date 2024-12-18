---@diagnostic disable: missing-fields
require("neoconf").setup()

-- nvim-cmp setup
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Insert, count = 1 }

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	mapping = cmp.mapping.preset.insert({
		["<C-e>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-i>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-a>"] = cmp.mapping.abort(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "path" },
	}, {
		{ name = "buffer" },
	}),

	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			require("cmp-under-comparator").under,
			cmp.config.compare.kind,
		},
	},

	-- Use buffer source for `/` and `?`
	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	}),

	-- `:` cmdline setup.
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ napame = "path" },
		}, {
			{ name = "cmdline" },
		}),
		matching = { disallow_symbol_nonprefix_matching = false },
	}),
})
-- nvim-autopairs setup
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- mappings
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf, remap = false }

		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format({ timeout_ms = 5000 })
		end, opts)
		vim.keymap.set("n", "K", function()
			local winid = require("ufo").peekFoldedLinesUnderCursor()
			if not winid then
				vim.lsp.buf.hover()
			end
		end, opts)
		vim.keymap.set("i", "<c-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)

		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.declaration()
		end, opts)
		vim.keymap.set("n", "gD", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "<leader>D", function()
			vim.lsp.buf.type_definition()
		end, opts)
		vim.keymap.set("n", "gi", function()
			vim.lsp.buf.implementation()
		end, opts)
		vim.keymap.set("n", "gr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<c-.>", require("actions-preview").code_actions, opts)
		vim.keymap.set("i", "<c-.>", require("actions-preview").code_actions, opts)
	end,
})

-- LSP's configs
local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local util = require("lspconfig/util")

-- python setup
lspconfig.pyright.setup({
	on_attach = function(client, bufnr)
		require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
	end,
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	capabilities = lsp_capabilities,
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
	cmd = { "ruff" },
	filetypes = { "python" },
	capabilities = lsp_capabilities,
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
	capabilities = lsp_capabilities,
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
	capabilities = lsp_capabilities,
})
lspconfig.templ.setup({
	capabilities = lsp_capabilities,
})

-- nix lang setup
lspconfig.nixd.setup({
	cmd = { "nixd" },
	filetypes = { "nix" },
	capabilities = lsp_capabilities,
})

-- c setup
lspconfig.clangd.setup({
	cmd = { "clang" },
	capabilities = lsp_capabilities,
})

-- terraform setup
lspconfig.terraformls.setup({
	cmd = { "terraform-ls", "serve", "--log-file='/tmp/terraform-ls-{{pid}}.log'" },
	capabilities = lsp_capabilities,
})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	callback = function()
		vim.lsp.buf.format()
	end,
})
lspconfig.tflint.setup({
	capabilities = lsp_capabilities,
})

lspconfig.yamlls.setup({
	cmd = { "yamlls" },
	capabilities = lsp_capabilities,
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
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
	require("lspconfig")[ls].setup({
		capabilities = capabilities,
		-- you can add other fields for setting up lsp server in this table
	})
end

require("ufo").setup()
