return {
	'nvim-lualine/lualine.nvim',
	opts = {
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
}
