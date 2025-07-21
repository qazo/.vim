return {
	{ 'mattn/emmet-vim' },
	{ 'danro/rename.vim' },
	{ 'aklt/plantuml-syntax' },
	{ 'ziglang/zig.vim' },
	{ 'tpope/vim-fugitive' },
	{ 'tpope/vim-surround' },
	{ 'tpope/vim-commentary' },
	{ 'tpope/vim-repeat' },
	{ 'AlexvZyl/nordic.nvim' },
	{ 'neovim/nvim-lspconfig' },
	{ 'williamboman/mason.nvim',           opts = {} },
	{ 'williamboman/mason-lspconfig.nvim', dependencies = { { 'williamboman/mason.nvim' } }, opts = {} },
	{ 'rcarriga/nvim-notify',              opts = { timeout = 4000 } },
	{ 'lewis6991/gitsigns.nvim',           opts = {} },
	{
		'gbprod/nord.nvim',
		config = function()
			vim.cmd([[colorscheme nord]])
		end
	},
	{
		'nvim-treesitter/nvim-treesitter',
		opts = {
			auto_install = true,
			highlight = { enable = true },
		},
	},
	{
		'hrsh7th/nvim-cmp',
		config = function()
			local cmp = require('cmp')
			local config = {
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'buffer' },
					{ name = 'path' },
					{ name = 'lazydev' },
				}),
				mapping = {
					['<C-n>'] = cmp.mapping.select_next_item(),
					['<C-p>'] = cmp.mapping.select_prev_item(),
					['<C-Space>'] = cmp.mapping.complete(),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
			}
			cmp.setup(config)
		end
	},
	{ 'hrsh7th/cmp-nvim-lsp', opts = {} },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'hrsh7th/cmp-nvim-lua' },
}
