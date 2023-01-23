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
