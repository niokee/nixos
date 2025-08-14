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
			{ "gvd", vim.diagnostic.open_float, desc = "Open float" },
			{ "gr=", vim.lsp.buf.declaration, desc = "Go to Declaration" },
			{ "grd", vim.lsp.buf.definition, desc = "Go to Definition" },
			{ "grt", vim.lsp.buf.type_definition, desc = "Go to Type Definition" },
			{ "gri", vim.lsp.buf.implementation, desc = "Go to Implementation" },
			{ "grr", vim.lsp.buf.references, desc = "Go to References" },
			{ "gra", require("actions-preview").code_actions, desc = "View Code Actions" },
			{ "grn", vim.lsp.buf.rename, desc = "Rename" },
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

local function set_python_path(path)
	local clients = vim.lsp.get_clients({
		bufnr = vim.api.nvim_get_current_buf(),
		name = "pyright",
	})
	for _, client in ipairs(clients) do
		if client.settings then
			client.settings.python = vim.tbl_deep_extend("force", client.settings.python, { pythonPath = path })
		else
			client.config.settings =
				vim.tbl_deep_extend("force", client.config.settings, { python = { pythonPath = path } })
		end
		client.notify("workspace/didChangeConfiguration", { settings = nil })
	end
end

-- python setup
vim.lsp.config("pyright", {
	on_attach = function(client, bufnr)
		require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
		vim.api.nvim_buf_create_user_command(bufnr, "LspPyrightOrganizeImports", function()
			client:exec_cmd({
				command = "pyright.organizeimports",
				arguments = { vim.uri_from_bufnr(bufnr) },
			})
		end, {
			desc = "Organize Imports",
		})
		vim.api.nvim_buf_create_user_command(bufnr, "LspPyrightSetPythonPath", set_python_path, {
			desc = "Reconfigure pyright with the provided python path",
			nargs = 1,
			complete = "file",
		})
	end,
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
		".git",
	},
	-- settings = {
	--     pyright = {
	--         -- Using Ruff's import organizer
	--         disableOrganizeImports = true,
	--     },
	--     -- python = {
	--     --     analysis = {
	--     --         -- ignore = { "*" },
	--     --         -- autoImportCompletions = true,
	--     --         -- diagnosticMode = "workspace",
	--     --         -- typeCheckingMode = "standard",
	--     --         -- useLibraryCodeForTypes = true,
	--     --     },
	--     -- },
	-- },
})
vim.lsp.enable("pyright")

vim.lsp.config("ruff", {
	-- If uv is installed, use it to run Ruff
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	on_attach = function(client, _)
		if client.name == "ruff_lsp" then
			-- Disable hover in favor of Pyright
			client.server_capabilities.hoverProvider = false
		end
	end,
})
vim.lsp.enable("ruff")

-- lua setup
vim.lsp.config("lua_ls", {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
})
vim.lsp.enable("lua_ls")

-- golang setup
vim.lsp.config("gopls", {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl", "gohtml" },
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
vim.lsp.enable("gopls")

vim.lsp.config("templ", {})
vim.lsp.enable("templ")

-- rust setup
vim.lsp.config("rust_analyzer", {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy",
			},
			assist = {
				importGranularity = "module",
				importPrefix = "crate",
			},
			cargo = {
				allFeatures = true,
			},
		},
	},
})
vim.lsp.enable("rust_analyzer")

-- nix lang setup
vim.lsp.config("nixd", {
	cmd = { "nixd" },
	filetypes = { "nix" },
})
vim.lsp.enable("nixd")

-- c setup
vim.lsp.enable("clangd")

-- terraform setup
vim.lsp.config("terraformls", {
	cmd = { "terraform-ls", "serve" },
	filetypes = { "terraform", "terraform-vars" },
	root_markers = { ".terraform", ".git" },
})
vim.lsp.enable("terraformls")

vim.lsp.config("tflint", {})
vim.lsp.enable("tflint")

vim.lsp.enable("yamlls")

vim.lsp.config("jsonls", {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json", "jsonc", "tftpl" },
})
vim.lsp.enable("jsonls")

vim.lsp.config("taplo", {
	cmd = { "taplo", "lsp", "stdio" },
})
vim.lsp.enable("taplo")

vim.lsp.config("efm", {
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
vim.lsp.enable("efm")

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
vim.lsp.config("*", {
	capabilities = lsp_capabilities,
})

require("ufo").setup()
