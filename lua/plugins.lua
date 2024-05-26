-- plugins.lua
-- plugins.lua
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer can manage itself

  use "rebelot/kanagawa.nvim"
  use 'nvim-lua/plenary.nvim'
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  use 'mhinz/vim-startify'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'ryanoasis/vim-devicons'
  use 'terryma/vim-multiple-cursors'
  use { 'junegunn/fzf', run = 'fzf#install()' }
  use 'ibhagwan/fzf-lua'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'dracula/vim'
  use 'morhetz/gruvbox'
  use 'preservim/nerdcommenter'
  use 'airblade/vim-rooter'
  use 'rust-lang/rust.vim'
  use 'ianding1/leetcode.vim'
  use 'lewis6991/gitsigns.nvim'
  use 'mhinz/vim-signify'
  use 'joukevandermaas/vim-ember-hbs'
  use 'OmniSharp/omnisharp-vim'
  use 'pangloss/vim-javascript'
  use 'mxw/vim-jsx'
  use { 'psf/black', branch = 'stable' }
  use '907th/vim-auto-save'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'ggandor/lightspeed.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'projekt0n/github-nvim-theme'
  use 'christoomey/vim-tmux-navigator'
  use {
    "olexsmir/gopher.nvim",
    requires = { -- dependencies
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    },
  }
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
     }
    end
  }
  use 'APZelos/blamer.nvim'
  use {'folke/noice.nvim', requires = {'MunifTanjim/nui.nvim', "rcarriga/nvim-notify"}}
  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}
  use 'tiagovla/scope.nvim'
  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
  }
  use 'stevearc/aerial.nvim'
  -- lspconfig 
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  -- dap
  use 'mfussenegger/nvim-dap'
  use 'leoluz/nvim-dap-go'
  use 'rcarriga/nvim-dap-ui'
  use 'nvim-neotest/nvim-nio'

  -- nvim-cmp and dependencies
  use 'hrsh7th/nvim-cmp' -- The completion plugin
  use 'hrsh7th/cmp-buffer' -- buffer completions
  use 'hrsh7th/cmp-path' -- path completions
  use 'hrsh7th/cmp-cmdline' -- cmdline completions
  use 'saadparwaiz1/cmp_luasnip' -- snippet completions
  use 'hrsh7th/cmp-nvim-lsp' -- LSP completions
  use 'hrsh7th/cmp-nvim-lua' -- Lua completions

end)
