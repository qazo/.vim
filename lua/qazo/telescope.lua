local builtin = require('telescope.builtin')

local module = {}

module.setup_keys = function()
	vim.keymap.set('n', '<Leader>pf', builtin.find_files, {})
	vim.keymap.set('n', '<C-p>', builtin.find_files, {})
	vim.keymap.set('n', '<Leader>ps', function()
		builtin.grep_string({ search = vim.fn.input("Grep > ") })
	end)
end

module.setup = function()
	module.setup_keys()
end

return module
