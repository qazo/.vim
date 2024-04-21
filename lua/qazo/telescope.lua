local builtin = require('telescope.builtin')

local module = {}

module.setup_keys = function()
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

module.setup = function()
	module.setup_keys()
end

return module
