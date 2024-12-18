-- keymaps.lua

vim.g.mapleader = " "

-- General key mappings
vim.api.nvim_set_keymap("n", "<leader>l", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>c", ":NvimTreeCollapse<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>t", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>na", ":set number<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>nn", ":set nonumber<CR>", { noremap = true, silent = true })

-- Move lines up and down
vim.api.nvim_set_keymap("n", "Ï", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "È", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "Ï", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "È", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "Ï", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "È", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Window resizing
vim.api.nvim_set_keymap("n", "<C-w>>", ":vertical resize +15<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-w><", ":vertical resize -15<CR>", { noremap = true, silent = true })

-- Copilot mapping
vim.api.nvim_set_keymap(
	"i",
	"<C-A>",
	'copilot#Accept("\\<CR>")',
	{ noremap = true, silent = true, expr = true, script = true }
)
-- Telescope
local builtin = require("fzf-lua")
vim.keymap.set("n", "<leader>ff", builtin.files, {}) -- avoid formatting when hitting this command
vim.keymap.set("v", "<leader>fv", builtin.grep_visual, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fl", builtin.live_grep_resume, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.tags, {})
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, {})

-- Aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

