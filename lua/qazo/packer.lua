local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

local packer = require('packer')

local startup = function(use)
	use('wbthomason/packer.nvim')
	use({
		'VonHeikemen/lsp-zero.nvim',
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
	})

	-- telescope
	use({ 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { {'nvim-lua/plenary.nvim'} } })

	use('tpope/vim-fugitive')
	use('tpope/vim-surround')
	use('tpope/vim-commentary')

	use({
		'shaunsingh/nord.nvim',
		config = function()
			vim.g.nord_italic = false
			vim.g.nord_borders = true
			require('nord').set()
			vim.cmd('colorscheme nord')
		end
	})

	use({ 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end })

	use({
		'nvim-lualine/lualine.nvim',
		config = function()
			local lualine_config = {
				options = {
					icons_enabled = false,
					section_separators = '',
					component_separators = '',
				},
				sections = {
					lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
				}
			}
			require('lualine').setup(lualine_config)
		end
	})
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end
return packer.startup(startup)
