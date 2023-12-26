-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}
  use({
    "folke/tokyonight.nvim",
    as = "tokyonight"
  })
  use {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  }
  use {'stevearc/dressing.nvim'}
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      {'hrsh7th/cmp-buffer'}, -- source for text in buffer
      {'hrsh7th/cmp-path'}, -- source for file system path
      {'L3MON4D3/LuaSnip'}, -- snippet engine
      {'saadparwaiz1/cmp_luasnip'}, -- for autocompletoin
      {'rafamadriz/friendly-snippets'}, -- usefull snippets
      {"onsails/lspkind.nvim"} -- vs-code like pictograms
    }
  }
  use {'vim-airline/vim-airline'}

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }
  use {'christoomey/vim-tmux-navigator'}
  use {'prettier/vim-prettier'}
end)
