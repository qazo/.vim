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
	use({
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim', config = function() require('mason').setup() end},           -- Optional
			{'williamboman/mason-lspconfig.nvim', config = function()
				local mason_lsp = require('mason-lspconfig')
				mason_lsp.setup()
				mason_lsp.setup_handlers({
					function(server_name)
						require('lspconfig')[server_name].setup({})
					end
				})
			end}, -- Optional

			-- Autocompletion
			{
				'hrsh7th/nvim-cmp',
				config = function()
					local cmp = require('cmp')
					local luasnip = require('luasnip')
					local has_words_before = function()
						local fn = vim.fn
						local col = fn.col '.' -1
						local result = col == 0 or fn.getline('.'):sub(col, col):match '%s'
						return result
					end
					local cmp_config = {
						-- completion = {
						-- 	completeopt = 'menu,preview',
						-- 	autocomplete = true,
						-- },
						snippet = {
							expand = function(args) luasnip.lsp_expand(args.body) end,
						},
						sources = cmp.config.sources({
							{ name = 'nvim_lsp' },
							{ name = 'luasnip' },
							{ name = 'buffer' },
							{ name = 'path' },
						}),
						mapping = {
							['<CR>'] = cmp.mapping.confirm(),
							['<Tab>'] = function(fallback)
								if cmp.visible() then
									cmp.select_next_item()
								elseif luasnip.expand_or_jumpable() then
									luasnip.expand_or_jump()
								elseif has_words_before() then
									cmp.complete()
								else
									fallback()
								end
							end,
							['<S-Tab>'] = function(fallback)
								if cmp.visible() then
									cmp.select_prev_item()
								elseif luasnip.jumpable(-1) then
									luasnip.jump(-1)
								else
									fallback()
								end
							end,
							['<C-Space>'] = cmp.mapping.complete(),
						},
						window = {
							completion = cmp.config.window.bordered(),
							documentation = cmp.config.window.bordered(),
						},
					}
					cmp.setup(cmp_config)
				end
			},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip', config = function()
				require('luasnip.loaders.from_vscode').lazy_load()
			end},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	})

	-- telescope
	use({ 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { {'nvim-lua/plenary.nvim'} } })

	use('tpope/vim-fugitive')
	use('tpope/vim-surround')
	use('tpope/vim-commentary')

	use({ 'shaunsingh/nord.nvim', config = function()
		vim.g.nord_italic = false
		vim.g.nord_borders = true
		require('nord').set()
		vim.cmd('colorscheme nord')
	end })

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
		local treesitter_config = {
			ensure_installed = { "c", "typescript", "javascript", "c_sharp", "cpp", "html", "lua", "vim", "help", "zig" },
			sync_install = false,
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		}
		require('nvim-treesitter.configs').setup(treesitter_config)
	end })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end
return packer.startup(packer_startup)
