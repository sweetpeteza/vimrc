-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use( 'theprimeagen/harpoon' )
  use( 'mbbill/undotree' )
  use( 'tpope/vim-fugitive' )

  use({
      "kdheepak/lazygit.nvim",
      -- optional for floating window border decoration
      requires = {
          "nvim-lua/plenary.nvim",
      },
  })

  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {'williamboman/mason.nvim'},           -- Optional
          {'williamboman/mason-lspconfig.nvim'}, -- Optional

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},         -- Required
          {'hrsh7th/cmp-nvim-lsp'},     -- Required
          {'hrsh7th/cmp-buffer'},       -- Optional
          {'hrsh7th/cmp-path'},         -- Optional
          {'saadparwaiz1/cmp_luasnip'}, -- Optional
          {'hrsh7th/cmp-nvim-lua'},     -- Optional

          -- Snippets
          {'L3MON4D3/LuaSnip'},             -- Required
          {'rafamadriz/friendly-snippets'}, -- Optional
      }
  }

  use ('tanvirtin/monokai.nvim')
  use ('ThePrimeagen/vim-be-good')
  use 'xiyaowong/transparent.nvim'
  --use 'wxfr/minimap.vim'

  --omnisharp
  use ('OmniSharp/omnisharp-vim')
  use 'nickspoons/vim-sharpenup'
  use 'dense-analysis/ale'

  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }


  use 'puremourning/vimspector'

  use {
      'ldelossa/gh.nvim',
      requires = { 'ldelossa/litee.nvim' },
  }

  use 'rcarriga/nvim-notify'

  use {
      'previm/previm',
      config = function()
          vim.g.previm_open_cmd = 'google-chrome'
      end,
  }
  -- Database
  use {
      "tpope/vim-dadbod",
      opt = true,
      requires = {
          "kristijanhusak/vim-dadbod-ui",
          "kristijanhusak/vim-dadbod-completion",
      },
      cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
  }

  use {
      "nvim-neotest/neotest",
      requires = {
          "nvim-lua/plenary.nvim",
          "nvim-treesitter/nvim-treesitter",
          "antoinemadec/FixCursorHold.nvim",
      }
  }

end)
