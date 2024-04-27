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

local packer_startup = function(use)
	use('wbthomason/packer.nvim')
	use('mattn/emmet-vim')
	use('danro/rename.vim')
	use('aklt/plantuml-syntax')
	use('ziglang/zig.vim')
	use({
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim', config = function() end},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp', config = function() require('qazo.cmp').setup() end},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		},
		config = function() require('qazo.lspconfig').setup() end
	})

	-- telescope
	use({ 'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} },
		config = function() require('qazo.telescope').setup() end
	})

	use('tpope/vim-fugitive')
	use('tpope/vim-surround')
	use('tpope/vim-commentary')
	use('tpope/vim-repeat')
	use({'rcarriga/nvim-notify', config = function()
		local notify = require('notify')
		notify.setup({ timeout = 4000 })
		vim.notify = require('notify')
	end})

	use('gbprod/nord.nvim')
	use('AlexvZyl/nordic.nvim')

	use({ 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end })

	use({ 'nvim-lualine/lualine.nvim', config = function()
		local lualine_config = {
			options = {
				icons_enabled = false,
				section_separators = '',
				component_separators = '',
			},
			sections = {
				lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
				lualine_b = { { 'branch', icons_enabled = true }, 'diff', 'diagnostics' },
			}
		}
		require('lualine').setup(lualine_config)
	end })

	use({ 'nvim-treesitter/nvim-treesitter', config = function()
		local config = { auto_install = true, highlight = { enable = true } }
		require('nvim-treesitter.configs').setup(config)
	end })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end
return packer.startup(packer_startup)
