-- Setup with some options
local nvim_tree = require("nvim-tree")
nvim_tree.setup({
	sort_by = "case_sensitive",
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})
