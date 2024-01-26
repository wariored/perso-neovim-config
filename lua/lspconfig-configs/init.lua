-- Setup language servers.
require("nvim-lsp-installer").setup({})
local lspconfig = require("lspconfig")
local null_ls = require("null-ls")
-- Register null-ls formatter
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.completion.spell,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.golines.with({
			-- Set the maximum line length (e.g., 100 characters)
			max_line_length = 89,
		}),
	},
})
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

local function on_attach(client, bufnr)
	if client.name == "null-ls" then
		null_ls.setup_on_attach(client)
	end
end

lspconfig.ruff_lsp.setup {
  on_attach = on_attach,
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
    }
  }
}

lspconfig.tsserver.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig.sumneko_lua.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig.vimls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig.rust_analyzer.setup({
	-- Server-specific settings. See `help lspconfig-setup`
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {},
	},
})
lspconfig.gopls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "gopls" },
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

-- Global mappings.
-- See `help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "vlua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<space>k", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
