local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
--vim.api.nvim_set_keymap('n', '<Leader>o', 'o<Esc>0"_D', { noremap = true })
--vim.api.nvim_set_keymap('n', '<Leader>O', 'O<Esc>0"_D', { noremap = true })
map("n", "<leader>bb", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<leader>bn", "<Cmd>BufferNext<CR>", opts)
map("n", "<leader>bc", "<Cmd>BufferClose<CR>", opts)
map("n", "<leader>bp", "<Cmd>BufferPick<CR>", opts)
map('n', '<leader>>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<leader><', '<Cmd>BufferMoveNext<CR>', opts)
map('n', '<leader>q', '<Cmd>Bdelete<CR>', opts)
-- maps for fzf-nvim
map("n", "<leader>fzf", ":FzfLua builtin<CR>", { noremap = true, silent = true })
map("n", "<Leader>fr", '<cmd>lua require("fzf-lua").lsp_references()<CR>', { noremap = true, silent = true })
map("n", "<Leader>fb", '<cmd>lua require("fzf-lua").buffers()<CR>', { noremap = true, silent = true })
map("n", "<Leader>ff", '<cmd>lua require("fzf-lua").files()<CR>', { noremap = true, silent = true })
map("n", "<Leader>fg", '<cmd>lua require("fzf-lua").grep()<CR>', { noremap = true, silent = true })
map("n", "<Leader>fu", '<cmd>lua require("fzf-lua").grep_cword()<CR>', { noremap = true, silent = true })
map("x", "<Leader>fv", '<cmd>lua require("fzf-lua").grep_visual()<CR>', { noremap = true, silent = true })
map("n", "<Leader>fp", '<cmd>lua require("fzf-lua").live_grep()<CR>', { noremap = true, silent = true })
map("n", "<Leader>fb", '<cmd>lua require("fzf-lua").buffers()<CR>', { noremap = true, silent = true })
map("n", "<Leader>ft", '<cmd>lua require("fzf-lua").tabs()<CR>', { noremap = true, silent = true })
map("n", "<Leader>fo", '<cmd>lua require("fzf-lua").oldfiles()<CR>', { noremap = true, silent = true })
map("n", "<Leader>fq", '<cmd>lua require("fzf-lua").quickfix()<CR>', { noremap = true, silent = true })
map("n", "<Leader>fl", '<cmd>lua require("fzf-lua").loclist()<CR>', { noremap = true, silent = true })
map("n", "<Leader>fT", '<cmd>lua require("fzf-lua").tags()<CR>', { noremap = true, silent = true })

-- maps for nvim-tree
-- Define mapping for locating opened file in Nvim-Tree
map("n", "<Leader>ne", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>tl", ":NvimTreeFindFile<CR>", opts)

-- maps for nvim-dap-go

-- Map DapToggleBreakpoint to <Leader>db
map("n", "<Leader>db", "<cmd>DapToggleBreakpoint<CR>", { noremap = true, silent = true })
-- Map the function to open the debugging sidebar to <Leader>dus
map(
	"n",
	"<Leader>dus",
	'<cmd>lua require("dap.ui.widgets").sidebar(require("dap.ui.widgets").scopes).open()<CR>',
	{ noremap = true, silent = true }
)
-- Debug go test
map("n", "<Leader>dgt", '<cmd>lua require("dap-go").debug_test()<CR>', { noremap = true, silent = true })
-- Debug last go test
map("n", "<Leader>dgl", '<cmd>lua require("dap-go").debug_last()<CR>', { noremap = true, silent = true })

-- Spectre for replace
map('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', opts)
map('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', opts)
map('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', opts)
map('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', opts)
