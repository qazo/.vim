return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = { { 'nvim-lua/plenary.nvim' } },
	config = function()
		require('telescope').setup({})
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<C-p>', builtin.find_files, {})
		vim.keymap.set('n', '<Leader>fs', builtin.live_grep, {})
		vim.keymap.set('n', '<Leader>/', function()
			builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
				winblend = 10,
				previewer = false,
			})
		end, {})
	end
}
