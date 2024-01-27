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

local nvim_tree_events = require("nvim-tree.events")
local bufferline_state = require("bufferline.api")

local function get_tree_size()
	return require("nvim-tree.view").View.width
end


nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_state.set_offset(get_tree_size())
end)
nvim_tree_events.subscribe('Resize', function()
  bufferline_state.set_offset(get_tree_size())
end)
nvim_tree_events.subscribe('TreeClose', function()
  bufferline_state.set_offset(0)
end)
