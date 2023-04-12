
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	  -- Packer can manage itself
	  use 'wbthomason/packer.nvim'
      -- use({"notomo/gesture.nvim"})

use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", 
        setup = function() vim.g.mkdp_filetypes = { "markdown", "MD" , "md" } end, 
        ft = { "markdown" }, })


      use({
          'sainnhe/gruvbox-material',
          as = 'gruvbox-material',

          config = function()
                     vim.cmd('colorscheme gruvbox-material')
          end
      })

      use {
		  'nvim-telescope/telescope.nvim', tag = '0.1.0',
		  -- or                            , branch = '0.1.x',
		  requires = { {'nvim-lua/plenary.nvim'} }
	  
	  }	 
      
             use {
		  'nvim-treesitter/nvim-treesitter',
		  run = function()
			  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			  ts_update()
		  end,
    	  }
	  use {
		  'VonHeikemen/lsp-zero.nvim',
		  requires = {
			  -- LSP Support
			  {'neovim/nvim-lspconfig'},
			  {'williamboman/mason.nvim'},
			  {'williamboman/mason-lspconfig.nvim'},

			  -- Autocompletion
			  {'hrsh7th/nvim-cmp'},
			  {'hrsh7th/cmp-buffer'},
			  {'hrsh7th/cmp-path'},
			  {'saadparwaiz1/cmp_luasnip'},
			  {'hrsh7th/cmp-nvim-lsp'},
			  {'hrsh7th/cmp-nvim-lua'},

			  -- Snippets
			  {'L3MON4D3/LuaSnip'},
			  {'rafamadriz/friendly-snippets'},
		  }
	}

	  use ('christoomey/vim-tmux-navigator')
	  use('nvim-treesitter/playground')
	  use('mbbill/undotree')     
      use('preservim/nerdtree')
      use {
          'numToStr/Comment.nvim',
          config = function()
              require('Comment').setup()
          end
      }
 

	  use('tpope/vim-fugitive')

      use {
          "danymat/neogen",
          config = function()
              require('neogen').setup ({snippet_engine = "luasnip"})
          end,
          requires = "nvim-treesitter/nvim-treesitter",
          -- Uncomment next line if you want to follow only stable versions
          tag = "*"
      }



      
end)




