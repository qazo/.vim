-- neovim specific options
vim.g.mapleader = ' '
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.scrolloff = 3
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
-- remove flags one at a time: a table only matches a consecutive sublist,
-- and 'curdir' must be gone before 'sesdir' can be added (they conflict)
vim.opt.sessionoptions:remove 'folds'
vim.opt.sessionoptions:remove 'options'
vim.opt.sessionoptions:remove 'curdir'
vim.opt.sessionoptions:append 'sesdir'
vim.opt.fileformat = 'unix'
vim.opt.fileformats = 'unix,dos'
vim.opt.splitright = true
vim.opt.termguicolors = true
-- vim.opt.fillchars = 'vert:┃,fold:-'
vim.opt.ignorecase = false
vim.opt.laststatus = 2
vim.opt.backup = false
vim.opt.foldenable = false
vim.opt.smartcase = true
vim.opt.textwidth = 80
vim.opt.completeopt = { 'menu', 'menuone', 'preview' }
