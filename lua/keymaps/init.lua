--vim.api.nvim_set_keymap('n', '<Leader>o', 'o<Esc>0"_D', { noremap = true })
--vim.api.nvim_set_keymap('n', '<Leader>O', 'O<Esc>0"_D', { noremap = true })

-- maps for fzf-nvim
vim.api.nvim_set_keymap('n', '<leader>fzf', ':FzfLua builtin<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fr', '<cmd>lua require("fzf-lua").lsp_references()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', '<cmd>lua require("fzf-lua").buffers()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>lua require("fzf-lua").files()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', '<cmd>lua require("fzf-lua").grep()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fu', '<cmd>lua require("fzf-lua").grep_cword()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<Leader>fv', '<cmd>lua require("fzf-lua").grep_visual()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fp', '<cmd>lua require("fzf-lua").live_grep()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', '<cmd>lua require("fzf-lua").buffers()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ft', '<cmd>lua require("fzf-lua").tabs()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fo', '<cmd>lua require("fzf-lua").oldfiles()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fq', '<cmd>lua require("fzf-lua").quickfix()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fl', '<cmd>lua require("fzf-lua").loclist()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fT', '<cmd>lua require("fzf-lua").tags()<CR>', { noremap = true, silent = true })

-- maps for nvim-tree
-- Define mapping for locating opened file in Nvim-Tree
vim.api.nvim_set_keymap('n', '<leader>tl', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

-- maps for nvim-dap-go

-- Map DapToggleBreakpoint to <Leader>db
vim.api.nvim_set_keymap('n', '<Leader>db', '<cmd>DapToggleBreakpoint<CR>', { noremap = true, silent = true })
-- Map the function to open the debugging sidebar to <Leader>dus
vim.api.nvim_set_keymap('n', '<Leader>dus', '<cmd>lua require("dap.ui.widgets").sidebar(require("dap.ui.widgets").scopes).open()<CR>', { noremap = true, silent = true })
-- Debug go test
vim.api.nvim_set_keymap('n', '<Leader>dgt', '<cmd>lua require("dap-go").debug_test()<CR>', { noremap = true, silent = true })
-- Debug last go test
vim.api.nvim_set_keymap('n', '<Leader>dgl', '<cmd>lua require("dap-go").debug_last()<CR>', { noremap = true, silent = true })
