-- init.lua

-- Install packer.nvim if not already installed
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Load plugins
require('plugins')

-- Load settings
require('settings')

-- Load keymaps
require('keymaps')
