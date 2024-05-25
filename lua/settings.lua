-- settings.lua

-- General settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.hidden = true
vim.opt.encoding = 'utf8'
vim.opt.updatetime = 100
vim.opt.timeoutlen = 2000
vim.opt.ttimeoutlen = 0
vim.opt.termguicolors = true

-- Colorscheme
vim.cmd [[colorscheme kanagawa]]

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- foldings
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Plugin-specific settings
vim.cmd [[
  let g:auto_save = 1
  let g:auto_save_keep_undo = 1
  let g:airline#extensions#tabline#enabled = 0
  let g:airline_powerline_fonts = 1
  let g:far#enable_undo = 1
  let g:copilot_no_tab_map = v:true
  let g:copilot_filetypes = { '*' : v:true, 'rust' : v:false }
  let g:rust_format_on_save = v:true
  let g:leetcode_browser = 'chrome'
  let g:leetcode_solution_filetype = 'golang'
  let g:leetcode_hide_paid_only = v:true
]]

require("lspconfig-configs")
require("nvim-cmp-configs")
require("treesitter-configs")
require("nvimtree-configs")
require("nvim-dap-go-configs")
require("gopher-configs")
require("which-key-configs")
require("noice-nvim-configs")
