-- general
vim.keymap.set('n', 'Y', 'yy')
vim.keymap.set('i', '<F2>', '<ESC>:write<CR>')
vim.keymap.set('n', '<Leader>n', ':nohl<CR>', { silent = true })
vim.keymap.set('n', 'Q', '@@')
vim.keymap.set('v', '<Leader>s', ':sort<CR>')
vim.keymap.set('n', '<F4>', ':set list!<CR>', { silent = true })

-- movement
vim.keymap.set('n', '<Leader>i', 'bi')
vim.keymap.set('n', '<Leader>I', 'Bi')
vim.keymap.set('n', '<Leader>a', 'ea')
vim.keymap.set('n', '<Leader>A', 'Ea')
vim.keymap.set('n', '<Leader>o', 'o<Esc>k')
vim.keymap.set('n', '<Leader>O', 'O<Esc>j')

-- yank/paste
vim.keymap.set('n', '<Leader>p', '"+p')
vim.keymap.set('n', '<Leader>y', '"+y')
vim.keymap.set('n', '<Leader>P', '"+P')
vim.keymap.set('n', '<Leader>Y', '"+Y')
vim.keymap.set('v', '<Leader>P', '"+P')
vim.keymap.set('v', '<Leader>Y', '"+Y')
vim.keymap.set('v', '<Leader>p', '"+p')
vim.keymap.set('v', '<Leader>y', '"+y')

-- tabs
vim.keymap.set('n', '<S-Tab>', ':tabprevious<CR>')
vim.keymap.set('n', '<Tab>', ':tabnext<CR>')

-- buffers
vim.keymap.set('n', '<Leader>bn', ':bnext<CR>')
vim.keymap.set('n', '<Leader>bp', ':bprevious<CR>')
vim.keymap.set('n', '<Leader>bd', ':confirm bdelete<CR>')
vim.keymap.set('n', '<Leader>d', ':confirm buffer #<Bar>bdelete #<CR>')

-- window navigation
vim.keymap.set('n', '<M-l>', '<C-w><C-l>')
vim.keymap.set('n', '<M-h>', '<C-w><C-h>')
vim.keymap.set('n', '<M-j>', '<C-w><C-j>')
vim.keymap.set('n', '<M-k>', '<C-w><C-k>')
vim.keymap.set('t', '<M-l>', '<C-\\><C-n><C-w><C-l>')
vim.keymap.set('t', '<M-h>', '<C-\\><C-n><C-w><C-h>')
vim.keymap.set('t', '<M-j>', '<C-\\><C-n><C-w><C-j>')
vim.keymap.set('t', '<M-k>', '<C-\\><C-n><C-w><C-k>')

-- lsp

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = args.buf })

		local opts = { noremap = true, silent = true, buffer = args.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', '<Leader>.', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<Leader>ge', vim.diagnostic.get_next, opts)
		vim.keymap.set('n', '<Leader>gE', vim.diagnostic.get_prev, opts)
		vim.keymap.set('n', '<Leader><space>', vim.diagnostic.open_float, opts)
		vim.keymap.set('n', '<Leader>F', function() vim.lsp.buf.format { async = true } end, opts)
	end
})
