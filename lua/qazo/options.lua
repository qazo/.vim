-- neovim specific options
vim.g.mapleader = ' '
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.scrolloff = 3
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.sessionoptions:remove { 'folds', 'options', 'curdir' }
vim.opt.sessionoptions:append { 'sesdir' }
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
