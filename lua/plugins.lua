return require('packer').startup(function(use)
	-- colorschemes
	use "wbthomason/packer.nvim"
	use "rebelot/kanagawa.nvim"
	use "folke/tokyonight.nvim"

	use 'neovim/nvim-lspconfig'
	-- auto-completion
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'williamboman/nvim-lsp-installer'

	use "github/copilot.vim"
end)
