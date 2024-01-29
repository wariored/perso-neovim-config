return require("packer").startup(function(use)
	-- colorschemes
	use "wbthomason/packer.nvim"
	use "rebelot/kanagawa.nvim"
	use "folke/tokyonight.nvim"

	use "neovim/nvim-lspconfig"
	-- auto-completion
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "hrsh7th/nvim-cmp"
	-- lps libs
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"
	-- Along with nvim-cmp or vsnip users.
	use "hrsh7th/cmp-vsnip"
	use "hrsh7th/vim-vsnip"

	use "github/copilot.vim"

	-- Debugging
	use "mfussenegger/nvim-dap"
	use "rcarriga/nvim-dap-ui"
	use "leoluz/nvim-dap-go"
	-- gophers for go cmd
	use "olexsmir/gopher.nvim"

	use "folke/which-key.nvim"
	-- cmd ui
	use {"folke/noice.nvim", lazy = true, requires={ "MunifTanjim/nui.nvim","rcarriga/nvim-notify"}}
	--[[ tabs
	-- use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
	-- use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
	-- ]]
	use 'romgrk/barbar.nvim'
	-- find and replace in multiple files
	use 'brooth/far.vim'
	-- buffer delete
	-- depends on plenary.nvim
	-- You may need run brew install gnu-sed
	use 'nvim-pack/nvim-spectre'
end)
