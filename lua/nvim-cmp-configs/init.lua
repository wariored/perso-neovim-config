local cmp = require("cmp")
cmp.setup({
	mapping = {
		["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Shift + Tab to move up
		["<Tab>"] = cmp.mapping.select_next_item(), -- Tab (→|) to move down
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter key to select
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
	},
})
