-- Setup language servers.
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"pyright",
        "pylsp",
		"vimls",
		"gopls",
        "ruff_lsp",
		"jdtls",
	},
    --[[
        handlers = {
                ['jdtls'] = function() end
        }
        ]]--
})

local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
local null_ls = require("null-ls")
-- Register null-ls formatter
null_ls.setup({
	sources = {
		-- null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.diagnostics.eslint,
		-- null_ls.builtins.formatting.prettier,
		-- null_ls.builtins.formatting.black,
		-- null_ls.builtins.completion.spell,
		-- null_ls.builtins.formatting.gofmt,
		-- null_ls.builtins.formatting.goimports,
		--[[ null_ls.builtins.formatting.golines.with({
			-- Set the maximum line length (e.g., 100 characters)
			max_line_length = 89,
		}), ]]--
                null_ls.builtins.code_actions.eslint_d,
                null_ls.builtins.diagnostics.eslint_d,
                null_ls.builtins.formatting.eslint_d,
	},
})
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
local function bemol()
 local bemol_dir = vim.fs.find({ '.bemol' }, { upward = true, type = 'directory'})[1]
 local ws_folders_lsp = {}
 if bemol_dir then
  local file = io.open(bemol_dir .. '/ws_root_folders', 'r')
  if file then

   for line in file:lines() do
    table.insert(ws_folders_lsp, line)
   end
   file:close()
  end
 end

 for _, line in ipairs(ws_folders_lsp) do
  vim.lsp.buf.add_workspace_folder(line)
 end

end
local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
        local opts = { noremap = true, silent = true }

        buf_set_keymap('n', 'gD', '<cmd>FzfLua lsp_type_definitions<CR>', opts)
        buf_set_keymap('n', 'gd', '<cmd>FzfLua lsp_definitions<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>FzfLua lsp_implementations<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>FzfLua lsp_references<CR>', opts)
        buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
        buf_set_keymap('n', '<leader>ll', '<cmd>lua vim.lsp.codelens.run()<cr>', opts)
        buf_set_keymap('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        client.server_capabilities.document_formatting = true
        bemol()
end

lspconfig.ruff_lsp.setup({
	capabilities = vim.lsp.protocol.make_client_capabilities(),
	on_attach = on_attach,
	init_options = {
		settings = {
			args = {},
		},
	},
})

--[[ lspconfig.jdtls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
}) ]]--

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilites = capabilities,
	settings = {
		pyright = { autoImportCompletion = true },
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
				typeCheckingMode = "off",
			},
		},
	},
})

lspconfig.pylsp.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		pylsp = {
			plugins = {
				-- formatter options
				black = { enabled = true },
				autopep8 = { enabled = false },
				yapf = { enabled = false },
				pylint = { enabled = false, executable = "pylint", args = { "--disable=import-error" } },

				-- linter options
				pyflakes = { enabled = false },
				pycodestyle = { enabled = false },
				-- type checker
				pylsp_mypy = { enabled = true },
				-- auto-completion options
				jedi_completion = { enabled = true, fuzzy = true },
				jedi_hover = { enabled = true },
				jedi_references = { enabled = true },
				jedi_signature_help = { enabled = true },
				jedi_symbols = { enabled = true, all_scopes = true },

				-- import sorting
				pyls_isort = { enabled = false },
			},
		},
	},
})

lspconfig.tsserver.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig.jdtls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
lspconfig.vimls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig.rust_analyzer.setup({
	-- Server-specific settings. See `help lspconfig-setup`
	capabilities = capabilities,
	on_attach = on_attach,
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
		vim.keymap.set("n", "<sace>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})


